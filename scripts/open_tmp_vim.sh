#!/bin/bash

tmp_file=$(mktemp)
# kitty --class="__text_scratchpad" -e $SHELL -lc "sleep 0.1 && nvim -c startinsert -c 'setlocal spell' -c 'set filetype=markdown' ${tmp_file}" && wl-copy < $tmp_file
# xterm -class "__text_scratchpad" -e $SHELL -lc "sleep 0.1 && nvim -c startinsert -c 'setlocal spell' -c 'set filetype=markdown' ${tmp_file}" && wl-copy < $tmp_file
alacritty --config-file ~/.config/sway/alacritty/alacritty.toml --class "__text_scratchpad" -e $SHELL -lc "nvim -c startinsert -c 'setlocal spell' -c 'set filetype=markdown' ${tmp_file}" && wl-copy < $tmp_file

