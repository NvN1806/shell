#!/bin/bash
sudo apt-get update
sudo apt-get dist-upgrade

if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no" )
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz
					sudo tar -xvf go1.12.7.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi

mkdir tools
cd ~/tools/

#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done aquatone"

echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done Jsparser"

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done sublister"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done dirsearch"

echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done lazys3"

echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "done knock.py"

echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "done lazyrecon"

echo "installing findomain"
curl https://sh.rustup.rs -sSf | sh
export PATH="$HOME/.cargo/bin:$PATH" >> ~/.profile
git clone https://github.com/Edu4rdSHL/findomain.git
 cd ~/tools/findomain
 cargo build --release
 sudo cp target/release/findomain /usr/bin/
 cd ~/tools/
echo "Fd done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done massdns"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done asn"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done hhtprobe"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done wybackurls"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done unfurl"

echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done assetfinder"

echo "installing meg"
 go get -u github.com/tomnomnom/meg
echo "done meg"

echo "installing anew" 
 go get -u github.com/tomnomnom/anew
ech "done anew"

echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done seclist"

echo "install amass"
apt-get install amass
echo "amass done"

echo "downloading webscreenshots"
cd ~/tools/
pip install webscreenshot
cd ~/tools/webscreenshot/
pip install -r requirements.txt
cd ~/tools/
apt install phantomjs
phantomjs -v
apt-get install xvfb
echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"

echo "NvN you are ready let's hack!!!!"
