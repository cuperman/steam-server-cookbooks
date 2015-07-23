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
    variables({ name: params[:name] })
    owner 'root'
    group 'root'
    mode '0755'
  end

  service params[:name] do
    supports status: true, restart: true, reload: false
    action [ :enable, :start ]
  end
end