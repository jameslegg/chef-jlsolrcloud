#
# Cookbook Name:: jlsolrcloud
# Spec:: default
#
# Copyright (c) 2015 James Legg
require 'helpers/spec_helper'

describe 'jlsolrcloud::configure' do
  context 'When all attributes are default, on an unspecified platform and lock
          isnt held' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['jlsolrcloud']['zkhosts'] = ['zkhost1:2181']
      end.converge(described_recipe)
    end

    it 'does not create the /var/solr/solr.in.sh template' do
      expect(chef_run).to_not create_template('/var/solr/solr.in.sh')
    end

    it 'enables the solr service' do
      expect(chef_run).to enable_service('solr')
    end

    it 'creates logs directory' do
      expect(chef_run).to create_directory('/var/solr/logs')
    end

    it 'does not create cookbooks default solr.xml' do
      expect(chef_run).to_not render_file('/var/solr/solr.xml')
    end

    it 'does not create default log4j.properties file' do
      expect(chef_run).to_not render_file('/var/solr/log4j.properties')
    end

    it 'does not create cookbooks default solr startup script' do
      expect(chef_run).to_not render_file('/opt/solr/bin/solr')
    end

    it 'does not set ENABLE_REMOTE_JMX_OPTS="false" in solr.in.sh' do
      expect(chef_run).to_not render_file('/var/solr/solr.in.sh')
    end
  end

  context "When we have node['jlsolrcloud']['solr_home_override'] set and do
          not hold the lock" do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['jlsolrcloud']['zkhosts'] = ['zkhost1:2181']
        node.set['jlsolrcloud']['solr_home_override'] = '/vol/solr'
      end.converge(described_recipe)
    end

    it 'creates directory for override ' do
      expect(chef_run).to create_directory('/vol/solr')
    end

    it 'creates logs directory for override ' do
      expect(chef_run).to create_directory('/vol/solr/logs')
    end

    it 'does not create default log4j.properties file' do
      expect(chef_run).to_not render_file('/var/solr/log4j.properties')
    end

    it 'does not create default solr.xml' do
      expect(chef_run).to_not render_file('/vol/solr/solr.xml')
    end
  end

  context 'JMX remote debugging service enabled on port 12345 and we do not
          hold the lock' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['jlsolrcloud']['zkhosts'] = ['zkhost1:2181']
        node.set['jlsolrcloud']['remote_jmx'] = true
        node.set['jlsolrcloud']['rmi_port'] = '12345'
      end.converge(described_recipe)
    end

    it 'does not set ENABLE_REMOTE_JMX_OPTS="true" in solr.in.sh' do
      expect(chef_run).to_not render_file('/var/solr/solr.in.sh')
    end

    it 'does not set RMI_PORT="12345" in solr.in.sh' do
      expect(chef_run).to_not render_file('/var/solr/solr.in.sh')
    end
  end

  context 'When all attributes are default, on an unspecified platform and
          lock is held' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['jlsolrcloud']['zkhosts'] = ['zkhost1:2181']
      end.converge(described_recipe)
    end

    # Currently not possible to test this case as the return value of Clocker
    # needs to be mocked and Clock is a library from an external cookbook which
    # prevents us from doing this. see:
    # https://github.com/sethvargo/chefspec/issues/562
  end
end
