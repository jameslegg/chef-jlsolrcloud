# Install a local zk node to test against.
node.override['zk']['zoo_myid'] = 0
include_recipe 'conv_zookeeper::default'

# Exercices the solr cookbook now.
# rubocop:disable Metrics/LineLength
node.override['java']['jdk']['8']['x86_64']['url'] = 'https://s3.amazonaws.com/conversocial-chef-public/jdk-8u101-linux-x64.tar.gz'
node.override['java']['jdk']['8']['x86_64']['checksum'] = '467f323ba38df2b87311a7818bcbf60fe0feb2139c455dfa0e08ba7ed8581328'
# rubocop:enable Metrics/LineLength
include_recipe 'jlsolrcloud::default'
