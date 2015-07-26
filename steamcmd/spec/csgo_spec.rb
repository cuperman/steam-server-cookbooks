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
    it { expect(chef_run).to render_file('/etc/init.d/csgo').with_content('sudo su - u steam -c "$INTERFACE /opt/steamcmd/apps/csgo/srcds_run $OPTS"') }
  end
end