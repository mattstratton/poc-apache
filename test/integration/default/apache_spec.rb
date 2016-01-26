# Service and Package Checks
describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

# Webroot Checks
describe directory('/data/websites') do
  it { should be_directory }
  it { should be_owned_by 'apache' }
  it { should be_grouped_into 'apache' }
  its('mode') { should eq 0755 }
end
