require 'chefspec'
require 'shared'

describe 'steamcmd::l4d2' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it_behaves_like 'a game recipe' do
    let(:title) { 'Left 4 Dead 2' }  
    let(:name) { 'l4d2' }
    let(:id) { 222860 }
  end
end