describe service('solr') do
  it { should be_running }
end

describe port(8983) do
  it { should be_listening }
  its('processes') { should include 'java' }
end
