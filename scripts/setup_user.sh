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
echo "${USERNAME} ALL=(ALL:ALL)       NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo

expect -c "
spawn su - ${USERNAME}
expect \"Password:\"
send -- \"${PASSWORD}\n\"
"

mkdir ~/.ssh
mv id_rsa.pub ~/.ssh/
cd ~/.ssh/
cat id_rsa.pub >> authorized_keys
rm id_rsa.pub
chmod 600 authorized_keys
