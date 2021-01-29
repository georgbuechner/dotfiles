#!/bin/bash

file=$(find $HOME -type f | dmenu -i -l 35)
curl -F "file=@$file" 0x0.st | xclip
notify-send "ready in clipboard"
