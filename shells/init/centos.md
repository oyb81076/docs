# 以下为CentOS 7 装机指南
hostnamectl set-hostname 主机名
yum install autojump git -y;
echo "alias vi=vim" >> ~/.bashrc;
echo ". /usr/share/autojump/autojump.bash" >> ~/.bashrc;
echo 'export PS1="\u@\h:\w$ "' >> ~/.bashrc;
source ~/.bashrc;
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;

将vimrc内容复制到服务器 .vimrc中, vi打开.vimrc, 执行:BundleInstall

# 免密登录
将本机的id_ras.pub内容复制到服务器的~/.ssh/authroizen_keys文件中

# nodejs yarn
https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
``#curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -``
curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash -
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
yum -y install nodejs yarn
npm config set registry http://registry.npm.taobao.org/
yarn config set registry http://registry.npm.taobao.org/

# node-canvas
https://github.com/Automattic/node-canvas/
yum install -y gcc-c++ fontconfig cairo cairo-devel cairomm-devel libjpeg-turbo-devel pango pango-devel pangomm pangomm-devel giflib-devel
直接将字体文件拷贝到 /user/share/fonts/ 下面就可以了
fc-list 可以检查字体是否安装成功

# pm2
npm i -g pm2
pm2 install pm2-logrotate
pm2 set pm2-logrotate:max_size 50M

# mongodb
[安装文档](https://docs.mongodb.com/v3.4/tutorial/install-mongodb-on-red-hat/)
vi /etc/yum.repos.d/mongodb-org-3.4.repo
```官方源
[mongodb-org-3.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
```
```阿里镜像
[mongodb-org-3.4]
name=MongoDB Repository
baseurl=http://mirrors.aliyun.com/mongodb/yum/redhat/7Server/mongodb-org/3.4/x86_64/
gpgcheck=0
enabled=1
```
// 只安装mongo链接 import export工具
yum install -y mongodb-org-shell mongodb-org-tools
// 全部安装
yum install -y mongodb-org
systemctl start  mongod.service
systemctl enable mongod.service

# nginx
```shell
yum install -y nginx;
systemctl start nginx.service
systemctl enable nginx.service
```

# mysql5.7安装
```shell
wget http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm
rpm -ivh mysql57-community-release-el7-8.noarch.rpm
yum install mysql-server
echo "validate_password=OFF" >> /etc/my.cnf; # 关闭密码验证
systemctl start mysqld.service
systemctl enable mysqld.service
grep "password" /var/log/mysqld.log # 本命令用户查看登陆密码
```
```mysql
SET PASSWORD = PASSWORD('sa');
ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
flush privileges;
```

# mysql5.5
rpm -ivh http://repo.mysql.com/yum/mysql-5.5-community/el/6/x86_64/mysql-community-release-el6-5.noarch.rpm
yum -y install mysql-community-client mysql-community-devel mysql-community-server
systemcel start mysqld
systemcel enable mysqld 
SET PASSWORD FOR ‘root’@’localhost’ = PASSWORD(‘newpass’);

# MariaDB
vi /etc/yum.repo.d/CentOS-MariaDB.repo;
```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.3/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```
yum -y install MariaDB-server MariaDB-client
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation

# redis
```bash
yum install redis -y
echo "requirepass = sa" >> /etc/redis.conf
systemctl start redis.service
systemctl enable redis.service
```

# rabbitmq
http://www.rabbitmq.com/install-rpm.html#install-erlang
注意 /etc/hostname 需要加入到 /etc/hosts中, 否则启动会失败
```
/etc/hosts
127.0.0.1 myhostname
```
* 安装erlang
https://www.erlang-solutions.com/resources/download.html
centos7
```
wget https://packages.erlang-solutions.com/erlang/rpm/centos/7/x86_64/esl-erlang_20.3.8.22-1~centos~7_amd64.rpm
yum install esl-erlang_20.3.8.22-1~centos~7_amd64.rpm
```
* 安装rabbitmq
```
wget https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.7/rabbitmq-server-3.7.7-1.el7.noarch.rpm
yum install rabbitmq-server-3.7.7-1.el7.noarch.rpm
```
* 启动
```
systemctl enable rabbitmq-server
systemctl start rabbitmq-server.service
```
