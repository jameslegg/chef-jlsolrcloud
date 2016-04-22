default['jlsolrcloud']['user']  = 'solr'
default['jlsolrcloud']['group'] = 'solr'
default['jlsolrcloud']['user_home'] = '/home/solr'

# Changing this will require mods to how we use the solr install script
default['jlsolrcloud']['solr_home'] = '/var/solr'

# If required set default['jlsolrcloud']['install']['local_cache']
# to a local location for faster access to solr
default['jlsolrcloud']['install']['url'] = 'http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/'
default['jlsolrcloud']['install']['version'] = '6.0.0'

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

# We have an AMI that preinstalls Solr so don't want to spend time downloading
# the installers
default['jlsolrcloud']['install_solr'] = true

# Optional FluentD logger is enabled by setting a location for the JAR file.
default['jlsolrcloud']['fluentd']['source'] = nil
default['jlsolrcloud']['fluentd']['host'] = 'localhost'
default['jlsolrcloud']['fluentd']['port'] = 24_224
default['jlsolrcloud']['fluentd']['tag'] = 'solr'
