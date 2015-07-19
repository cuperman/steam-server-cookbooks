package 'glibc'
package 'libstdc++'

group node[:steamcmd][:group] do
  action :create
end

user node[:steamcmd][:user] do
  action :create
  gid node[:steamcmd][:group]
  supports manage_home: true
  home node[:steamcmd][:home]
end

directory node[:steamcmd][:steamcmd_dir] do
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

unless ::File.exists? "#{node[:steamcmd][:steamcmd_dir]}/steamcmd_linux.tar.gz"
  remote_file "#{node[:steamcmd][:steamcmd_dir]}/steamcmd_linux.tar.gz" do
    action :create
    source 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz'
    owner node[:steamcmd][:user]
    group node[:steamcmd][:group]
    mode '0644'
  end
end
  
unless ::File.exists? "#{node[:steamcmd][:steamcmd_dir]}/steamcmd.sh"
  execute 'tar zxvf steamcmd_linux.tar.gz' do
    user node[:steamcmd][:user]
    group node[:steamcmd][:group]
    cwd node[:steamcmd][:steamcmd_dir]
    command 'tar zxvf steamcmd_linux.tar.gz'
    timeout 1800
  end
end