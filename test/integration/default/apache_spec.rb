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

# Log Checks
describe directory('/data/logs') do
  it { should be_directory }
  it { should be_owned_by 'apache' }
  it { should be_grouped_into 'apache' }
  its('mode') { should eq 0755 }
end

# describe apache_conf do
#   its('ServerTokens') { should eq 'Prod' }
# end

# Check for modules
describe command('httpd -M | grep proxy_http_module') do
  its('stdout') { should eq " proxy_http_module (shared)\n" }
end
