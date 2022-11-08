#!/bin/bash
#Autoscript-Lite By Vinstechmy
clear
MYIP=$(wget -qO- ipv4.icanhazip.com);
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\\E[0;41;36m    Check XRAY Vmess WS Config     \E[0m"
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                echo "You have no existing clients!"
                clear
                exit 1
        fi

        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\\E[0;41;36m    Check XRAY Vmess WS Config     \E[0m"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  Expired   User"
        grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
tls="$(cat ~/log-install.txt | grep -w "VMESS WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VMESS WS None TLS" | cut -d: -f2|sed 's/ //g')"
domain=$(cat /usr/local/etc/xray/domain)
uuid=$(grep "},{" /usr/local/etc/xray/config.json | cut -b 11-46 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmess_base644=$( base64 -w 0 <<< $vmess_json4)
vmess_base645=$( base64 -w 0 <<< $vmess_json5)
vmess_base646=$( base64 -w 0 <<< $vmess_json5)
vmess_base647=$( base64 -w 0 <<< $vmess_json5)
vmess_base648=$( base64 -w 0 <<< $vmess_json5)
vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"
vmesslink3="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-maxis.json)"
vmesslink4="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-digi.json)"
vmesslink5="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-celcom.json)"
vmesslink6="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-yes.json)"
vmesslink7="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-maxistv.json)"
vmesslink8="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-umo.json)"
clear
echo -e ""
echo -e "════════════[XRAY VMESS WS]════════════"
echo -e "Remarks           : ${user}"
echo -e "Domain            : ${domain}"
echo -e "Port TLS          : ${tls}"
echo -e "Port None TLS     : ${none}"
echo -e "ID                : ${uuid}"
echo -e "AlterId           : 0"
echo -e "Security          : Auto"
echo -e "Network           : WS"
echo -e "Path TLS          : /vmess-tls"
echo -e "Path NTLS         : /vmess-ntls"
echo -e "═══════════════════════════════════════"
echo -e "Link WS TLS       : ${vmesslink1}"
echo -e "═══════════════════════════════════════"
echo -e "Link WS None TLS  : ${vmesslink2}"
echo -e "═══════════════════════════════════════"
echo -e "Link (MAXIS)      : ${vmesslink3}"
echo -e "═══════════════════════════════════════"
echo -e "Link (MAXIS-TV)   : ${vmesslink7}"
echo -e "═══════════════════════════════════════"
echo -e "Link (DIGI)       : ${vmesslink4}"
echo -e "═══════════════════════════════════════"
echo -e "Link (CELCOM)     : ${vmesslink5}"
echo -e "═══════════════════════════════════════"
echo -e "Link (YES)        : ${vmesslink6}"
echo -e "═══════════════════════════════════════"
echo -e "Link (UMO)        : ${vmesslink8}"
echo -e "═══════════════════════════════════════"
echo -e "YAML WS TLS       : http://${MYIP}:81/$user-VMESSTLS.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML WS None TLS  : http://${MYIP}:81/$user-VMESSNTLS.yaml"
echo -e "════════════════════════════════════════"
echo -e "Created On        : $hariini"
echo -e "Expired On        : $exp"
echo -e "═══════════════════════════════════════"
echo -e ""
echo -e "Autoscript By Vinstechmy"
echo -e ""