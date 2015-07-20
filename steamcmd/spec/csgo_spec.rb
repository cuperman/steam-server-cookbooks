require 'chefspec'

describe 'steamcmd::csgo' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it { expect(chef_run).to include_recipe('steamcmd::default') }
  it { expect(chef_run).to create_template('/opt/steamcmd/scripts/csgo.txt') }
end