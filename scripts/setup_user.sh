#/bin/bash

USERNAME=""
PASSWORD=""

# 事前にexpectをインストール
sudo yum -y install expect

sudo useradd ${USERNAME}
expect -c "
spawn sudo passwd ${USERNAME}
expect \"New password:\"
send -- \"${PASSWORD}\n\"
expect \"Retype new password:\"
send -- \"${PASSWORD}\n\"
expect \"passwd: all authentication tokens updated successfully.\"
send -- \"exit\n\"
"

echo "${USERNAME} ALL=(ALL:ALL)   ALL" | sudo EDITOR='tee -a' visudo
echo "${USERNAME} ALL=(ALL:ALL)       NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo

expect -c "
spawn su - ${USERNAME}
expect \"Password:\"
send -- \"${PASSWORD}\n\"
"

# vagrantで移動した公開鍵をauthorized_keysに追加
if [ ! -e ~/.ssh ]; then
  mkdir ~/.ssh
fi
sudo chmod 700 ~/.ssh
cd ~/.ssh/

if [ ! -e ~/.ssh/authorized_keys ]; then
  touch ~/.ssh/authorized_keys
fi
sudo chmod 600 authorized_keys

if [ -e /home/vagrant/.ssh/id_rsa.pub ]; then
  sudo cat /home/vagrant/.ssh/id_rsa.pub >> authorized_keys
  sudo rm /home/vagrant/.ssh/id_rsa.pub
fi

if [ ! -e ~/.ssh/config ]; then
  touch ~/.ssh/config
fi
if [ -e ~/.ssh/config ]; then
  echo 'ServerAliveInterval 30' >> ~/.ssh/config
  echo 'ServerAliveCountMax 3' >> ~/.ssh/config
fi
sudo chmod 600 ~/.ssh/config
