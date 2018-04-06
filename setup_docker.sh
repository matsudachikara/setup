#/bin/bash

sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce

sudo groupadd docker
sudo usermod -aG docker $USER
sudo gpasswd -a $USER docker

sudo systemctl enable docker
sudo systemctl start docker

# docker-composerの最新のパスは手動で書き換え

# sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# docker-compose --version

# selinuxでインストール失敗する場合は最新を手動で入れる
# http://mirror.centos.org/centos/7/extras/x86_64/Packages/
# sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.42-1.gitad8f0f7.el7.noarch.rpm
