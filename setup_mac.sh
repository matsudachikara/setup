#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.bash_profile

source ~/.bash_profile

# vagratntは/Applicationにインストールされなかったのでコメントアウト
# brew cask install vagrant
brew cask install iterm2
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install sequel-pro
brew cask install firefox
brew cask install atom
# dockerだけでdocker-composeもインストールされる
brew cask install docker

brew install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
brew install ruby-build
brew install rbenv-gemset
brew install rbenv-gem-rehash

#rbenv 更新
rm -rf ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# brew caskでインストールしたものをアップデート（強制再インストール）
brew cask install --force $(brew cask list)