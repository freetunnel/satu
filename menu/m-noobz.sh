#!/bin/bash
# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"

colornow=$(cat /etc/rmbl/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

clear
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=`cat /etc/xray/domain`
CHATID2=$(cat /etc/perlogin/id)
KEY2=$(cat /etc/perlogin/token)
URL2="https://api.telegram.org/bot$KEY2/sendMessage"
if [ ! -e /etc/xray/noobz/akun ]; then
mkdir -p /etc/xray/noobz/akun
fi
function create(){
clear

echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• SSH PANEL MENU •               ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
read -p "Username: " user
read -p "Password: " pass
until [[ $exp =~ ^[0-9]+$ ]]; do
read -p "Exp (0 for unlimited days):" exp
done
read -p "IP LIMIT " ip

if [ ! -e /etc/sf/limit/noobs/ip/ ]; then
  mkdir -p /etc/sf/limit/noobs/ip/
fi
echo "$ip" > /etc/sf/limit/noobs/ip/$user

noobzvpns --add-user $user $pass --expired-user $user $exp
expi=`date -d "$exp days" +"%Y-%m-%d"`
useradd -e `date -d "$exp days" +"%Y-%m-%d"` -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$pass\n$pass\n"|passwd $user &> /dev/null
echo -e "### $user $expi $pass" >> /etc/xray/noob
clear
cat > /home/vps/public_html/noobzvpns-$user.txt <<-END
◇━━━━━━━━━━━━━━━━━◇
NOOBZVPN ACCOUNT
◇━━━━━━━━━━━━━━━━━◇
DOMAIN : $domain
USERNAME : $user
PASSWORD : $pass
IP LIMIT : $ip
EXP DAYS : $expi ( $exp Days )
tcp_std port :  8080
tcp_ssl port : 8443
◇━━━━━━━━━━━━━━━━━◇
Example config TCP_STD 8080
◇━━━━━━━━━━━━━━━━━◇

ECDLHn2OKM3Rx9mPPmbWuVY6UHpWA4EWPmBrQmq7G0jEgeXNYTkKst3cDGSzHTZzVQOC5Ycklud5TWQq9cxT5u0Rl1jchPhTBSR7WtiREomkuXx5WLlQbqWtembjzurG4e62gK3neX2ulrHV1uHbBsIitle8N8rUWzBKKTvf9kdo1uNjlFUm9PlUyozSOSZVKH0K72Ry4nkcwNVEdASszxPhQeCEoZqQxXHA7UBiejmvTfeENfkC8EBxM/EJgMCtMu48yDRN9wzKOQml57admUqMOKqoSVws9gyLH5DS/rribarb315Jl5wevMiFFO/V+FW6WZgkd13zy6KBy5QHsKnlZPaji3OfjxwI5u1qg0d/efRPfkM/Tt6fUAI5hyAI6G1vpQMpUrKcEH6j2Ejb6JCkZw2i26+Yxt3k1/O4IJgOneTPzltGh5zZjQdO2zkJRv8weGKKeG8d9OtmMmS2EL+XF1IRCNydkkXK+rQjzPxbqIGdptrxuJ47W8yE6ffmiaYk8WK9GNRnnyQTYYDU4VtGGzKOPSYVTHR8wBpLKEbGJJySBPhlnGmYDpqW0hSLXP1p6fNG+r32TAIUDY2wXeIxpM3+a5ysGOJ0

◇━━━━━━━━━━━━━━━━━◇
Example config TCP_SSL 8443
◇━━━━━━━━━━━━━━━━━◇

EEzgE2n/9uDhmapbVi3OOdH2QJceIOIFHvogi9pO0ogt39MrQ8YpMD4DoUCTOZGyycxd/ZwUCGNpsEFP0evNoj54fVgRe6S6t67YgQD1Q9qCZ5DHRN8vldoM4itlFMwIvFF3uESXv7xp3NOPptJ5U+vKelojNP6e3W4qju2z1zfmCoblYV84cBXaZTpqlo/qfSRwpkkJd8s81+1Z0WQwGz7fazcLtH5lQnf2ktIU/p01n45bzKNS6RVSspd7dAe5+az42xmtnsr2CSB+3LALOpViUM86ppixLir1xBpfatTRxSJB+HMKS1Ltm0kVUbkaWkmaoS08mdyS6tGeeZvgeH/s1s3NDUMmjRIaYBlKzlVFhQMLZVTz1fQ2A6Ii2eiJ3x8I+j+5X1N7yqFhjYm/Hc3zzCBFcrCp4ntirFiriNlmnv/nDxlvLE7B6gmg0+imFDPiaDYTJf/rg1b0svcVjT+L9rgLZ5HeJCGv/GEnms0EdXMUGWEO9mNj3vejDKyEwMxZHzVqi2PMVo/dhABliavBaGohX5Na7TiijVGROm83tF4ZQ2IRs7h+2v9mNEf3x9MmfLf6TTtg0UbjMCv0IIyCukuMlmCi+10=

◇━━━━━━━━━━━━━━━━━◇
  •  FREETUNNELING  • 
◇━━━━━━━━━━━━━━━━━◇
END
if [[ -e /etc/noobz ]]; then
TEXT="
◇━━━━━━━━━━━━━━━━━◇
NOOBZVPN ACCOUNT
◇━━━━━━━━━━━━━━━━━◇
DOMAIN : <code>$domain</code>
USERNAME : <code>$user</code>
PASSWORD : <code>$pass</code>
IP LIMIT : $ip
EXP DAYS : $expi ( $exp Days )
tcp_std port :  8080
tcp_ssl port : 8443
◇━━━━━━━━━━━━━━━━━◇
Example config TCP_STD 8080
◇━━━━━━━━━━━━━━━━━◇

<code>ECDLHn2OKM3Rx9mPPmbWuVY6UHpWA4EWPmBrQmq7G0jEgeXNYTkKst3cDGSzHTZzVQOC5Ycklud5TWQq9cxT5u0Rl1jchPhTBSR7WtiREomkuXx5WLlQbqWtembjzurG4e62gK3neX2ulrHV1uHbBsIitle8N8rUWzBKKTvf9kdo1uNjlFUm9PlUyozSOSZVKH0K72Ry4nkcwNVEdASszxPhQeCEoZqQxXHA7UBiejmvTfeENfkC8EBxM/EJgMCtMu48yDRN9wzKOQml57admUqMOKqoSVws9gyLH5DS/rribarb315Jl5wevMiFFO/V+FW6WZgkd13zy6KBy5QHsKnlZPaji3OfjxwI5u1qg0d/efRPfkM/Tt6fUAI5hyAI6G1vpQMpUrKcEH6j2Ejb6JCkZw2i26+Yxt3k1/O4IJgOneTPzltGh5zZjQdO2zkJRv8weGKKeG8d9OtmMmS2EL+XF1IRCNydkkXK+rQjzPxbqIGdptrxuJ47W8yE6ffmiaYk8WK9GNRnnyQTYYDU4VtGGzKOPSYVTHR8wBpLKEbGJJySBPhlnGmYDpqW0hSLXP1p6fNG+r32TAIUDY2wXeIxpM3+a5ysGOJ0</code>

◇━━━━━━━━━━━━━━━━━◇
Example config TCP_SSL 8443
◇━━━━━━━━━━━━━━━━━◇

<code>EEzgE2n/9uDhmapbVi3OOdH2QJceIOIFHvogi9pO0ogt39MrQ8YpMD4DoUCTOZGyycxd/ZwUCGNpsEFP0evNoj54fVgRe6S6t67YgQD1Q9qCZ5DHRN8vldoM4itlFMwIvFF3uESXv7xp3NOPptJ5U+vKelojNP6e3W4qju2z1zfmCoblYV84cBXaZTpqlo/qfSRwpkkJd8s81+1Z0WQwGz7fazcLtH5lQnf2ktIU/p01n45bzKNS6RVSspd7dAe5+az42xmtnsr2CSB+3LALOpViUM86ppixLir1xBpfatTRxSJB+HMKS1Ltm0kVUbkaWkmaoS08mdyS6tGeeZvgeH/s1s3NDUMmjRIaYBlKzlVFhQMLZVTz1fQ2A6Ii2eiJ3x8I+j+5X1N7yqFhjYm/Hc3zzCBFcrCp4ntirFiriNlmnv/nDxlvLE7B6gmg0+imFDPiaDYTJf/rg1b0svcVjT+L9rgLZ5HeJCGv/GEnms0EdXMUGWEO9mNj3vejDKyEwMxZHzVqi2PMVo/dhABliavBaGohX5Na7TiijVGROm83tF4ZQ2IRs7h+2v9mNEf3x9MmfLf6TTtg0UbjMCv0IIyCukuMlmCi+10=</code>

◇━━━━━━━━━━━━━━━━━◇
  • FREETUNNELING • 
◇━━━━━━━━━━━━━━━━━◇
"
else
TEXT="
◇━━━━━━━━━━━━━━━━━◇
NOOBZVPN ACCOUNT
◇━━━━━━━━━━━━━━━━━◇
DOMAIN : <code>$domain</code>
USERNAME : <code>$user</code>
PASSWORD : <code>$pass</code>
IP LIMIT : $ip
EXP DAYS : $expi ( $exp Days )
tcp_std port :  8080
tcp_ssl port : 8443
◇━━━━━━━━━━━━━━━━━◇
Example config TCP_STD 8080
◇━━━━━━━━━━━━━━━━━◇

<code>ECDLHn2OKM3Rx9mPPmbWuVY6UHpWA4EWPmBrQmq7G0jEgeXNYTkKst3cDGSzHTZzVQOC5Ycklud5TWQq9cxT5u0Rl1jchPhTBSR7WtiREomkuXx5WLlQbqWtembjzurG4e62gK3neX2ulrHV1uHbBsIitle8N8rUWzBKKTvf9kdo1uNjlFUm9PlUyozSOSZVKH0K72Ry4nkcwNVEdASszxPhQeCEoZqQxXHA7UBiejmvTfeENfkC8EBxM/EJgMCtMu48yDRN9wzKOQml57admUqMOKqoSVws9gyLH5DS/rribarb315Jl5wevMiFFO/V+FW6WZgkd13zy6KBy5QHsKnlZPaji3OfjxwI5u1qg0d/efRPfkM/Tt6fUAI5hyAI6G1vpQMpUrKcEH6j2Ejb6JCkZw2i26+Yxt3k1/O4IJgOneTPzltGh5zZjQdO2zkJRv8weGKKeG8d9OtmMmS2EL+XF1IRCNydkkXK+rQjzPxbqIGdptrxuJ47W8yE6ffmiaYk8WK9GNRnnyQTYYDU4VtGGzKOPSYVTHR8wBpLKEbGJJySBPhlnGmYDpqW0hSLXP1p6fNG+r32TAIUDY2wXeIxpM3+a5ysGOJ0</code>

◇━━━━━━━━━━━━━━━━━◇
Example config TCP_SSL 8443
◇━━━━━━━━━━━━━━━━━◇

<code>EEzgE2n/9uDhmapbVi3OOdH2QJceIOIFHvogi9pO0ogt39MrQ8YpMD4DoUCTOZGyycxd/ZwUCGNpsEFP0evNoj54fVgRe6S6t67YgQD1Q9qCZ5DHRN8vldoM4itlFMwIvFF3uESXv7xp3NOPptJ5U+vKelojNP6e3W4qju2z1zfmCoblYV84cBXaZTpqlo/qfSRwpkkJd8s81+1Z0WQwGz7fazcLtH5lQnf2ktIU/p01n45bzKNS6RVSspd7dAe5+az42xmtnsr2CSB+3LALOpViUM86ppixLir1xBpfatTRxSJB+HMKS1Ltm0kVUbkaWkmaoS08mdyS6tGeeZvgeH/s1s3NDUMmjRIaYBlKzlVFhQMLZVTz1fQ2A6Ii2eiJ3x8I+j+5X1N7yqFhjYm/Hc3zzCBFcrCp4ntirFiriNlmnv/nDxlvLE7B6gmg0+imFDPiaDYTJf/rg1b0svcVjT+L9rgLZ5HeJCGv/GEnms0EdXMUGWEO9mNj3vejDKyEwMxZHzVqi2PMVo/dhABliavBaGohX5Na7TiijVGROm83tF4ZQ2IRs7h+2v9mNEf3x9MmfLf6TTtg0UbjMCv0IIyCukuMlmCi+10=</code>

◇━━━━━━━━━━━━━━━━━◇
 • FREETUNNELING • 
◇━━━━━━━━━━━━━━━━━◇
"
fi
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
user2=$(echo "$user" | cut -c 1-3)
TIME2=$(date +'%Y-%m-%d %H:%M:%S')
TEXT2="
<code>◇━━━━━━━━━━━━━━◇</code>
<code>   TRANSAKSI NOOBZVPNS SUCCES </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>DOMAIN   :</code> <code>${domain} </code>
<code>ISP      :</code> <code>$ISP $CITY </code>
<code>DATE   :</code> <code>${TIME2} WIB </code>
<code>DETAIL   :</code> <code>Trx NOOBZVPN </code>
<code>USER :</code> <code>${user2}xxx </code>
<code>DURASI  :</code> <code>$exp Hari </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>AutoNotif Create Akun From Server..</i>"
curl -s --max-time $TIMES -d "chat_id=$CHATID2&disable_web_page_preview=1&text=$TEXT2&parse_mode=html" $URL2 >/dev/null
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "NOOBZVPN ACCOUNT" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "DOMAIN : $( cat /etc/xray/domain )" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "USERNAME: $user" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "PASSWORD: $pass" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "IP LIMIT: $ip" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "EXP DAYS: EXP DAYS : $expi ( $exp Days )" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "tcp_std port:  8080" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "tcp_ssl port: 8443" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "Example config TCP_STD 8080" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "EB4cHVzsbaIHhGlETDO+Ck22fVlOm01SEuUAUWIilUiZj3ho/GZ5QY+Fdur7EGcHtimx0bRpPkPYSUVldGNLCXsFP3XfuuhmgsFMFK/RNdCJO1dF1LdAFlB4FSpoxofkIxg4/ot5WJVEGKPxuK7M3hm+93/8mTKR7LO196KrYbIcDbZtui7+g0u03le97wfPfnjHgd5YVflwaagi6T1PU2z5nXp0sLPrwKY5mdvmQu2QVAiMGE/ZqdjM1m2kcYDaecChWbLz4FiMVQBjEqa5G4h7zjBmxBtXFpWvOyApTfPIKK44eBHxKoLc7FXjaEFw7ONqexhB3svRPND1XR9VtkISZLEwrXQPPv1OO2pzOaS7unutCaP7pxQoTaChCn9Z2tN5tKDn8UsB/p8ouoLZPH4g83fYzO28dV2SC064+S3PLo6MlZxmlGuBUdhPuKgrfK+Rbejas7Z8GnCglJLUyTcwuynoFQiNVqiP64hMnvB9hSNl6YDQeST20ydA8dMIG7Jg8PJ52MRO5GIxNwl9y3ut7mPrn/+ia+rgoH+kz4mww6SBEy15TeXss7ZMYZcGj7A1vtTFOfCBvvqRgBxpQ6ZPcPX2+ohuC16/fQ==" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "Example config TCP_SSL 8443" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "EMLBHFZfH/pBoPKJNWEVgBpE6A5ZeWbnzpI4w7UFL3EEDLbefWsxq308yXcLl9+eH0CAwm6hLFDAIEZtscw6w090SyqPTK1iZxg/XVhQupV+3gkyTy/t3OeJcEGNfgOGuBGi5HVxQNiBrKIo8gQnVnR5oDVf80HbwVUHYNiayk9B8cqGRlr8bHTMs6GcevwhgWRUhOYitN20pcF91SXkQd86eIFfMVVFpM2MkRqOiL4+ZWS1GrH+r4YVC69Q50xyZAfUm+Ps17bY3hH7qcha1o2OD8RhjYqGnRzJDJEh7tfnDG6GyLgKPk+A8wxLkd+oTDKOMMsEyFA6x2NolzEYNYIsn5C2QBlEm5NAb8RJmCkFVL+L+ekiUp0NvkIRSjhVbhcl/n1CkBWkcOPYLCwyIagNJrCoD6vkoGzprqS3IAbj7RkOQqmLquAlfeEgDk6UJao/BZaoZeeIlfhDgfATDZiooLECs/h+0/2Vff1E5wnoHovDDo3FZW8xbxXXazHWdYWg8BOU3sATfhnbZd6uWsPmAg6r3jGynibibNbO1r/n88vbvB8Au319VN8KRLI4FhPc/Z9KG+njTJkmiLoG33SbPU7fF8AP" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e " • CLOUD TUNNELING •" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
}


function delete(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• DELETE NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
grep -E "^### " "/etc/xray/noob" | cut -d ' ' -f 2-3 | nl -s ') '
read -p "username :" user
noobzvpns --remove-user $user
expi=`date -d "$exp days" +"%Y-%m-%d"`
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• DELETE NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -e "$WH USERNAME $user HAS BEEN DELETE $NC"
echo -e "$WH EXPIRED : $expi $NC"
echo -e ""
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<code>  DELETE NOOBZVPNS</code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>DOMAIN   :</code> <code>${domain} </code>
<code>ISP      :</code> <code>$ISP $CITY </code>
<code>USERNAME :</code> <code>$user</code>
<code>EXPIRED  :</code> <code>$expi </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Delete This User...</i>
"
curl -s --max-time $TIMES -d "chat_id=$CHATIDNEW&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • Satan Fusion Tunneling •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}


function renew(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• RENEW NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
read -p "username: " user
read -p "expired?: " exp
noobzvpns --renew-user $user --expired-user $user $exp
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• RENEW NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "renew success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • Satan Fusion Tunneling •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}




function lock(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• LOCK  NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
read -p "username: " user
noobzvpns --block-user $user
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• LOCK  NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "locked success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • Free Tunneling Project •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}






function show(){

clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• MEMBER  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
noobzvpns --info-all-user | awk '/^\s*\+.*-> active/ {gsub(/(issued\(yyyymmdd\)|hash_key): [0-9a-f]+/, ""); print; getline; print; getline; getline; getline; print; print "═══════════════════"}'

echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • Free Tunneling Project •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu

}



function unlock(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• UNLOCK  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
read -p "username: " user
noobzvpns --unblock-user $user
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• UNLOCK  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "unlocked success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • Free Tunneling Project •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}



function remove(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• REMOVE  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"

read -p "Apakah Anda ingin menghapus semua user? (Y/N): " choice

if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    # Eksekusi perintah di sini
    echo "MENGHAPUS SEMUA USER!"
noobzvpns --remove-all-user
elif [ "$choice" == "N" ] || [ "$choice" == "n" ]; then
    echo "Membatalkan penghapusan."
menu-noobzvpns
else
    echo "Pilihan tidak valid."
fi

clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• REMOVE  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "unlocked success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • Free Tunneling Project •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}




clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}                 ${WH}• NOOBZ PANEL MENU •            ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}ADD AKUN${NC}      ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}DELETE USER${NC}   $COLOR1 $NC"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}SHOW AKUN${NC}     ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}LOCKED USER${NC}    $COLOR1 $NC"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}RENEW AKUN${NC}    ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}UNLOCKED USER${NC}    $COLOR1 $NC"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}       ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}REMOVE ALL USER${NC}    $COLOR1 $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═════════════════════ • ${WH}BY${NC}${COLOR1} • ══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • Free Tunneling Project •                 $COLOR1 $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; create ;;
02 | 2) clear ; show ;;
03 | 3) clear ; renew ;;
04 | 4) clear ; delete ;;
05 | 5) clear ; lock ;;
06 | 6) clear ; unlock ;;
07 | 7) clear ; remove ;;
100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
