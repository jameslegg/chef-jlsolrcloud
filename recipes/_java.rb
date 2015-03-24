# Java attributes to meet minimum requirement.
# http://lucene.apache.org/solr/4_10_0/SYSTEM_REQUIREMENTS.html
node.default['java']['jdk_version'] = '7'
node.default['java']['install_flavor'] = 'oracle'
node.default['java']['set_default'] = true
node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['java']['arch'] = node['kernel']['machine']

include_recipe 'java::default'
