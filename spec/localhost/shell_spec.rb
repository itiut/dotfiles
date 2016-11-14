require 'spec_helper'

describe 'shell' do
  describe user(Etc.getlogin) do
    it { should have_login_shell('/usr/local/bin/zsh') }
  end
end
