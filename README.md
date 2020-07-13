# fastbox
quick vps setup script

## what
- creates digital ocean droplet
- sends shell script over scp and runs it
- creates a sudo user setup with your ssh key
- this user is passwordless. add if you want
- setup basic firewall rules for ssh

## setup
```
add you ssh public key to your digital ocean account
git clone https://github.com/txxbo/fastbox.git
cd fastbox
git clone https://github.com/txxbo/oceanic.git
python3 -m pip install python-digitalocean
nano oceanic/config.py # add your digital ocean api
nano install.sh # modify boxname/boxuser
chmod +x *.sh
./install.sh 
```
