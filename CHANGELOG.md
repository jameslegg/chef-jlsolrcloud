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
