#
# Cookbook Name:: securian-apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'httpd'

user node['securian-apache']['apache-user'] do
  comment 'Apache'
  system true
  shell '/bin/false'
end

directory node['securian-apache']['webroot'] do
  owner node['securian-apache']['apache-user']
  mode '0755'
  group node['securian-apache']['apache-group']
  recursive true
end

directory node['securian-apache']['logroot'] do
  owner node['securian-apache']['apache-user']
  mode '0755'
  group node['securian-apache']['apache-group']
  recursive true
end

template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
end

service 'httpd' do
  action [:enable, :start]
end
