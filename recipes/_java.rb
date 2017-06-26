# Java attributes to meet minimum requirement.
node.default['java']['jdk_version'] = '8'
node.default['java']['install_flavor'] = 'oracle'
node.default['java']['set_default'] = true

# Override this with your hosted version of
# the JDK
node.default['java']['jdk']['8']['x86_64']['url'] = ''
node.default['java']['jdk']['8']['x86_64']['checksum'] = '467f323ba38df2b87311a7818bcbf60fe0feb2139c455dfa0e08ba7ed8581328'
node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['java']['arch'] = node['kernel']['machine']

include_recipe 'java::default'
