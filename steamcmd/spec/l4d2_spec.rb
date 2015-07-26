require 'chefspec'
require 'shared'

describe 'steamcmd::l4d2' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it_behaves_like 'a game recipe' do
    let(:title) { 'Left 4 Dead 2' }  
    let(:name) { 'l4d2' }
    let(:id) { 222860 }
  end
  
  describe '/etc/init.d/csgo' do
    it { expect(chef_run).to render_file('/etc/init.d/l4d2').with_content('OPTS="-game left4dead2 +map c1m1_hotel +ip 0.0.0.0 -port 27017 +maxplayers 8 -pidfile /opt/steamcmd/tmp/l4d2.pid"') }
  end
end