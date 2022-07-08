#!/bin/bash
echo "=============================================================="
echo -e "\[40m\e[92m"
echo "   ▄▄▄▄·  ▄▄▄·  ▐ ▄  ▄▄ •      ▄▄▄· ▄▄▄· ▄▄▄▄▄▄▄▄ . ▐ ▄  ▄▄ •     "
echo "   ▐█ ▀█▪▐█ ▀█ •█▌▐█▐█ ▀ ▪    ▐█ ▄█▐█ ▀█ •██  ▀▄.▀·•█▌▐█▐█ ▀ ▪    "
echo "   ▐█▀▀█▄▄█▀▀█ ▐█▐▐▌▄█ ▀█▄     ██▀·▄█▀▀█  ▐█.▪▐▀▀▪▄▐█▐▐▌▄█ ▀█▄    "
echo "   ██▄▪▐█▐█ ▪▐▌██▐█▌▐█▄▪▐█    ▐█▪·•▐█ ▪▐▌ ▐█▌·▐█▄▄▌██▐█▌▐█▄▪▐█    "
echo "  ·▀▀▀▀  ▀  ▀ ▀▀ █▪·▀▀▀▀     .▀    ▀  ▀  ▀▀▀  ▀▀▀ ▀▀ █▪·▀▀▀▀      "
echo -e "\e[0m"
echo "=============================================================="
sleep 2

echo -e '\e[36mAuthor :\e[39m' Bang Pateng
echo -e '\e[36mTelegram Group :\e[39m' @bangpateng_group
echo -e '\e[36mTelegram Channel :\e[39m' @bangpateng_airdrop
echo -e '\e[36mYoutube :\e[39m' Bang Pateng
echo -e '\e[36mWebsite :\e[39m' www.bangpatengnode.site
echo "======================================="

echo -e '\e[36m1.Update packagese\e[39m'
sudo apt update && sudo apt upgrade -y

echo -e '\e[36m2. Install dependencies\e[39m'
sudo apt install wget jq build-essential nano unzip -y

echo -e '\e[36m3. Install docker\e[39m'
sudo apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo -e '\e[36m4. Install docker compose\e[39m'
docker_compose_version=$(wget -qO- https://api.github.com/repos/docker/compose/releases/latest | jq -r ".tag_name")
sudo wget -O /usr/bin/docker-compose "https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-`uname -s`-`uname -m`"
sudo chmod +x /usr/bin/docker-compose

echo -e '\e[36m5. Set up firewall\e[39m'
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 8000
sudo ufw allow 9090
sudo ufw allow 9100
sudo ufw allow 3000:3100/tcp

echo -e '\e[36m6. Install SubQuery\e[39m'
cd $HOME
mkdir subquery-indexer && cd subquery-indexer
wget -qO docker-compose.yml https://raw.githubusercontent.com/subquery/indexer-services/main/docker-compose.yml
docker-compose up -d

# Node setup finished!

dashboard_url="http://$(wget -qO- eth0.me):8000"

echo "==================================================="
echo -e '\e[32mNode setup finished!\e[39m' && sleep 1
echo -e "Untuk Mengakses Dashboard Buka di Google Chrome Kalian: \e[32m$dashboard_url\e[39m"
sleep 2
