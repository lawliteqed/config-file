#https://qiita.com/yoshiyasu1111/items/f2cab116d68ed1a0ce13
#sudo yum install yum-utils device-mapper-persistent-data lvm2
#
##repo登録
#sudo yum-config-manager \
#    --add-repo \
#    https://download.docker.com/linux/centos/docker-ce.repo
#
##インストールバージョン確認
#sudo yum list  docker-ce  --showduplicates | sort -r
#
##https://qiita.com/shinespark/items/a8019b7ca99e4a30d286
#sudo yum install docker
#
#
##docker-compose install
#sudo curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
#
#alias d='docker'
#alias dc='docker-compose'


#一般ユーザーでの実行
#https://qiita.com/naomichi-y/items/93819573a5a51ae8cc07

#sudo groupadd docker
#sudo usermod -g docker ec2-user
#sudo /bin/systemctl restart docker.service



#curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > docker-compose
#sudo cp docker-compose /etc/bash_completion.d/


#https://github.com/docker/cli/blob/master/contrib/completion/bash/docker
