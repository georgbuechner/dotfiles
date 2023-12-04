#!/bin/bash

tmp_file=$(mktemp)
kitty --class="__text_scratchpad" -e $SHELL -lc "sleep 0.1 && nvim -c startinsert -c 'setlocal spell' -c 'set filetype=markdown' ${tmp_file}" && xclip -selection clipboard < $tmp_file
