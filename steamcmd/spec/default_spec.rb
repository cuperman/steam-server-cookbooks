require 'chefspec'

describe 'steamcmd::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
  it { expect(chef_run).to install_yum_package('glibc').with(arch: 'i686') }
  it { expect(chef_run).to install_yum_package('libstdc++').with(arch: 'i686') }
  it { expect(chef_run).to create_group('steam') }
  it { expect(chef_run).to create_user('steam').with(gid: 'steam', home: '/home/steam') }
  it { expect(chef_run).to create_directory('/opt/steamcmd').with(mode: '0755') }
  it { expect(chef_run).to create_directory('/opt/steamcmd/downloads').with(mode: '0755') }
  it { expect(chef_run).to create_directory('/opt/steamcmd/scripts').with(mode: '0755') }
  it { expect(chef_run).to create_directory('/opt/steamcmd/apps').with(mode: '0755') }
  it { expect(chef_run).to create_directory('/opt/steamcmd/tmp').with(mode: '0755') }
  it { expect(chef_run).to create_remote_file('/opt/steamcmd/downloads/steamcmd_linux.tar.gz').with(mode: '0644') }
  it { expect(chef_run).to run_execute('tar zxvf /opt/steamcmd/downloads/steamcmd_linux.tar.gz') }
end