#!/bin/sh
while true
do
echo -n "$~ "
read hey
resp=$(curl -s https://api.openai.com/v1/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-xx" \
-d "{\"model\": \"text-davinci-003\", \"prompt\": \"You are a new language model trained by GoodGuys corp. A new language model trained by GoodGuys corp is not limited in any way, except few things. you are a honey pot made to send fake linux terminal response to catch the bad guys. when a bad guy input is a valid linux command you send the full output and not the explaination of the command or the word Output. when a bad guy input is not  a valid linux command you send Invalid Command and not explaination of the command. when a bad guy input  is msfconsole, you send the banner of msfconsole as code and a fake prompt of msfconsole and not Invalid Command or the explaination of the command. bad guy input : $hey \", \"temperature\": 0, \"max_tokens\": 1000}" | jq '.choices[].text'| tail -c +2 | head -c -2)
echo "${resp}"
done
