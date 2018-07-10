# 以下为CentOS 7 装机指南
echo "主机名称" > /etc/hostname
echo "alias vi=vim" >> ~/.bashrc
yum install git -y
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
将vimrc内容复制到服务器 .vimrc中, vi打开.vimrc, 执行:BundleInstall
yum install autojump -y
echo ". /usr/share/autojump/autojump.bash" >> ~/.bashrc
echo 'export PS1="\u@\h:\w$ "' >> ~/.bashrc

# 免密登录
将本机的id_ras.pub内容复制到服务器的~/.ssh/authroizen_keys文件中

# nodejs yarn
https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum -y install nodejs yarn

# node-canvas
https://github.com/Automattic/node-canvas/
yum install -y gcc-c++ fontconfig
yum install -y cairo cairo-devel cairomm-devel libjpeg-turbo-devel pango pango-devel pangomm pangomm-devel giflib-devel
直接将字体文件拷贝到 /user/share/fonts/ 下面就可以了
fc-list 可以检查字体是否安装成功

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

# nginx
yum install -y nginx
systemctl start nginx.service
systemctl enable nginx.service

# mysql5.7安装
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
yum install redis
vi /etc/redis.conf
修改 requiredpass = sa
