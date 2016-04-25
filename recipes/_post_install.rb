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
