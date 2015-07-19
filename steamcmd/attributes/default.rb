default[:steamcmd][:user] = 'steam'
default[:steamcmd][:group] = 'steam'
default[:steamcmd][:home] = "/home/#{[:steamcmd][:user]}"
default[:steamcmd][:steamcmd_dir] = '/opt/steamcmd'
default[:steamcmd][:apps_dir] = "#{node[:steamcmd][:steamcmd_dir]/apps}"