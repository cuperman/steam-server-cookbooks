require 'chefspec'
require 'shared'

describe 'steamcmd::tf2' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it_behaves_like 'a game recipe' do
    let(:name) { 'tf2' }
    let(:id) { 232250 }
  end
  
  describe '/etc/init.d/csgo' do
    it { expect(chef_run).to render_file('/etc/init.d/tf2').with_content('OPTS="-game tf +map mvm_decoy +ip 0.0.0.0 -port 27016 +maxplayers 32 -pidfile /opt/steamcmd/tmp/tf2.pid"') }
  end
end