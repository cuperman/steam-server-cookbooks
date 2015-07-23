require 'chefspec'

describe 'steamcmd::csgo' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it { expect(chef_run).to include_recipe('steamcmd::default') }
  it { expect(chef_run).to create_template('/opt/steamcmd/scripts/csgo.txt') }
  it { expect(chef_run).to render_file('/opt/steamcmd/scripts/csgo.txt').with_content('force_install_dir /opt/steamcmd/apps/csgo') }
  it { expect(chef_run).to render_file('/opt/steamcmd/scripts/csgo.txt').with_content('app_update 740 validate') }
  it { expect(chef_run).to run_execute('/opt/steamcmd/steamcmd.sh +runscript /opt/steamcmd/scripts/csgo.txt') }
  it { expect(chef_run).to create_template('/etc/init.d/csgo') }
  it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content("TITLE='Source Dedicated Server'") }
  it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content("LONGNAME='Counter-Strike: GO'") }
  it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content("NAME='csgo'") }
  it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content("DAEMON='srcds_run'") }
  it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content("STEAM='/opt/steamcmd/apps/csgo'") }
  it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content("USER='steam'") }
  it { expect(chef_run).to start_service('csgo') }
  it { expect(chef_run).to enable_service('csgo') }
end