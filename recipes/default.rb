#
# Cookbook:: request_tracker
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Create stage directory on server
directory node['request_tracker']['stage_directory'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# Install prerequisite packages for RT Install
package 'perl'
# package 'mod_perl-devel'
# package 'mod_perl'
package 'mod_ssl'

# Install Apache and set it to start/enabled
package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

# Download MySQL Server and Client
# remote_file '/stage/mysql-community-server-5.7.19-1.el7.x86_64.rpm' do
#   source 'https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-server-5.7.19-1.el7.x86_64.rpm'
#   owner 'root'
#   group 'root'
#   mode '0755'
#   action :create
# end

# remote_file '/stage/mysql-community-client-5.7.19-1.el7.x86_64.rpm' do
#   source 'https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-client-5.7.19-1.el7.x86_64.rpm'
#   owner 'root'
#   group 'root'
#   mode '0755'
#   action :create
# end

# Download RT Installation file
remote_file '/stage/rt-4.4.2.tar.gz' do
  source 'https://download.bestpractical.com/pub/rt/release/rt-4.4.2.tar.gz'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
