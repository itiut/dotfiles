require 'spec_helper'

def brewfile_path_option
  return '--global' if File.exist?(File.expand_path('.Brewfile', '~/'))
  path = File.join(PROJECT_ROOT, 'linked', '.Brewfile')
  "--file=#{path}"
end

describe 'brew' do
  describe command('which brew') do
    its(:exit_status) { should eq(0) }
    its(:stdout) { should eq("/usr/local/bin/brew\n") }
  end

  describe 'bundle' do
    describe command("brew bundle #{brewfile_path_option}") do
      its(:exit_status) { should eq(0) }
    end
  end
end
