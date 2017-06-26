default['jlsolrcloud']['user']  = 'solr'
default['jlsolrcloud']['group'] = 'solr'
default['jlsolrcloud']['user_home'] = '/home/solr'

# Changing this will require mods to how we use the solr install script
default['jlsolrcloud']['solr_home'] = '/var/solr'

# If required set default['jlsolrcloud']['install']['local_cache']
# to a local location for faster access to solr
default['jlsolrcloud']['install']['url'] = 'https://archive.apache.org/dist/lucene/solr/'
default['jlsolrcloud']['install']['version'] = '5.2.1'

# Set this to false to NOT use logrotate to mange the solr Console log
# NOTE: log4j.properties is used to configure the main logs
default['jlsolrcloud']['log_rotate']['enable'] = true
# number of Console logs to keep
default['jlsolrcloud']['log_rotate']['rotate'] = 3
# one of logrotates time specifics (hourly, daily, weekly)
default['jlsolrcloud']['log_rotate']['frequency'] = 'weekly'

# Set this to true to enable remote JMX RMI connector applications
default['jlsolrcloud']['remote_jmx'] = false
# Set RMI port for use by JMX below if enabling remote_jmx
# default['jlsolrcloud']['rmi_port'] = '18985'
