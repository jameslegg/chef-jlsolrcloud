# chef-jlsolrcloud

A basic cookbook to install solr5 using the Solr provided shell script.

[clocker](https://github.com/jameslegg/chef-locker) is used to prevent configuration
changes restarting nodes across the cluster.

It enables the service using the default init.d script provided.

Some configuration is done to the /var/solr/solr.in.sh 


# Attributes

## JMX metrics
Solr exposes internal metrics using JMX.
This cookbook supports configuring JMX and JmxTrans to push metrics to
a centralised service.

### `['jlsolrcloud']['remote_jmx']`

  * Type: `Boolean`
  * Default: `false`
  * Description: Enable JMX support in solr.

### `['jlsolrcloud']['jmxtrans']['interval']`

  * Type: `Integer`
  * Default: `60`
  * Description: Interval between metric collections.
