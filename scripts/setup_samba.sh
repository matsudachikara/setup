#/bin/bash

# 手動設定
# USERNAME=""
# PASSWORD=""

# シェルから渡す場合
USERNAME=$1
PASSWORD=$2

sudo yum -y install samba

cd
mkdir samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.original

echo "

[${USERNAME}]
        path = /home/${USERNAME}/samba
        writable = yes
" | sudo tee -a /etc/samba/smb.conf

sudo service smb start
sudo chkconfig smb on
