#
# Cookbook Name:: securian-apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'setenforce 0'

package 'httpd' do
   version '2.2.15-45.el6.centos'
  action :install
end

user node['securian-apache']['apache-user'] do
  comment 'Apache'
  system true
  shell '/sbin/nologin'
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

directory "#{node['securian-apache']['webroot']}/default/production/root" do
  owner node['securian-apache']['apache-user']
  mode '0755'
  group node['securian-apache']['apache-group']
  recursive true
end
directory "#{node['securian-apache']['logroot']}/websites/default" do
  owner node['securian-apache']['apache-user']
  mode '0755'
  group node['securian-apache']['apache-group']
  recursive true
end

template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
  notifies :reload, 'service[httpd]'
end

service 'httpd' do
  action [:enable, :start]
  supports :restart => true, :reload => true
end
