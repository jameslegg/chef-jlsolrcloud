require 'spec_helper'

describe process('java') do
  its(:user) { should eq 'solr' }
  its(:group) { should eq 'solr' }
  its(:args) { should match(/solr/) }
end

describe port(8983) do
  it { should be_listening.with('tcp') }
end
