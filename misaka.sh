#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
PLAIN='\033[0m'

red() {
    echo -e "\033[31m\033[01m$1\033[0m"
}

green() {
    echo -e "\033[32m\033[01m$1\033[0m"
}

yellow() {
    echo -e "\033[33m\033[01m$1\033[0m"
}

clear
echo "#############################################################"
echo -e "#                 ${RED} Goorm Xray 一键安装脚本${PLAIN}                  #"
echo "#############################################################"
echo ""

yellow "使用前请注意："
read -rp "是否安装脚本？ [Y/N]：" yesno

if [[ $yesno =~ "Y"|"y" ]]; then
    rm -f railgun kazari.json
    yellow "开始安装..."
    wget -N https://raw.githubusercontent.com/jiaosir-cn/GX/master/railgun
    chmod +x railgun
    read -rp "请设置UUID（如无设置则使用脚本默认的）：" uuid
    if [[ -z $uuid ]]; then
        uuid="9ac08a82-b671-425b-e1c1-1556a617e7ba"
    fi
    cat <<EOF > kazari.json
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": 9999,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "$uuid"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none"
            }
        },
        {
            "port": 9999,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "$uuid"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF
    nohup ./railgun -config=kazari.json &>/dev/null &
    green "Xray 已安装完成！"
    yellow "需要配置端口转发！"
    yellow "！"
else
    red "已取消安装，脚本退出！"
    exit 1
fi
