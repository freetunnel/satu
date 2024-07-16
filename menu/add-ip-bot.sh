#!/bin/bash
export HOME=/root
export TERM=xterm
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
#########################
[[ ! -f /usr/bin/git ]] && apt install git -y &> /dev/null
# COLOR VALIDATION
clear
y='\033[1;93m'
c="\033[0;36m"
g="\e[92;1m"
r="\033[1;31m"
NC='\e[0m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\033[1;95m"
yell='\e[33m'
BGX="\033[42m"
END='\e[0m'
bc="\e[5;36m"
ungu='\033[0;35m'
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"
NC='\e[0m'

MYIP=$(curl -sS ipv4.icanhazip.com)
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/freetunnel/iz/main/admin"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          AKSES DITOLAK ANDA BUKAN RESELLER          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "       ${r}PERIZINAN DI TOLAK ANDA BUKAN RESELLER !${NC}"
    echo -e "   \033[0;33mVPS KAMU${NC} $ipsaya \033[0;33mBUKAN RESELLER${NC}"
    echo -e "     \033[0;33mBELI LICENCE RESELLER SCRIPT${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/freetunnel1"
    echo -e "      ${c}WhatsApp${NC} wa.me/6281927625651"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    sleep 5
    exit
  fi
}
checking_sc

TOKEN="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"
REPO="https://github.com/freetunnel/iz.git"
EMAIL="ageng.an46@gmail.com"
USER="freetunnel"

TIMES="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"

function lane() {
echo -e "${bc} ————————————————————————————————————————${NC}"
}

function LOGO() {
echo -e ""
lane
echo -e "${ungu}            FREE TUNNELING            "
lane
echo -e ""
}

function register() {
echo -e "${ungu}               Register IP              ${Suffix}"
}

function Credit_Freetunnel() {
sleep 1
echo -e "" 
lane
echo -e " ${c}     Terimakasih sudah menggunakan"
echo -e "      Script Credit by FREE TUNNELING${NC}"
lane
echo -e ""
exit 0
}

today=`date -d "0 days" +"%Y-%m-%d"`
git clone ${REPO} /root/iz/ &> /dev/null
clear
echo -e "MASUKAN IP VPS YANG BELUM DI DAFTAR !"
echo -e ""
read -p "Input IP Address : " ip
CLIENT_EXISTS=$(grep -w $ip /root/iz/ip | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo "IP Already Exist !"
exit 0
fi
echo -e ""
 read -p "  MASUKKAN USERNAME TANPA SPASI (Example : Freetunnel) : " name
read -p "Input Expired Days : " exp11
exp2=`date -d "$exp11 days" +"%Y-%m-%d"`
echo "### ${name} ${exp2} ${ip}" >> /root/iz/ip
cd /root/iz
git config --global user.email "${EMAIL}" &> /dev/null
git config --global user.name "${USER}" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add . &> /dev/null
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/freetunnel/iz
git push -f https://${TOKEN}@github.com/${USER}/iz.git &> /dev/null
rm -rf /root/iz
clear
sleep 1
echo "  Registering IP Address..."
sleep 1
echo "  Done!"
sleep 1
CHATID="-1001907100770"
KEY="6819626240:AAGIKBJZt7Gj9PfzcmNOaOOlctTrTIXNGRc"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TIMEZONE=$(printf '%(%H:%M:%S)T')
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   INFO REGISTER IP </b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>CLIENT NAME   : ${name}</b>
<b>IP VPS CLIENT  : ${ip}</b>
<b>REGISTER DATE : ${hariini}</b>
<b>EXPIRED DATE  : ${exp}</b>
<b>DURASI SCRIPT : ${certificate} Days</b>
<b>Succes Create this IP</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Tunggu 5Menit Untuk Server KeRefresh</i>
<b><i>Terima Kasih Sudah Menggunakan Script By Freetunnel</i></b>
curl -s --max-time 10 -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
lane
echo -e "${g}         SUCCESS ADD IP VPS      $NC"
lane
echo -e "${y}  USERNAME   :${NC}${yell} $name ${NC}"
echo -e "${y}  IP ADDRESS :${NC}${yell} $ip ${NC}"
echo -e "${y}  REGISTERED :${NC}${yell} $today ${NC}"
echo -e "${y}  EXPIRED ON :${NC}${yell} $exp2 ${NC}"
lane
Credit_Freetunnel
