require 'spec_helper'

def dotfiles(dir)
  Dir.glob(File.join(dir, '.[a-z]*'))
     .select { |path| File.file?(path) }
     .map { |path| File.basename(path) }
end

describe 'symlink' do
  files = dotfiles(File.join(PROJECT_ROOT, 'linked'))
  files.concat(dotfiles(File.expand_path('.share', '~/Dropbox')))
  files.concat(%w(
                 .atom
                 .Brewfile
                 .emacs.d
                 Library/Application\ Support/Code/User/keybindings.json
                 Library/Application\ Support/Code/User/settings.json
                 .aws/config
                 .aws/credentials
                 .config/hub
                 .ssh/config
               ))

  files.each do |file|
    describe file(File.expand_path(file, '~/')) do
      it { should be_symlink }
    end
  end
end
