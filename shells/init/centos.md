# 以下为CentOS 7 装机指南
hostnamectl set-hostname 主机名
yum install autojump git -y
echo "alias vi=vim" >> ~/.bashrc
echo ". /usr/share/autojump/autojump.bash" >> ~/.bashrc
echo 'export PS1="\u@\h:\w$ "' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
将vimrc内容复制到服务器 .vimrc中, vi打开.vimrc, 执行:BundleInstall

# 免密登录
将本机的id_ras.pub内容复制到服务器的~/.ssh/authroizen_keys文件中

# nodejs yarn
https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
##curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
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

# mongodb https://docs.mongodb.com/v3.4/tutorial/install-mongodb-on-red-hat/
vi /etc/yum.repos.d/mongodb-org-3.4.repo
```
[mongodb-org-3.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
```
// 只安装mongo链接 import export工具
yum install -y mongodb-org-shell mongodb-org-tools
// 全部安装
sudo yum install -y mongodb-org
systemctl start  mongod.service
systemctl enable mongod.service

# nginx
yum install -y nginx
systemctl start nginx.service
systemctl enable nginx.service

# mysql5.7安装 (matiradb)
wget http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm
rpm -ivh mysql57-community-release-el7-8.noarch.rpm
yum install mysql-server
service mysqld start
grep "password" /var/log/mysqld.log
登录mysql 密码在前一个命令中
在mysql中执行
SET PASSWORD = PASSWORD('491ed76a663311e8943b0495e1a69a14');
ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
flush privileges;

# redis
yum install redis -y
vi /etc/redis.conf
修改 requiredpass = sa
systemctl start redis.service
systemctl enable redis.service

# rabbitmq
http://www.rabbitmq.com/install-rpm.html#install-erlang
注意 /etc/hostname 需要加入到 /etc/hosts中, 否则启动会失败
```
/etc/hosts
127.0.0.1 myhostname
```
* 安装erlang
```
weget wget -c https://bintray.com/rabbitmq/rpm/download_file?file_path=erlang%2F20%2Fel%2F7%2Fx86_64%2Ferlang-20.3.8.7-1.el7.centos.x86_64.rpm -O erlang-20.3.8.7-1.el7.centos.x86_64.rpm
yum install erlang-20.3.8.7-1.el7.centos.x86_64.rpm
```
* 安装rabbitmq
```
weget https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.7/rabbitmq-server-3.7.7-1.el7.noarch.rpm
yum install rabbitmq-server-3.7.7-1.el7.noarch.rpm
```
* 启动
```
systemctl enable rabbitmq-server
systemctl start rabbitmq-server.service
```
