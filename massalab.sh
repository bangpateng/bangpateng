#!/bin/bash
echo "=============================================================="
echo -e "\e[92m"
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
echo "====================================="

echo -e '\e[1;33m1.Update packagese\e[0m'
sudo apt update && sudo apt upgrade -y

echo -e '\e[1;33m2. Set up firewall\e[0m'
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 31244
sudo ufw allow 31245

echo -e '\e[1;33m3. Install Binary\e[0m'
sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev -y

echo -e '\e[1;33m4. Instal Rustup\e[0m'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo -e '\e[1;33m5. Configure Path\e[0m'
source $HOME/.cargo/env

echo -e '\e[1;33m6. Instal Nightly\e[0m'
rustup toolchain install nightly && rustup default nightly

echo -e '\e[1;33m7. Clone Repo\e[0m'
git clone --branch testnet https://github.com/massalabs/massa.git

# Node setup finished!

echo "==================================================="
echo -e '\e[32mInstal Node Complete Bang!\e[39m' && sleep 1
sleep 2
