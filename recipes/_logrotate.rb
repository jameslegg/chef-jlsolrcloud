include_recipe 'logrotate'

logrotate_app 'solr' do
  path '/var/solr/log/solr-8983-console.log'
  frequency 'daily'
  rotate 3
  only_if node['jlsolrcloud']['log_rotate']
end
