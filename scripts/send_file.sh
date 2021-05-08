#!/bin/bash

file=$( find $HOME \( -path "$HOME/.conan" -o -path "$HOME/.cache" -o -path "$HOME/snap" -o -path "$HOME/deps" \) -prune -o -type f | dmenu -i -l 35)
curl -F "file=@$file" 0x0.st | xclip
notify-send "ready in clipboard"
