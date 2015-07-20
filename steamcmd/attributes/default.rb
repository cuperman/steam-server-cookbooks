default[:steamcmd][:user] = 'steam'
default[:steamcmd][:group] = 'steam'
default[:steamcmd][:home] = "/home/#{node[:steamcmd][:user]}"
default[:steamcmd][:root_dir] = '/opt/steamcmd'
default[:steamcmd][:apps_dir] = "#{node[:steamcmd][:root_dir]}/apps"
default[:steamcmd][:downloads_dir] = "#{node[:steamcmd][:root_dir]}/downloads"
default[:steamcmd][:scripts_dir] = "#{node[:steamcmd][:root_dir]}/scripts"