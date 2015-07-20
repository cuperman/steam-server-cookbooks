include_recipe 'steamcmd::default'

template "#{node[:steamcmd][:scripts_dir]}/csgo.txt" do
  owner node[:steamcmd][:user]
  group node[:steamcmd][:group]
  mode '0644'
end

execute "#{node[:steamcmd][:root_dir]}/steamcmd.sh +runscript #{node[:steamcmd][:scripts_dir]}/csgo.txt" do
  only_if {
    !::File.directory?("#{node[:steamcmd][:apps_dir]}/csgo") ||
    (::File.directory?("#{node[:steamcmd][:apps_dir]}/csgo") && ::Dir.entries("#{node[:steamcmd][:apps_dir]}/csgo").empty?)
  }
  user node[:steamcmd][:user]
  group node[:steamcmd][:group]
  command "#{node[:steamcmd][:root_dir]}/steamcmd.sh +runscript #{node[:steamcmd][:scripts_dir]}/csgo.txt"
  action :run
  retries 3
  retry_delay 5
end

template "/etc/init.d/csgo" do
  owner 'root'
  group 'root'
  mode '0644'
end