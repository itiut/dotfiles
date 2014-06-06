#!/bin/sh

gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ icon-size 24
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 3

gsettings set org.gnome.desktop.session idle-delay 3600

gsettings set com.canonical.Unity.Lenses remote-content-search none

gsettings set com.canonical.indicator.datetime show-day true
gsettings set com.canonical.indicator.datetime show-date true
gsettings set com.canonical.indicator.datetime show-year true

gsettings set org.gnome.gedit.preferences.editor create-backup-copy false
