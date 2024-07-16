#!/bin/bash
# Token SatanFusionOfficial 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
    TOKEN="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"
    git clone https://github.com/freetunnel/iz /root/iz/ &> /dev/null
    clear
    echo ""
    echo -e "${g}         LIST IP VPS          $NC"
    grep -E "^###" "/root/iz/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    grep -E "^#&"  "/root/iz/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq

    read -p "Input IP Address To Delete : " ipdel
    name=$(cat /root/iz/ip | grep $ipdel | awk '{print $2}')
    exp=$(cat /root/iz/ip | grep $ipdel | awk '{print $3}')
    if [[ ${exp} == 'Lifetime' ]]; then
    sed -i "/^#&   $name   $exp $ipdel/,/^},{/d" /root/iz/ip
    else
    sed -i "/^### $name $exp $ipdel/,/^},{/d" /root/iz/ip
    fi
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
    rm -rf /root/iz
    clear
    sleep 1
    echo "  Delete IP Address..."
    sleep 1
    echo "  Processing..."
    sleep 1
    echo "  Done!"
    sleep 1
