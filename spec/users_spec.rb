#
# Cookbook Name:: jlsolrcloud
# Spec:: user
#
# Copyright (c) 2015 James Legg
require 'helpers/spec_helper'

describe 'jlsolrcloud::user' do
  context 'When all attributes are default, on 14.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['jlsolrcloud']['zkhosts'] = ['zkhost1:2181']
      end.converge(described_recipe)
    end

    it 'create solr group' do
      expect(chef_run).to create_group('solr')
    end

    it 'create solr user' do
      expect(chef_run).to create_user('solr').with(group: 'solr')
    end
  end
end
