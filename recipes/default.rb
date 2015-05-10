#
# Cookbook Name:: docker
# Recipe:: default
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

case node['platform']
when 'centos', 'redhat', 'amazon', 'scientific', 'fedora'
  packages = %w{docker}
  if node['platform'] == 'amazon'
    packages.push('docker-devel')
  else
    include_recipe 'yum-epel'
  end
  packages.each do |package_name|
    package package_name do
      action :install
    end
  end
end

# vim: filetype=ruby.chef
