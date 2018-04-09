RUBY_VERSION="2.5.1"

sudo yum install -y git gcc openssl-devel readline-devel zlib-devel sqlite-devel gcc-c++ libicu-devel cmake

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

if [ -e ~/.rbenv/bin/rbenv ]
  then
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
fi

source ~/.bash_profile
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install -l
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
ruby --version
gem install bundler
