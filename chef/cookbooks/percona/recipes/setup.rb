package 'gnupg2' do
  action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/percona-release_latest.#{node['lsb']['codename']}_all.deb" do
  source "https://repo.percona.com/apt/percona-release_latest.#{node['lsb']['codename']}_all.deb"
  action :create
end

log "Using dpkg to install #{Chef::Config[:file_cache_path]}/percona-release_latest.#{node['lsb']['codename']}_all.deb" do
  level :info
end

dpkg_package "#{Chef::Config[:file_cache_path]}/percona-release_latest.#{node['lsb']['codename']}_all.deb" do
  action :install
end

execute 'enable percona repository' do
  command '/usr/bin/percona-release setup ps80 && touch /etc/apt/sources.list.d/.percona-release-setup-ps80'
  creates '/etc/apt/sources.list.d/.percona-release-setup-ps80'
  action :run
end

apt_update 'update' do
  action :update
end

package 'percona-toolkit' do
  action :install
end

package 'percona-server-server' do
  action :install
end

package 'mytop' do
  action :install
end

service 'mysql' do
  action [ :start, :enable ]
end

log "lsb_release #{node['lsb']['codename']}"
