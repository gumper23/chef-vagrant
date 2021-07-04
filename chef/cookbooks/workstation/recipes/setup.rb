#
# Cookbook:: workstation
# Recipe:: setup
#
# Copyright:: 2021, The Authors, All Rights Reserved.
timezone 'America/Los_Angeles' do
  action :set
end

package 'ntp' do
  action :install
end

package 'ntpdate' do
  action :install
end

package 'jq' do
  action :install
end

package 'tree' do
  action :install
end

package 'zsh' do
  action :install
end

package 'mycli' do
  action :install
end

package 'silversearcher-ag' do
  action :install
end

include_recipe 'percona::default'

log "lsb_release #{node['lsb']['codename']}"
