# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

title 'SSH Client Config'

# The system-wide client ssh configuration file should only be modified by its owner (root).
control 'basic-6' do
  impact 0.5
  title 'ssh_config should have restricted access to 0644'
  desc '
    The system-wide client ssh configuration file
    should only be modified by its owner (root).
  '
  describe file('/etc/ssh/ssh_config') do
    its('mode') { should cmp '0644' }
  end
end

# OpenSSH should be configured to the network family. Set it to inet if you use IPv4 only. For IPv6 only set it to inet6.
control 'ssh-1' do
  impact 0.1
  title 'Client: Configure address family'
  desc '
    OpenSSH should be configured to the network family.
    Set it to inet if you use IPv4 only. For IPv6 only set it
    to inet6.
  '
  describe ssh_config do
    its('AddressFamily') { should match(/inet|any/) }
  end
end
