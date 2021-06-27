#
# Cookbook:: workstation
# Recipe:: golang
#
# Copyright:: 2021, The Authors, All Rights Reserved.
remote_file "#{Chef::Config[:file_cache_path]}/go1.16.5.linux-amd64.tar.gz" do
  source 'https://golang.org/dl/go1.16.5.linux-amd64.tar.gz'
end

directory '/usr/local/go' do
  recursive true
  action :delete
end

archive_file "#{Chef::Config[:file_cache_path]}/go1.16.5.linux-amd64.tar.gz" do
  destination '/usr/local'
  overwrite true
  action :extract
end

ruby_block 'Add go to PATH' do
  block do
    file = Chef::Util::FileEdit.new('/etc/bash.bashrc')
    file.insert_line_if_no_match('export PATH="${PATH}:/usr/local/go/bin"', 'export PATH="${PATH}:/usr/local/go/bin"')
    file.write_file
  end
end
