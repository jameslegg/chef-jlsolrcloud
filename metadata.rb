name             'jlsolrcloud'
maintainer       'James Legg'
maintainer_email 'mail@jameslegg.co.uk'
license          'Apache-2.0'
description      'Installs/Configures solrcloud'
long_description 'Installs/Configures solrcloud 5'
version          '3.0.1'

chef_version '>= 14.8' if respond_to?(:chef_version)
supports 'ubuntu', '= 18.04'

depends 'java'
depends 'clocker', '~> 0.3'
