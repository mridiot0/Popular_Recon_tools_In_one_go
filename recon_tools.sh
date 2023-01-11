#!/usr/bin/env bash
# Color
red='\e[31m'
green='\e[32m'
blue='\e[34m'
white='\e[97m'
clear
#Checking if sudo or not
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
#Starting the tool installation
install_apt() {
    #updating System
    eval apt update -y
    read -p "Want to full upgrade your system $foo? [y/n]" answer
    if [[ $answer = y ]] ; then
    sudo apt-get full-upgrade -y
    fi
    #installing chromium
    eval apt install chromium-browser -y 
    eval apt install chromium -y 
    #installing Necessary components
    eval apt install python3 python3-pip build-essential gcc cmake ruby whois git curl libpcap-dev wget zip python3-dev pv dnsutils libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev nmap jq apt-transport-https lynx tor medusa xvfb libxml2-utils procps bsdmainutils libdata-hexdump-perl -y
    sudo apt-get autoremove -y
	sudo apt clean
    #Installing Golang
    sudo apt install golang -y
    printf "${blue} Installing All Go tools"
    #subfinder
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    printf "${red} Don't forget to add API keys to $HOME/.config/subfinder/provider-config.yaml"
    #amass 
    go install -v github.com/OWASP/Amass/v3/...@master
    printf " ${red} Don't forget to configure the config.ini file in $HOME/.config/amass/config.in"
    printf "${red} If the file doesn't exists then create one from https://github.com/OWASP/Amass/blob/master/examples/config.ini"
    printf "Nuclei"
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    printf "Naabu"
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    printf "shosubgo"
    go install github.com/incogbyte/shosubgo@latest
    printf "subjs"
    go install -v github.com/lc/subjs@latest
    printf "Dalfox"
    go install github.com/hahwul/dalfox/v2@latest
    printf "Kxss"
    go install github.com/Emoe/kxss@latest
    printf "assetfinder"
    go install github.com/tomnomnom/assetfinder@latest
    printf "httpx"
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    printf "katana"
    go install github.com/projectdiscovery/katana/cmd/katana@latest
    printf "gowitness"
    go install -v github.com/sensepost/gowitness@latest
    printf "Wappalyzergo"
    go install -v github.com/projectdiscovery/wappalyzergo/cmd/update-fingerprints@latest
    printf "Shuffle Dns"
    go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
    printf "Anew"
    go install -v github.com/tomnomnom/anew@latest
    printf "GoSpider"
    GO111MODULE=on go install github.com/jaeles-project/gospider@latest
    printf "GetJS"
    go install github.com/003random/getJS@latest
    printf "Haktrails"
    go install -v github.com/hakluke/haktrails@latest
    printf "haktldextract"
    go install github.com/hakluke/haktldextract@latest
    printf "gf"
    go install github.com/tomnomnom/gf@latest
    printf "qsreplace"
    go install github.com/tomnomnom/qsreplace@latest
    printf "meg"
    go install github.com/tomnomnom/meg@latest
    printf "gau"
    go install github.com/lc/gau/v2/cmd/gau@latest
    
    printf "Copying the files to /usr/local/bin"
    cp ~/go/bin/* /usr/local/bin
    printf "@@Updating Nuclei"
    nuclei -ut -v
    echo " Getting the GF patterns from 1ndianl33t"
    cd ~
    git clone https://github.com/1ndianl33t/Gf-Patterns
    mkdir ~/.gf
    cd Gf-Patterns
    cp *.json ~/.gf
    rm -rf Gf-Patterns
    printf "Pre GF patterns from Tomnomnom"
    cd ~/go/pkg/mod/github.com/tomnomnom/gf*/examples
    cp *.json ~/.gf
    #Findomain
    printf "Installing Findomain"
    curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip
    unzip findomain-linux-i386.zip
    chmod +x findomain
    sudo mv findomain /usr/bin/findomain
    printf "FeroxBuster"
    sudo apt install -y feroxbuster
    printf "Getting xnlinkfinder, subdoaminizer, waymore"
    cd ~
    mkdir tools
    cd tools
    git clone https://github.com/nsonaniya2010/SubDomainizer.git
    cd SubDomainizer
    pip3 install -r requirements.txt
    cd ..
    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git
    cd xnLinkFinder
    sudo python setup.py install
    cd ..
    git clone https://github.com/xnl-h4ck3r/waymore.git
    cd waymore
    sudo python setup.py install
    cd ~
    read -p "Want to Install mobile app checking tools also $foo? [y/n]" answer
    if [[ $answer = y ]] ; then
    sudo apt install -y jadx
    pip3 install apkleaks
    fi
sudo apt install figlet -y
figlet -c "HAPPY HACKING"
}
install_pacman() {
    # Getting BlackArch Repo
    curl -O https://blackarch.org/strap.sh
    echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c
    chmod +x strap.sh
    sudo ./strap.sh
    #Updating System
    sudo pacman -Sy
    read -p "${green} Want to full upgrade your system $foo? [y/n]" answer
    if [[ $answer = y ]] ; then
    sudo pacman -Syyu
    fi
    #Installing Chromium
    sudo pacman -S chromium
    #Installing GO
    sudo pacman -S go
    printf "Installing Go Tools"
     printf "${blue} Installing All Go tools"
    #subfinder
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    printf "${red} Don't forget to add API keys to $HOME/.config/subfinder/provider-config.yaml"
    #amass 
    go install -v github.com/OWASP/Amass/v3/...@master
    printf " ${red} Don't forget to configure the config.ini file in $HOME/.config/amass/config.in"
    printf "${red} If the file doesn't exists then create one from https://github.com/OWASP/Amass/blob/master/examples/config.ini"
    printf "Nuclei"
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    printf "Naabu"
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    printf "shosubgo"
    go install github.com/incogbyte/shosubgo@latest
    printf "subjs"
    go install -v github.com/lc/subjs@latest
    printf "Dalfox"
    go install github.com/hahwul/dalfox/v2@latest
    printf "Kxss"
    go install github.com/Emoe/kxss@latest
    printf "assetfinder"
    go install github.com/tomnomnom/assetfinder@latest
    printf "httpx"
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    printf "katana"
    go install github.com/projectdiscovery/katana/cmd/katana@latest
    printf "gowitness"
    go install -v github.com/sensepost/gowitness@latest
    printf "Wappalyzergo"
    go install -v github.com/projectdiscovery/wappalyzergo/cmd/update-fingerprints@latest
    printf "Shuffle Dns"
    go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
    printf "Anew"
    go install -v github.com/tomnomnom/anew@latest
    printf "GoSpider"
    GO111MODULE=on go install github.com/jaeles-project/gospider@latest
    printf "GetJS"
    go install github.com/003random/getJS@latest
    printf "Haktrails"
    go install -v github.com/hakluke/haktrails@latest
    printf "haktldextract"
    go install github.com/hakluke/haktldextract@latest
    printf "gf"
    go install github.com/tomnomnom/gf@latest
    printf "qsreplace"
    go install github.com/tomnomnom/qsreplace@latest
    printf "meg"
    go install github.com/tomnomnom/meg@latest
    printf "gau"
    go install github.com/lc/gau/v2/cmd/gau@latest
    
    printf "Copying the files to /usr/local/bin"
    cp ~/go/bin/* /usr/local/bin
    printf "@@Updating Nuclei"
    nuclei -ut -v
    echo " Getting the GF patterns from 1ndianl33t"
    cd ~
    git clone https://github.com/1ndianl33t/Gf-Patterns
    mkdir ~/.gf
    cd Gf-Patterns
    cp *.json ~/.gf
    rm -rf Gf-Patterns
    #Pre GF patterns from Tomnomnom
    cd ~/go/pkg/mod/github.com/tomnomnom/gf*/examples
    cp *.json ~/.gf
    #Findomain
    printf "Installing Findomain"
    sudo pacman -S findomain
    printf "Getting xnlinkfinder, subdoaminizer, waymore"
    cd ~
    mkdir tools
    cd tools
    git clone https://github.com/nsonaniya2010/SubDomainizer.git
    cd SubDomainizer
    pip3 install -r requirements.txt
    cd ..
    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git
    cd xnLinkFinder
    sudo python setup.py install
    cd ..
    git clone https://github.com/xnl-h4ck3r/waymore.git
    cd waymore
    sudo python setup.py install
    cd ~
    printf "Installing ffuf"
    pacman -S ffuf
    printf "Mobile apps checking tools"
    sudo pacman -S apkleaks jadx
}

printf "${blue} Selecting OS"
	if [ -f /etc/debian_version ]; then install_apt;
    #elif [ -f /etc/redhat-release ]; then install_yum;
    elif [ -f /etc/arch-release ]; then install_pacman;
    #elif [ "True" = "$IS_MAC" ]; then install_brew;
    #elif [ -f /etc/os-release ]; then install_yum;  #/etc/os-release fall in yum for some RedHat and Amazon Linux instances
    fi
