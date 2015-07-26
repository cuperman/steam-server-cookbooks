define :steam_game do
  include_recipe 'steamcmd::default'
  
  script_path = "#{node[:steamcmd][:scripts_dir]}/update_#{params[:name]}"
  app_path = "#{node[:steamcmd][:apps_dir]}/#{params[:name]}"
  
  template script_path do
    source 'steam_game_update.erb'
    variables({ name: params[:name] })
    owner node[:steamcmd][:user]
    group node[:steamcmd][:group]
    mode '0644'
  end

  execute "#{node[:steamcmd][:root_dir]}/steamcmd.sh +runscript #{script_path}" do
    only_if {
      !::File.directory?(app_path) ||
      (::File.directory?(app_path) && ::Dir.entries(app_path).empty?)
    }
    user node[:steamcmd][:user]
    group node[:steamcmd][:group]
    command "#{node[:steamcmd][:root_dir]}/steamcmd.sh +runscript #{script_path}"
    action :run
    retries 3
    retry_delay 5
  end

  template "/etc/init.d/#{params[:name]}" do
    source 'steam_game_service.erb'
    variables({ 
      name:          params[:name],
      pidfile:       "#{node[:steamcmd][:tmp_dir]}/#{params[:name]}.pid",
      screenpidfile: "#{node[:steamcmd][:tmp_dir]}/#{params[:name]}-screen.pid",
      root_dir:      app_path,
      daemon:        "#{app_path}/srcds_run",
      title:         node[:steamcmd][params[:name].to_sym][:title],
      id:            node[:steamcmd][params[:name].to_sym][:id],
      game:          node[:steamcmd][params[:name].to_sym][:game],
      map:           node[:steamcmd][params[:name].to_sym][:map],
      ip:            node[:steamcmd][params[:name].to_sym][:ip],
      port:          node[:steamcmd][params[:name].to_sym][:port],
      maxplayers:    node[:steamcmd][params[:name].to_sym][:maxplayers]
    })
    owner 'root'
    group 'root'
    mode '0755'
  end

  service params[:name] do
    supports status: true, restart: true, reload: false
    action [ :enable, :start ]
  end
end