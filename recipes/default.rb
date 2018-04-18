#
# Cookbook:: bind
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

package "bind9" do
 case node[:platform]
 when "centos", "redhat"
   package_name "bind"
 end
end

service "bind9" do
  case node[:platform]
  when "centos", "redhat"
    service_name "named"
  end
  supports :status => true, :reload => true, :restart => true
  action [ :enable ]
end


# Should generate named.conf file

directory node[:bind9][:data_path] do
  owner node[:bind9][:user]
  group node[:bind9][:user]
  mode 0755
  recursive true
end

directory node[:bind9][:log_file] do
  owner node[:bind9][:user]
  group node[:bind9][:user]
  mode 0755
  recursive true
end

template File.join(node[:bind9][:config_path], node[:bind9][:config_file]) do
  source "named.conf.erb"
  owner node[:bind9][:user]
  group node[:bind9][:user]
  mode 0644
  notifies :restart, "service[bind9]"
end

template File.join(node[:bind9][:config_path], node[:bind9][:local_file]) do
  source "named.conf.local.erb"
  owner node[:bind9][:user]
  group node[:bind9][:user]
  mode 0644
  variables({
    :zonefiles => search(:zones)
  })
  notifies :restart, "service[bind9]"
end

service "bind9" do
  action [ :start ]
end
