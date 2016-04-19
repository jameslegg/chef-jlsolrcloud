#
# Cookbook Name:: chef-jlsolrcloud
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#
# We have an AMI that preinstalls Solr so want to skip this to save time
include_recipe 'jlsolrcloud::install' if node['jlsolrcloud']['install_solr']
include_recipe 'jlsolrcloud::_post_install'
include_recipe 'jlsolrcloud::configure'
