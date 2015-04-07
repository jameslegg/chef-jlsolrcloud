include_recipe 'logrotate'

logrotate_app 'solr' do
  path "#{node['jlsolrcloud']['solr_home']}/logs/solr-8983-console.log"
  cookbook 'jlsolrcloud'
  frequency 'daily'
  rotate 3
  only_if node['jlsolrcloud']['log_rotate']
end
