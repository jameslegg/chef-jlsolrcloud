default['jlsolrcloud']['user']  = 'solr'
default['jlsolrcloud']['group'] = 'solr'
default['jlsolrcloud']['user_home'] = '/home/solr'

# Changing this will require mods to how we use the solr install script
default['jlsolrcloud']['solr_home'] = '/var/solr'

# If required set default['jlsolrcloud']['install']['local_cache']
# to a local location for faster access to solr
default['jlsolrcloud']['install']['url'] = 'http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/'
default['jlsolrcloud']['install']['version'] = '5.0.0'
