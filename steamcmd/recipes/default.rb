yum_package 'glibc' do
  arch 'i686'
end

yum_package 'libstdc++' do
  arch 'i686'
end

group node[:steamcmd][:group] do
  action :create
end

user node[:steamcmd][:user] do
  action :create
  gid node[:steamcmd][:group]
  supports manage_home: true
  home node[:steamcmd][:home]
end

directory node[:steamcmd][:root_dir] do
  action :create
  owner node[:steamcmd][:user]
  group node[:steamcmd][:group]
  mode '0755'
end

directory node[:steamcmd][:downloads_dir] do
  action :create
  owner node[:steamcmd][:user]
  group node[:steamcmd][:group]
  mode '0755'
end

directory node[:steamcmd][:scripts_dir] do
  action :create
  owner node[:steamcmd][:user]
  group node[:steamcmd][:group]
  mode '0755'
end

directory node[:steamcmd][:apps_dir] do
  action :create
  owner node[:steamcmd][:user]
  group node[:steamcmd][:group]
  mode '0755'
end

directory node[:steamcmd][:tmp_dir] do
  action :create
  owner node[:steamcmd][:user]
  group node[:steamcmd][:group]
  mode '0755'
end


unless ::File.exists? "#{node[:steamcmd][:downloads_dir]}/steamcmd_linux.tar.gz"
  remote_file "#{node[:steamcmd][:downloads_dir]}/steamcmd_linux.tar.gz" do
    action :create
    source 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz'
    owner node[:steamcmd][:user]
    group node[:steamcmd][:group]
    mode '0644'
  end
end
  
unless ::File.exists? "#{node[:steamcmd][:root_dir]}/steamcmd.sh"
  execute "tar zxvf #{node[:steamcmd][:downloads_dir]}/steamcmd_linux.tar.gz" do
    user node[:steamcmd][:user]
    group node[:steamcmd][:group]
    cwd node[:steamcmd][:root_dir]
    command "tar zxvf #{node[:steamcmd][:downloads_dir]}/steamcmd_linux.tar.gz"
    timeout 1800
  end
end