require 'chefspec'
require 'shared'

describe 'steamcmd::tf2' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it_behaves_like 'a game recipe' do
    let(:title) { 'Team Fortress 2' }  
    let(:name) { 'tf2' }
    let(:id) { 232250 }
  end
end