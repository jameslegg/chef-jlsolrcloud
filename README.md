# chef-jlsolrcloud

A basic cookbook to install solr5 using the Solr provided shell script.

[clocker](https://github.com/jameslegg/chef-locker) is used to prevent configuration
changes restarting nodes across the cluster.

It enables the service using the default init.d script provided.

Some configuration is done to the /var/solr/solr.in.sh 
