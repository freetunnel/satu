#!/bin/bash
# // PROJECT XDXL STORE
url_izin="https://raw.githubusercontent.com/freetunnel/iz/main/admin"
IP=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
checking_sc() {
  useexp=$(wget -qO- $url_izin | grep $IP | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $IP \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mWhatsapp${NC} wa.me/6281927625651"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
# Token SatanFusionOfficial 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
TOKEN="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"
today=`date -d "0 days" +"%Y-%m-%d"`
git clone https://github.com/freetunnel/iz.git /root/ip/ &> /dev/null
clear
echo -e ""
read -p "Input IP Address : " ip
CLIENT_EXISTS=$(grep -w $ip /root/iz/ip | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo "IP Already Exist !"
rm -rf /root/ip
exit 0
fi
name=FTP-`</dev/urandom tr -dc A-Z0-9 | head -c4`
clear
read -p " Masukan waktu expired : " -e exp
exp2=`date -d "${exp} days" +"%Y-%m-%d"`
echo "### ${name} ${exp2} ${ip}" >> /root/iz/ip
cd /root/iz
git config --global user.email "ageng.an46@gmail.com" &> /dev/null
git config --global user.name "freetunnel" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add . &> /dev/null
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/freetunnel/iz
git push -f https://${TOKEN}@github.com/freetunnel/iz.git &> /dev/null
rm -rf /root/ip
clear
