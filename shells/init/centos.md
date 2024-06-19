# 以下为 CentOS 7 装机指南

```
hostnamectl set-hostname 主机名
yum install autojump git -y;
echo "alias vi=vim" >> ~/.bashrc;
echo ". /usr/share/autojump/autojump.bash" >> ~/.bashrc;
echo 'export PS1="\[\e[01;35m\][\u@\h \w] $ \[\e[0m\]"' >> ~/.bashrc;
echo "export NODE_ENV='production'" >> ~/.bashrc;
source ~/.bashrc;
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
```

将 vimrc 内容复制到服务器 .vimrc 中, vi 打开.vimrc, 执行:BundleInstall

# 免密登录

将本机的 id_ras.pub 内容复制到服务器的~/.ssh/authroized_keys 文件中

# rsync
yum install rsync

# nodejs
yum install nodejs
npm config set registry https://registry.npmmirror.com/
npm i n -g
n lts
npm i -g pnpm


# node-canvas

https://github.com/Automattic/node-canvas/
yum install -y gcc-c++ fontconfig cairo cairo-devel cairomm-devel libjpeg-turbo-devel pango pango-devel pangomm pangomm-devel giflib-devel
直接将字体文件拷贝到 /user/share/fonts/ 下面就可以了
fc-list 可以检查字体是否安装成功

# pm2

npm i -g pm2
pm2 install pm2-logrotate
pm2 set pm2-logrotate:max_size 100M
pm2 set pm2-logrotate:compress true
pm2 set pm2-logrotate:retain 50

# mongodb

[安装文档](https://docs.mongodb.com/v3.4/tutorial/install-mongodb-on-red-hat/)
vi /etc/yum.repos.d/mongodb-org-4.0.repo

```官方源
[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc
```

```阿里镜像
[mongodb-org-4.0]
name=MongoDB Repository
baseurl=http://mirrors.aliyun.com/mongodb/yum/redhat/7Server/mongodb-org/4.0/x86_64/
gpgcheck=0
enabled=1
```

// 只安装 mongo 链接 import export 工具
yum install -y mongodb-org-shell mongodb-org-tools
// 全部安装
yum install -y mongodb-org
systemctl start mongod.service
systemctl enable mongod.service
yum install compat-openssl10 # for mongo4

# nginx

```shell
yum install -y nginx;
systemctl start nginx.service
systemctl enable nginx.service
```

# MariaDB

yum install mariadb-server mariadb
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation

# redis

```bash
yum install redis -y
echo "requirepass sa" >> /etc/redis.conf
systemctl start redis.service
systemctl enable redis.service
```

# java11

```
yum install java-11
```

# java17
https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html

https://download.oracle.com/java/17/archive/jdk-17.0.9_linux-x64_bin.rpm
yum install xxx.rpm

