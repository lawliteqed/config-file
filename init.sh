sudo yum remove vim-filesystem vim-enhanced vim-common
sudo yum install git
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

source ~/.bash_profile
sudo yum -y install gcc wget curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker autoconf bzip2 bzip2-devel libbz2-dev openssl openssl-devel readline readline-devel libffi-devel

#pyenvは↓でインストール
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.2
git clone https://github.com/vim/vim.git
sudo git clone https://github.com/vim/vim.git

sudo yum install ncurses-devel perl-ExtUtils-Embed python-devel readline-devel  lua-devel
