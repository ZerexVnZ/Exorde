#!/bin/bash
echo -e "\033[0;35m"

echo " ▄▄▄       ██▓     ██▓███   ██░ ██  ▄▄▄       ██▓    ▓█████ ██▒   █▓▓█████  ██▀███   ▄▄▄        ▄████ ▓█████ ";
echo "▒████▄    ▓██▒    ▓██░  ██▒▓██░ ██▒▒████▄    ▓██▒    ▓█   ▀▓██░   █▒▓█   ▀ ▓██ ▒ ██▒▒████▄     ██▒ ▀█▒▓█   ▀ ";
echo "▒██  ▀█▄  ▒██░    ▓██░ ██▓▒▒██▀▀██░▒██  ▀█▄  ▒██░    ▒███   ▓██  █▒░▒███   ▓██ ░▄█ ▒▒██  ▀█▄  ▒██░▄▄▄░▒███   ";
echo "░██▄▄▄▄██ ▒██░    ▒██▄█▓▒ ▒░▓█ ░██ ░██▄▄▄▄██ ▒██░    ▒▓█  ▄  ▒██ █░░▒▓█  ▄ ▒██▀▀█▄  ░██▄▄▄▄██ ░▓█  ██▓▒▓█  ▄ ";
echo " ▓█   ▓██▒░██████▒▒██▒ ░  ░░▓█▒░██▓ ▓█   ▓██▒░██████▒░▒████▒  ▒▀█░  ░▒████▒░██▓ ▒██▒ ▓█   ▓██▒░▒▓███▀▒░▒████▒";
echo " ▒▒   ▓▒█░░ ▒░▓  ░▒▓▒░ ░  ░ ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░▓  ░░░ ▒░ ░  ░ ▐░  ░░ ▒░ ░░ ▒▓ ░▒▓░ ▒▒   ▓▒█░ ░▒   ▒ ░░ ▒░ ░";
echo "  ▒   ▒▒ ░░ ░ ▒  ░░▒ ░      ▒ ░▒░ ░  ▒   ▒▒ ░░ ░ ▒  ░ ░ ░  ░  ░ ░░   ░ ░  ░  ░▒ ░ ▒░  ▒   ▒▒ ░  ░   ░  ░ ░  ░";
echo "  ░   ▒     ░ ░   ░░        ░  ░░ ░  ░   ▒     ░ ░      ░       ░░     ░     ░░   ░   ░   ▒   ░ ░   ░    ░   ";
echo "      ░  ░    ░  ░          ░  ░  ░      ░  ░    ░  ░   ░  ░     ░     ░  ░   ░           ░  ░      ░    ░  ░";
echo "                                                                ░                                            ";
echo "                                                                                                             ";
echo "                                                                                                             ";
echo "                                                                                                             ";
echo -e "\e[0m"

sleep 3

if [ ! $METAMASKWALLET ]; then
	read -p "Nhập địa chỉ ví của bạn mà bạn sử dụng cho testnet: " METAMASKWALLET
	echo 'export METAMASKWALLET='$METAMASKWALLET >> $HOME/.bash_profile
fi


source $HOME/.bash_profile

echo -e "\e[1m\e[32m1. Đang cập nhật máy chủ..\e[0m"
echo "======================================================"
sleep 1
sudo apt update && sudo apt upgrade -y

echo -e "\e[1m\e[32m2. Docker đang được cài đặt, các cài đặt cần thiết khác đang được thực hiện.\e[0m"
echo "======================================================"
sleep 1
sudo apt install docker.io -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt install screen -y



echo -e "\e[1m\e[32m3. Binary files đang tải..\e[0m"
echo "======================================================"
sleep 1

git clone https://github.com/exorde-labs/ExordeModuleCLI.git

cd ExordeModuleCLI

docker build -t exorde-cli .


echo -e "\e[1m\e[32m3. Screen hiện lên.. \e[0m"
echo "======================================================"
sleep 1

screen -S Exorde
