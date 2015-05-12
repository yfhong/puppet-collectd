require 'spec_helper'

describe 'collectd' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "collectd class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('collectd::params') }
          it { is_expected.to contain_class('collectd::install').that_comes_before('collectd::config') }
          it { is_expected.to contain_class('collectd::config') }
          it { is_expected.to contain_class('collectd::service').that_subscribes_to('collectd::config') }

          it { is_expected.to contain_service('collectd') }
          it { is_expected.to contain_package('collectd').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'collectd class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('collectd') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
