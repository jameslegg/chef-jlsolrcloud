include_recipe 'logrotate'

# This configure log rotation for the default solr console log ONLY
logrotate_app 'solr' do
  path "#{node['jlsolrcloud']['solr_home']}/logs/solr-8983-console.log"
  cookbook 'jlsolrcloud'
  frequency node['jlsolrcloud']['log_rotate']['frequency']
  rotate node['jlsolrcloud']['log_rotate']['rotate']
  only_if node['jlsolrcloud']['log_rotate']
end
