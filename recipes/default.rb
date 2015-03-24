#
# Cookbook Name:: chef-jlsolrcloud
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'jlsolrcloud::install'
include_recipe 'jlsolrcloud::configure'
