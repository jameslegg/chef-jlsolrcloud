#
# Cookbook Name:: jlsolrcloud
# Spec:: install
#
# Copyright (c) 2015 James Legg
require 'helpers/spec_helper'

describe 'jlsolrcloud::install' do
  context 'When all attributes are default, on 14.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['jlsolrcloud']['zkhosts'] = ['zkhost1:2181']
      end.converge(described_recipe)
    end

    it 'includes apt recipe ' do
      expect(chef_run).to include_recipe('apt')
    end

    it 'includes jlsolrcloud::_java recipe ' do
      expect(chef_run).to include_recipe('jlsolrcloud::_java')
    end

    it 'includes jlsolrcloud::user recipe ' do
      expect(chef_run).to include_recipe('jlsolrcloud::user')
    end

    it 'install unzip package ' do
      expect(chef_run).to install_package('unzip')
    end

    it 'creates solr tar file' do
      expect(chef_run).to create_remote_file_if_missing(
        '/var/chef/cache/solr-5.4.1.tgz')
    end

    it 'unzips the install script file' do
      untar_script = 'tar xzf solr-5.4.1.tgz '
      untar_script << 'solr-5.4.1/bin/install_solr_service.sh'
      untar_script << ' --strip-components=2'

      expect(chef_run).to run_execute(untar_script).with(
        cwd: '/var/chef/cache')
    end

    it 'runs the install script file' do
      expect(chef_run).to run_bash('run solr install script').with(
        code: './install_solr_service.sh solr-5.4.1.tgz',
        cwd: '/var/chef/cache')
    end
  end
end
