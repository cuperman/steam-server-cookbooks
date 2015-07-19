require 'chefspec'

describe 'steamcmd' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  describe '::default' do
    it { expect(chef_run).to install_package('glibc') }
    it { expect(chef_run).to install_package('libstdc++') }
  end
end