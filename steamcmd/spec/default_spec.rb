require 'chefspec'

describe 'steamcmd::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it { expect(chef_run).to install_yum_package('glibc') }
  it { expect(chef_run).to install_yum_package('libstdc++') }
end