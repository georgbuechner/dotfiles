word=$(wl-paste -p)
res=$(cd /usr/local/bin/trans/ && source .venv/bin/activate && python3 trans.py "$word")

notify-send -t 300000 "${word:0:20}...:" "$res"
