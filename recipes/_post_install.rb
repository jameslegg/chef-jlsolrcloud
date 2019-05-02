#
# Cookbook Name:: chef-jlsolrcloud
# Recipe:: post_install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
solr_install_dir = "/opt/solr-#{node['jlsolrcloud']['install']['version']}"

# Optionally get FluentD Log4j appender.
if node['jlsolrcloud']['fluentd']['source']
  solr_lib_path = "#{solr_install_dir}/server/lib"
  log4j_fluent_lib = "#{solr_lib_path}/log4j-fluentd-with-dependencies.jar"

  remote_file log4j_fluent_lib do
    source node['jlsolrcloud']['fluentd']['source']
    not_if { ::File.exist?(log4j_fluent_lib) }
  end
end

# The default path for solr.in.sh was changed in 5.4.0
# See https://github.com/apache/lucene-solr/commit/872e329a2b7b7bf4e8b26708438932a1157c96a7
solr540  = Gem::Version.new('5.4.0')
solr_ver = Gem::Version.new(node['jlsolrcloud']['install']['version'])
solr_in_sh = '/etc/default/solr.in.sh'
solr_in_sh = "#{node['jlsolrcloud']['solr_home']}/solr.in.sh" \
  if solr_ver < solr540

# Drop in SystemD unit for the service.
# Based on a quick google search + a "translation" of the init.d service.
systemd_unit 'solr.service' do
  content <<-SYSTEMDUNIT.gsub(/^\s+/, '')
  [Unit]
  Description=Apache SOLR
  After=network.target remote-fs.target syslog.target
  [Service]
  User=#{node['jlsolrcloud']['user']}
  Group=#{node['jlsolrcloud']['group']}
  Environment='SOLR_INCLUDE=#{solr_in_sh}'
  Environment='RUNAS=solr'
  ExecStart=/opt/solr/bin/solr start
  Type=forking
  PIDFile=/var/solr/solr-8983.pid
  ExecStop=/opt/solr/bin/solr stop
  PrivateTmp=true
  LimitNOFILE=1048576
  LimitNPROC=1048576
  [Install]
  WantedBy=multi-user.target
  SYSTEMDUNIT
  action %i[create enable]
end
