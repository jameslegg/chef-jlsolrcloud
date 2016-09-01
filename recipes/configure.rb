include_recipe 'clocker'

# Take a cluster wide lock on restarting the solr node
clocker 'solr-node-restart' do
  lockid 'solr-node-restart'
  lockwait 30
  zookeeper node['jlsolrcloud']['zkhosts'].sample
  action :clockon
end

if node['jlsolrcloud']['zkhosts'].length < 1
  raise "At least one zkhost is needed in node['jlsolrcloud']['zkhosts']"
end

if node['jlsolrcloud']['solr_home_override']
  directory node['jlsolrcloud']['solr_home_override'] do
    owner  node['jlsolrcloud']['user']
    group  node['jlsolrcloud']['group']
    mode   0755
    recursive true
  end

  directory "#{node['jlsolrcloud']['solr_home_override']}/logs" do
    owner  node['jlsolrcloud']['user']
    group  node['jlsolrcloud']['group']
    mode   0755
  end

  cookbook_file "#{node['jlsolrcloud']['solr_home_override']}/solr.xml" do
    source 'solr.xml'
    user   node['jlsolrcloud']['user']
    group  node['jlsolrcloud']['group']
    mode   0755
    only_if { Clocker.held?('solr-node-restart', run_context) }
    notifies :restart, 'service[solr]'
  end
else
  cookbook_file "#{node['jlsolrcloud']['solr_home']}/solr.xml" do
    source 'solr.xml'
    user   node['jlsolrcloud']['user']
    group  node['jlsolrcloud']['group']
    mode   0755
    only_if { Clocker.held?('solr-node-restart', run_context) }
    notifies :restart, 'service[solr]'
  end

  directory "#{node['jlsolrcloud']['solr_home']}/logs" do
    owner  node['jlsolrcloud']['user']
    group  node['jlsolrcloud']['group']
    mode   0755
  end
end

template "#{node['jlsolrcloud']['solr_home']}/solr.in.sh" do
  user  node['jlsolrcloud']['user']
  group node['jlsolrcloud']['group']
  mode  0755
  only_if { Clocker.held?('solr-node-restart', run_context) }
  notifies :restart, 'service[solr]'
end

cookbook_file '/var/solr/log4j.properties' do
  user  node['jlsolrcloud']['user']
  group node['jlsolrcloud']['group']
  mode  0755
  only_if { Clocker.held?('solr-node-restart', run_context) }
  notifies :restart, 'service[solr]'
end

# We have two changes to this file
# 1) to allow us to rotate the console log using copy/truncate methods without
# restarting solr
# 2) A backported fix to make OutOfMemory handling actually work
cookbook_file '/opt/solr/bin/solr' do
  user  node['jlsolrcloud']['user']
  group node['jlsolrcloud']['group']
  mode  0755
  # notify immediatly so that on first run Solr will
  # be running as directed for any other chef things
  # that may want to use it's API
  only_if { Clocker.held?('solr-node-restart', run_context) }
  notifies :restart, 'service[solr]', :immediately
end

# Release the solr node restart lock
clocker 'solr-node-restart' do
  lockid 'solr-node-restart'
  zookeeper node['jlsolrcloud']['zkhosts'].sample
  action :clockoff
end

service 'solr' do
  action [:enable, :start]
end
