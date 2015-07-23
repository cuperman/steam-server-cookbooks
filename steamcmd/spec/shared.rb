shared_examples_for 'a game recipe' do
  it { expect(chef_run).to include_recipe('steamcmd::default') }
  it { expect(chef_run).to create_template("/opt/steamcmd/scripts/update_#{name}") }
  it { expect(chef_run).to render_file("/opt/steamcmd/scripts/update_#{name}").with_content("force_install_dir /opt/steamcmd/apps/#{name}") }
  it { expect(chef_run).to render_file("/opt/steamcmd/scripts/update_#{name}").with_content("app_update #{id} validate") }
  it { expect(chef_run).to run_execute("/opt/steamcmd/steamcmd.sh +runscript /opt/steamcmd/scripts/update_#{name}") }
  it { expect(chef_run).to create_template("/etc/init.d/#{name}") }
  it { expect(chef_run).to render_file("/etc/init.d/#{name}").with_content("TITLE='#{title}'") }
  it { expect(chef_run).to render_file("/etc/init.d/#{name}").with_content("NAME='#{name}'") }
  it { expect(chef_run).to render_file("/etc/init.d/#{name}").with_content("DAEMON='srcds_run'") }
  it { expect(chef_run).to render_file("/etc/init.d/#{name}").with_content("STEAM='/opt/steamcmd/apps/#{name}'") }
  it { expect(chef_run).to render_file("/etc/init.d/#{name}").with_content("USER='steam'") }
  it { expect(chef_run).to start_service(name) }
  it { expect(chef_run).to enable_service(name) }
end