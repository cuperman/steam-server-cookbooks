require 'chefspec'
require 'shared'

describe 'steamcmd::csgo' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it_behaves_like 'a game recipe' do
    let(:name) { 'csgo' }
    let(:id) { 740 }
  end
  
  describe '/etc/init.d/csgo' do
    it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content('OPTS="-game csgo +map de_dust2 +ip 0.0.0.0 -port 27015 +maxplayers 24 -pidfile /opt/steamcmd/tmp/csgo.pid"') }
    it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content('INTERFACE="/usr/bin/screen -A -m -d -S csgo"') }
    it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content('su - steam -c "cd /opt/steamcmd/apps/csgo && $INTERFACE /opt/steamcmd/apps/csgo/srcds_run $OPTS"') }
    it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content('su - steam -c "ps -ef | grep SCREEN | grep csgo | grep -v grep | awk \'{ print $2 }\' > /opt/steamcmd/tmp/csgo-screen.pid"') }
  end
end