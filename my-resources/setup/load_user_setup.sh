#!/bin/bash

cat tmux/tmux.conf >> ~/.exegol/my-resources/setup/tmux/tmux.conf

mkdir -p /opt/resources/{windows,linux} && mv ./windows/* /opt/resources/windows/ && mv ./linux/* /opt/resources/linux/

# Install packages
apt install -y expect nikto arp-scan snmp-mibs-downloader flameshot fish httpie wfuzz whatweb xeuledoc

# Python package installations
pip3 install uploadserver hekatomb wsgidav cheroot pyftpdlib instaloader chiasmodon socialscan MetaDetective mmh3 smbclientng
pipx install git+https://github.com/nccgroup/GTFOBLookup.git
pipx install ghunt gitfive secator

# Clone repositories
git clone https://github.com/cipher387/juicyinfo-nuclei-templates /opt/cipher387-juicyinfo-nuclei-templates
git clone https://github.com/chrislockard/api_wordlist.git /opt/api_wordlist
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git /opt/resources/windows
git clone https://github.com/Idov31/MrKaplan.git /opt/resources/windows
git clone https://github.com/CoolHandSquid/TireFire.git /opt/tools/TireFire && (cd /opt/tools/TireFire && ./Build.sh)
git clone https://github.com/Kr0wZ/SnapIntel.git /opt/tools/SnapIntel && pip install -r /opt/tools/SnapIntel/requirements.txt
git clone https://github.com/alfredredbird/tookie-osint /opt/tools/tookie-osint && pip3 install -r /opt/tools/tookie-osint/requirements.txt
git clone https://github.com/Frozenka/uploader.git /opt/tools/uploader && pip3 install -r /opt/tools/uploader/requirements.txt
git clone https://github.com/N0rz3/Zehef.git /opt/tools/Zehef && pip3 install -r /opt/tools/Zehef/requirements.txt
git clone https://github.com/Datalux/Osintgram.git /opt/tools/Osintgram && cd /opt/tools/Osintgram && python3 -m venv env && source env/bin/activate && pip install -r requirements.txt
git clone https://github.com/dalunacrobate/DaProfiler.git /opt/tools/DaProfiler && cd /opt/tools/DaProfiler && pip install -r requirements.txt

# Wordlists
wget -P /opt https://raw.githubusercontent.com/insidetrust/statistically-likely-usernames/master/jsmith.txt
wget -P /opt https://raw.githubusercontent.com/z5jt/API-documentation-Wordlist/main/api-documentation-endpoint.txt
wget -P /opt https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt

# Download scripts and resources
wget -P /opt/resources/windows https://raw.githubusercontent.com/fashionproof/EnableAllTokenPrivs/master/EnableAllTokenPrivs.ps1
wget -P /opt/resources/windows https://raw.githubusercontent.com/Frozenka/linfast/main/winfast
wget -P /opt/resources/linux https://raw.githubusercontent.com/Frozenka/linfast/main/linfast
wget -P /opt/resources/linux https://raw.githubusercontent.com/UserCr4ig/Turbolehe/master/turbolehe.py
wget -P /opt/resources/linux https://github.com/mufeedvh/moonwalk/releases/download/v1.0.0/moonwalk_linux
wget -P /opt/resources/linux https://raw.githubusercontent.com/laluka/pty4all/master/socat-multi-handler.sh

wget -P /tmp https://github.com/RickdeJager/stegseek/releases/download/v0.6/stegseek_0.6-1.deb
apt install -y ./stegseek_0.6-1.deb

chmod +x -R /opt/resources/linux /opt/resources/windows

# Configure SSH
echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config