#!/bin/bash

echo "Enter words, then await translation [CTRL+C] to stop"
while true
do
  read -p '> ' word

  res=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")
  regex=$'"definition":"\K(.*?)(?=")'
  definitions=$(echo $res | grep -Po "$regex")
  separatedDefinition=$(sed ':a;N;$!ba;s/\n/\n\n/g' <<< "$definitions")

  echo "$word": "$separatedDefinition"
  echo ""

done
