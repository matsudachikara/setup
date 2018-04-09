#/bin/bash

USERNAME=""
PASSWORD=""

vagrant ssh-config > ssh.config
scp -P 2222 /Users/matsuda.chikara/.ssh/id_rsa.pub vagrant@0.0.0.0:~/${USERNAME}/.ssh
