#!/bin/bash
# kitematic初回起動時でエラーが出た時のリセット用shell
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo rm -f /usr/local/bin/docker*
pkill VirtualBox
pkill VBox
rm -rf ~/Library/Application\ Support/Kitematic/
rm -rf ~/.docker
rm -rf ~/Library/VirtualBox/
rm -rf ~/Kitematic
$DIR/VirtualBox_Uninstall.tool
