require 'chefspec'
require 'shared'

describe 'steamcmd::dods' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it_behaves_like 'a game recipe' do
    let(:title) { 'Day of Defeat: Source' }  
    let(:name) { 'dods' }
    let(:id) { 232290 }
  end
end