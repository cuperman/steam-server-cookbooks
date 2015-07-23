require 'chefspec'
require 'shared'

describe 'steamcmd::css' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it_behaves_like 'a game recipe' do
    let(:title) { 'Counter-Strike: Source' }  
    let(:name) { 'css' }
    let(:id) { 232330 }
  end
end