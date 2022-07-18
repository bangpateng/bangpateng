#!/bin/bash
echo "=============================================================="
echo -e "\033[0;35m"
echo "   ▄▄▄▄·  ▄▄▄·  ▐ ▄  ▄▄ •      ▄▄▄· ▄▄▄· ▄▄▄▄▄▄▄▄ . ▐ ▄  ▄▄ •     "
echo "   ▐█ ▀█▪▐█ ▀█ •█▌▐█▐█ ▀ ▪    ▐█ ▄█▐█ ▀█ •██  ▀▄.▀·•█▌▐█▐█ ▀ ▪    "
echo "   ▐█▀▀█▄▄█▀▀█ ▐█▐▐▌▄█ ▀█▄     ██▀·▄█▀▀█  ▐█.▪▐▀▀▪▄▐█▐▐▌▄█ ▀█▄    "
echo "   ██▄▪▐█▐█ ▪▐▌██▐█▌▐█▄▪▐█    ▐█▪·•▐█ ▪▐▌ ▐█▌·▐█▄▄▌██▐█▌▐█▄▪▐█    "
echo "  ·▀▀▀▀  ▀  ▀ ▀▀ █▪·▀▀▀▀     .▀    ▀  ▀  ▀▀▀  ▀▀▀ ▀▀ █▪·▀▀▀▀      "
echo -e "\e[0m"
echo "=============================================================="
sleep 2

if [ ! $NODENAME ]; then
     read -p "Enter node name: " NODENAME
     echo 'export NODENAME='$NODENAME >> $HOME/.bash_profile
fi

echo -e '\e[1;33m1.Update packagese\e[0m'
sudo apt update && sudo apt upgrade -y

echo -e '\e[1;33m2. Set up firewall\e[0m'
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 26656
sudo ufw allow 26657

echo -e '\e[1;33m3. Install Binary\e[0m'
sudo apt install build-essential git curl gcc make jq -y

echo -e '\e[1;33m4. Instal Golang\e[0m'
ver="1.18.3"
cd $HOME
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bash_profile
source ~/.bash_profile
go version

echo -e '\e[1;33m5. Setup Chain\e[0m'
cd $HOME
git clone https://github.com/TERITORI/teritori-chain && cd teritori-chain && git checkout teritori-testnet-v2 && make install
teritorid version
teritorid init $NODENAME --chain-id teritori-testnet-v2

echo -e '\e[1;33m6. Add Peers\e[0m'
sed -i.bak 's/persistent_peers =.*/persistent_peers = "0b42fd287d3bb0a20230e30d54b4b8facc412c53@176.9.149.15:26656,2371b28f366a61637ac76c2577264f79f0965447@176.9.19.162:26656,2f394edda96be07bf92b0b503d8be13d1b9cc39f@5.9.40.222:26656"/' $HOME/.teritorid/config/config.toml

echo -e '\e[1;33m7. Download Genessis\e[0m'
wget -O ~/.teritorid/config/genesis.json https://raw.githubusercontent.com/TERITORI/teritori-chain/main/testnet/teritori-testnet-v2/genesis.json

echo -e '\e[1;33m8. Running Node Bang\e[0m'
tee <<EOF >/dev/null /etc/systemd/system/teritorid.service

[Unit]
Description=Teritori Cosmos daemon
After=network-online.target

[Service]
User=$USER
ExecStart=/home/$USER/go/bin/teritorid start
Restart=on-failure
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

systemctl enable teritorid
systemctl daemon-reload
systemctl restart teritorid

# Node setup finished!

echo '=============== SETUP FINISHED ==================='
echo -e 'To check logs: \e[1m\e[32mjournalctl -u teritorid.service -f -n 100\e[0m'
