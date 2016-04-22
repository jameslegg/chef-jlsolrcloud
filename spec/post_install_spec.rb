#
# Cookbook Name:: jlsolrcloud
# Spec:: _post_install
#
# Copyright (c) 2015 James Legg
require 'helpers/spec_helper'

describe 'jlsolrcloud::_post_install' do
  context 'When fluentd appender is installed, on 14.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['jlsolrcloud']['zkhosts'] = ['zkhost1:2181']
        node.set['jlsolrcloud']['fluentd']['source'] = 'https://some/url'
      end.converge(described_recipe)
    end

    it 'gets fluentd appender' do
      expect(chef_run).to create_remote_file(
        '/opt/solr-6.0.0/server/lib/log4j-fluentd-with-dependencies.jar'
      ).with(
        source: 'https://some/url'
      )
    end
  end
end
