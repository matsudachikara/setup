sudo yum install -y git gcc openssl-devel readline-devel zlib-devel sqlite-devel gcc-c++ libicu-devel cmake

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install -l
rbenv install 2.4.0
rbenv global 2.4.0
ruby --version

gem install rails
