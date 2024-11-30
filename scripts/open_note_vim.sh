#!/bin/bash

tmp_file=$(mktemp)
# xterm -class "__text_scratchpad" -e $SHELL -lc "sleep 0.1 && nvim -c 'setlocal spell' -c 'set filetype=markdown' -c 'Telekasten new_note' ${tmp_file}"
# kitty --class "__text_scratchpad" -e $SHELL -lc "sleep 0.1 && nvim -c 'setlocal spell' -c 'set filetype=markdown' -c 'Telekasten new_note' ${tmp_file}"
alacritty --config-file ~/.config/sway/alacritty/alacritty.toml --class "__text_scratchpad" -e $SHELL -lc "nvim -c 'setlocal spell' -c 'set filetype=markdown' -c 'Telekasten new_note' ${tmp_file}"
