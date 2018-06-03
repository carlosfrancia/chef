# Cookbook Name:: my_users
# Recipe:: default

users_manage "rebels" do
  group_id 1138
  action [ :remove, :create ]
end

%w( friends sysadmin ).each do |group|
  users_manage group do
    action [ :remove, :create ]
  end
end

# node.default['authorization']['sudo']['passwordless'] = true
# include_recipe "sudo"

sudo "sysadmin" do
  group ['sysadmin']
  user "ec2-user"
  nopasswd true
end
