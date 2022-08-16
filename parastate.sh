#!/bin/bash

echo -e "\e[92m"
echo "   ▄▄▄▄·  ▄▄▄·  ▐ ▄  ▄▄ •      ▄▄▄· ▄▄▄· ▄▄▄▄▄▄▄▄ . ▐ ▄  ▄▄ •     "
echo "   ▐█ ▀█▪▐█ ▀█ •█▌▐█▐█ ▀ ▪    ▐█ ▄█▐█ ▀█ •██  ▀▄.▀·•█▌▐█▐█ ▀ ▪    "
echo "   ▐█▀▀█▄▄█▀▀█ ▐█▐▐▌▄█ ▀█▄     ██▀·▄█▀▀█  ▐█.▪▐▀▀▪▄▐█▐▐▌▄█ ▀█▄    "
echo "   ██▄▪▐█▐█ ▪▐▌██▐█▌▐█▄▪▐█    ▐█▪·•▐█ ▪▐▌ ▐█▌·▐█▄▄▌██▐█▌▐█▄▪▐█    "
echo "  ·▀▀▀▀  ▀  ▀ ▀▀ █▪·▀▀▀▀     .▀    ▀  ▀  ▀▀▀  ▀▀▀ ▀▀ █▪·▀▀▀▀      "
echo -e "\e[0m"

sleep 2

echo "======================================="
echo -e '\e[36mAuthor :\e[39m' Bang Pateng
echo -e '\e[36mTelegram Group :\e[39m' @bangpateng_group
echo -e '\e[36mTelegram Channel :\e[39m' @bangpateng_airdrop
echo -e '\e[36mYoutube :\e[39m' Bang Pateng
echo -e '\e[36mWebsite :\e[39m' www.bangpatengnode.site
echo "======================================="

echo -e '\e[1;33m1.Update packagese\e[0m'
sudo apt update && sudo apt upgrade -y

echo -e '\e[1;33m2. Install dependencies\e[0m'
sudo apt install wget jq build-essential nano unzip -y

echo -e '\e[1;33m3. Install docker\e[0m'
sudo apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo -e '\e[1;33m4. Install docker compose\e[0m'
docker_compose_version=$(wget -qO- https://api.github.com/repos/docker/compose/releases/latest | jq -r ".tag_name")
sudo wget -O /usr/bin/docker-compose "https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-`uname -s`-`uname -m`"
sudo chmod +x /usr/bin/docker-compose

echo -e '\e[1;33m# 5. Set up firewall\e[0m'
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22

echo -e '\e[1;33m# 6. Clone Repository\e[0m'
cd $HOME
git clone --recurse-submodules https://github.com/ParaState/SafeStakeOperator
cd dvf
sudo docker compose build -f docker-compose-boot.yml build
sudo docker compose build -f docker-compose-boot.yml up -d
docker-compose -f docker-compose-boot.yml logs -f dvf_root_node | grep enr

# Instalisasi Selesai Bang Bang!

echo "==================================================="
echo -e '\e[32mInstalisasi Selesai Bang Bang!\e[39m' && sleep 1
sleep 2
