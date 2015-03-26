# Overide the solr.in.sh script we get from the install script

if node['jlsolrcloud']['zkhosts'].length < 1
  fail "At least one zkhost is needed in node['jlsolrcloud']['zkhosts']"
end

if node['jlsolrcloud']['solr_home_override']
  directory node['jlsolrcloud']['solr_home_override'] do
    owner  node['jlsolrcloud']['user']
    group  node['jlsolrcloud']['group']
    mode   0755
    recursive true
  end

  cookbook_file "#{node['jlsolrcloud']['solr_home_override']}/solr.xml" do
    source 'solr.xml'
    user   node['jlsolrcloud']['user']
    group  node['jlsolrcloud']['group']
    mode   0755
    notifies :restart, 'service[solr]'
  end
end


template "#{node['jlsolrcloud']['solr_home']}/solr.in.sh" do
  user  node['jlsolrcloud']['user']
  group node['jlsolrcloud']['group']
  mode  0755
  notifies :restart, 'service[solr]'
end

service 'solr' do
  action [:enable, :start]
end
