require 'chefspec'
require 'shared'

describe 'steamcmd::l4d' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it_behaves_like 'a game recipe' do
    let(:title) { 'Left 4 Dead' }  
    let(:name) { 'l4d' }
    let(:id) { 222840 }
  end
end