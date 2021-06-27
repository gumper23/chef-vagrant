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
  destination '/usr/local/go'
  action :extract
end
