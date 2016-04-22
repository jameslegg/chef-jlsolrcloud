include_recipe 'apt'
include_recipe 'jlsolrcloud::_java'
include_recipe 'jlsolrcloud::user'

package 'unzip'

# Install SolrCloud 6 using the default Apache install script
solr_tar = "#{Chef::Config[:file_cache_path]}/"
solr_tar << "solr-#{node['jlsolrcloud']['install']['version']}.tgz"

# use a local faster cache if defined
if node['jlsolrcloud']['install']['local_cache']
  solr_url = node['jlsolrcloud']['install']['local_cache']
else
  solr_url = node['jlsolrcloud']['install']['url']
  solr_url << "#{node['jlsolrcloud']['install']['version']}/"
  solr_url << "solr-#{node['jlsolrcloud']['install']['version']}.tgz"
end

remote_file solr_tar do
  source solr_url
  action :create_if_missing
end

untar_script = "tar xzf solr-#{node['jlsolrcloud']['install']['version']}.tgz "
untar_script << "solr-#{node['jlsolrcloud']['install']['version']}/bin/"
untar_script << 'install_solr_service.sh --strip-components=2'

install_script = "#{Chef::Config[:file_cache_path]}/install_solr_service.sh"

execute untar_script do
  cwd Chef::Config[:file_cache_path]
  not_if { ::File.exist?(install_script) }
end

# This is where the install scipts put solr by default
solr_install_dir = "/opt/solr-#{node['jlsolrcloud']['install']['version']}"

run_install_script = './install_solr_service.sh '
run_install_script << "solr-#{node['jlsolrcloud']['install']['version']}.tgz"

bash 'run solr install script' do
  code run_install_script
  cwd Chef::Config[:file_cache_path]
  not_if { ::File.exist?(solr_install_dir) }
end
