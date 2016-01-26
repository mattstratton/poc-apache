#
# Cookbook Name:: securian-apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

directory '/data/websites' do
  owner 'apache'
  mode '0755'
  group 'apache'
  recursive true
end
