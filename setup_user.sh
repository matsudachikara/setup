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
