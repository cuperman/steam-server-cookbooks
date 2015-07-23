require 'chefspec'
require 'shared'

describe 'steamcmd::csgo' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it_behaves_like 'a game recipe' do
    let(:title) { 'Counter-Strike: Global Offensive' }
    let(:name) { 'csgo' }
    let(:id) { 740 }
  end
end