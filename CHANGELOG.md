### 2.1.2
- Update location of Solr files

### 2.1.1
 - Extend fluentd log events.

### 2.1.0
 - Allow zookeeper path to be specified

### 2.0.0
 - Install Solr 6.0.0 by default

### 1.2.1
 - Make sure the fluentd logger is added to prebuilt images, but only if needed.

### 1.2.0
 - Add optional FluentD logger to solr.

### 1.1.3
 - Remove symlink and create settings file in the correct directory

### 1.1.2
 - Workaround bug in Solr 5.4.1 where it looks for settings file in a different
 location to the one in the docs by symlinking the file to the expected
 directory

### 1.1.1
 - Rubocop fix

### 1.1.0
 - Add switch to enable skipping Solr install

### 1.0.0
 - Upgrade Solr to v5.4.1
 - Make all Solr process restarts immediate after config file changes

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
