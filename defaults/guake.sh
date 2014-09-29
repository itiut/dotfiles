#!/usr/bin/env bash
set -eu
conf=gconftool-2
guake=/apps/guake

$conf $guake/general/history_size           -s -t int    10000
$conf $guake/general/open_tab_cwd           -s -t bool   true
$conf $guake/general/use_default_font       -s -t bool   false
$conf $guake/general/window_height          -s -t int    100
$conf $guake/keybindings/local/next_tab     -s -t string '<Control><Shift>n'
$conf $guake/keybindings/local/previous_tab -s -t string '<Control><Shift>p'
$conf $guake/style/background/color         -s -t string '#1a1a1a'
$conf $guake/style/background/transparency  -s -t int    20
$conf $guake/style/font/style               -s -t string 'Migu 1M for Powerline 12'

# Monokai Soda
$conf $guake/style/font/palette             -s -t string '#1a1a1a:#f4005f:#98e024:#fa8419:#9d65ff:#f4005f:#58d1eb:#c4c5b5:#625e4c:#f4005f:#98e024:#e0d561:#9d65ff:#f4005f:#58d1eb:#f6f6ef'
