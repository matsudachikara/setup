USERNAME="vagrant"
identity_file="/Users/matsuda.chikara/.ssh/id_rsa"
target_host="127.0.0.1"

ssh-copy-id -p2222 -i ${identity_file} ${USER}@${target_host}

# cat ~/.ssh/id_rsa.pub | ssh ${USER}@${target_host} "mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys"
