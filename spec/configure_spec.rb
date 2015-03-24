#
# Cookbook Name:: jlsolrcloud
# Spec:: default
#
# Copyright (c) 2015 James Legg
require 'helpers/spec_helper'

describe 'jlsolrcloud::configure' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['jlsolrcloud']['zkhosts'] = ['zkhost1:2181']
      end.converge(described_recipe)
    end

    it 'creates the /var/solr/solr.in.sh template' do
      expect(chef_run).to create_template('/var/solr/solr.in.sh')
    end

    it 'enable the solr service' do
      expect(chef_run).to enable_service('solr')
    end
  end
end
