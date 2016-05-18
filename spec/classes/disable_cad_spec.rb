require 'spec_helper'

describe 'disable_cad' do

  shared_examples 'no parameters' do
    let(:params) {{ }}

    it { should compile.with_all_deps }

    it { should create_class('disable_cad') }

    it { should contain_class('disable_cad::params') }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :fqdn => 'disable_cad.example.com',
        })
      end

      it_behaves_like 'no parameters'
    end
  end

  ['RedHat','CentOS'].each do | os_name |
    context "on #{os_name} 5" do
      let(:facts) {{
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '5',
        :operatingsystem           => os_name,
      }}
      it { should contain_augeas('disable-inittab-ctrlaltdel') }
    end

    context "on #{os_name} 6" do
      let(:facts) {{
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '6',
        :operatingsystem           => os_name,
      }}
      it { should contain_file('/etc/init/control-alt-delete.conf') }
    end

    context "on #{os_name} 7" do
      let(:facts) {{
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '7',
        :operatingsystem           => os_name,
      }}
      it { should contain_file('/etc/systemd/system/ctrl-alt-del.target') }
    end
  end

end
