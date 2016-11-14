require 'spec_helper'

describe 'loginshell' do
  describe user(Etc.getlogin) do
    it { should have_login_shell('/usr/local/bin/zsh') }
  end
end
