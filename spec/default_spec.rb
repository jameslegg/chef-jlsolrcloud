#
# Cookbook Name:: jlsolrcloud
# Spec:: default
#
# Copyright (c) 2015 James Legg
require 'helpers/spec_helper'

describe 'jlsolrcloud::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['jlsolrcloud']['zkhosts'] = ['zkhost1:2181']
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'includes install recipe ' do
      expect(chef_run).to include_recipe('jlsolrcloud::install')
    end

    it 'includes configure recipe ' do
      expect(chef_run).to include_recipe('jlsolrcloud::configure')
    end
  end
end
