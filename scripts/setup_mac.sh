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
brew cask install docker-toolbox
brew cask install kitematic
brew cask install mysqlworkbench


brew install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"c
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
brew install ruby-build
brew install rbenv-gemset
brew install rbenv-gem-rehash
brew install git-lfs
brew install git
brew install bash-completion

#terminalでgit branch表示＆補完
echo 'source /usr/local/etc/bash_completion.d/git-prompt.sh' >> ~/.bash_profile
echo 'source /usr/local/etc/bash_completion.d/git-completion.bash' >> ~/.bash_profile
echo 'GIT_PS1_SHOWDIRTYSTATE=true' >> ~/.bash_profile
echo 'export PS1="\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ "' >> ~/.bash_profile

# nodeインストール
brew install nodebrew
mkdir -p ~/.nodebrew/src
nodebrew install-binary latest
nodebrew list | grep v | xargs nodebrew use
echo "export PATH=$PATH:/Users/$USER/.nodebrew/current/bin" >> ~/.bash_profile

# finderで隠しファイル表示する設定
defaults write com.apple.finder AppleShowAllFiles TRUE

#rbenv 更新
rm -rf ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# brew caskでインストールしたものをアップデート（強制再インストール）
brew cask install --force $(brew cask list)
