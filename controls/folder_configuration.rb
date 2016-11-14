# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

title 'SSH Folder Configuration'

# In order for OpenSSH to function correctly, its configuration path must be a folder.
control 'basic-1' do
  impact 1.0
  title '/etc/ssh should be a directory'
  desc '
    In order for OpenSSH to function correctly, its
    configuration path must be a folder.
  '
  describe file('/etc/ssh') do
    it { should be_directory }
  end
end

# The OpenSSH configuration folder should be owned by the root user. It is an important step towards making sure, that configuration files are only changed by priviledged users.
control 'basic-2' do
  impact 1.0
  title '/etc/ssh should be owned by root'
  desc '
    The OpenSSH configuration folder should be owned
    by the root user. It is an important step towards making
    sure, that configuration files are only changed by
    priviledged users.
  '
  describe file('/etc/ssh') do
    it { should be_owned_by 'root' }
  end
end

# The OpenSSH configuration folder should have restricted access permissions. It is an important step towards making sure, that configuration files are only changed by priviledged users, while leaving them readable for the SSH client.
control 'basic-3' do
  impact 0.5
  title '/etc/ssh should have limited access to 0755'
  desc '
    The OpenSSH configuration folder should have restricted
    access permissions. It is an important step towards making
    sure, that configuration files are only changed by
    priviledged users, while leaving them readable for the
    SSH client.
  '
  describe file('/etc/ssh') do
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('others') }
    it { should_not be_readable.by('others') }
  end
end
