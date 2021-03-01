word=$(xclip -o)
res=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/de/$word")
regex=$'"definition":"\K(.*?)(?=")'
definitions=$(echo $res | grep -Po "$regex")
separatedDefinition=$(sed ':a;N;$!ba;s/\n/\n\n/g' <<< "$definitions")
echo "https://www.duden.de/suchen/dudenonline/$word" | xclip

notify-send -u low -t 10000 "$word" "$separatedDefinition"
