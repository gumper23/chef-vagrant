package 'gnupg2' do
  action :install
end

remote_file "/tmp/percona-release_latest.#{node['lsb']['codename']}_all.deb" do
  source "https://repo.percona.com/apt/percona-release_latest.#{node['lsb']['codename']}_all.deb"
  action :create
end

dpkg_package "/tmp/percona-release_latest.#{node['lsb']['codename']}_all.deb" do
  action :install
end

apt_update 'update' do
  action :update
end

package 'percona-toolkit' do
  action :install
end

package 'percona-server-server-5.7' do
  action :install
end

service 'mysql' do
  action [ :start, :enable ]
end

log "lsb_release #{node['lsb']['codename']}"
