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

echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
echo "${USERNAME} ALL=(ALL:ALL)   ALL" | sudo EDITOR='tee -a' visudo
echo "${USERNAME} ALL=(ALL:ALL)       NOPASSWD: ALL" | sudo EDITOR='tee -a'

expect -c "
spawn su - ${USERNAME}
expect \"Password:\"
send -- \"${PASSWORD}\n\"
"

# vagrantで移動した公開鍵をauthorized_keysに追加
mkdir ~/.ssh
sudo chmod 700 ~/.ssh
cd ~/.ssh/
sudo cat /home/vagrant/.ssh/id_rsa.pub >> authorized_keys
sudo rm /home/vagrant/.ssh/id_rsa.pub
chmod 600 authorized_keys
