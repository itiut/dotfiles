# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

process.env.GEM_PATH = '/Users/itiut/.gem/ruby/2.3.1:/Users/itiut/.rubies/ruby-2.3.1/lib/ruby/gems/2.3.0' unless process.env.GEM_PATH
