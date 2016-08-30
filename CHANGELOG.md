### 0.7.2
 - Fix OutOfMemory handling in Solr init script. This is a bug in Solr 5.2.1
 and is fixed in 5.5.1+. We have backported the fix here. The arguments were
 being passed in, in the wrong order and ignored.
 See - https://issues.apache.org/jira/browse/SOLR-8145

### 0.7.1
 - Specify correct zk dependency in Gemfile

### 0.7.0
 - Make it easy to converge the recipe in a test kitchen by installing
   zookeeper in the test kitchen.
 - Ensure initial JVM memory is always less than the maximum
 - Update chef spec tests

### 0.6.0
 - Use clocker to only restart one node on the cluster at a time
 - Correct log4j log location

### 0.4.0
 - Add attributes to control logrotation of console logs, change defaults to
   weekly and keep 3 log files
 - Configure log4j logging with sensible default

### 0.4.0
 - Upgrade to work with solr 5.2.1

### 0.3.0
 - add node['jlsolrcloud]['remote_jmx'] and optional rmi_port attributes
   to enable remote JMX
 - more complete chefspec coverage for jlsolrcloud::configure

### 0.2.2
 - append console output to file using >> instead of > to make logrotate
   copytruncate work

### 0.2.1
 - copytruncate the log file

### 0.2.0
 - Add Options to manage rotation of Garbage Collection Logs
 - Rotate the log from solr's standard out.
