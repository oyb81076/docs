# rsa免登录
ssh-keygen -t rsa;
scp .ssh/id_rsa.pub root@(ip):
ssh root@$(ip) "mkdir -p .ssh;touch .ssh/authorized_keys; cat id_rsa.pub >> .ssh/authorized_keys"

# host修改
```
echo "host-server" > /etc/hostname
hostname host-server
```
# 一般安装
``
apt-get update;
apt-get install openjdk-7-jre openjdk-7-jdk mysql-server mysql-client tomcat7 nginx curl;
``
vi /etc/default/tomcat7
```
JAVA_OPTS="-Djava.awt.headless=true -XX:+UseConcMarkSweepGC -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M"
```
vi /etc/tomcat7/server.xml
```
<Connector port="8080"
		protocol="org.apache.coyote.http11.Http11NioProtocol"
		connectionTimeout="20000"
		redirectPort="8443"
		URIEncoding="UTF-8"/>
```
vi /etc/mysql/my.conf
```
[client]
default-character-set=utf8
[mysqld]
character-set-server=utf8
[mysql]
default-character-set=utf8
```
service mysql restart

tomcat具体编辑可参照tomcat7.md

# nodejs 安装
方式一 apt [参考来源](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
注意如果之前安装了node, 需要进行如下操作
注意 ubuntu 中叫node, 而debian 叫nodejs, 而这里的源是debian的,所以安装的时候用 apt-get install nodejs, 安装完了以后 ln nodejs node
因为很多包都是 #!/usr/bin/env node
```
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
//如果之前安装了node, 把让node 指向nodejs 建立一个ln nodejs node
ln -sf `which nodejs` `which node`
```
方式二 源码安装
```
wget https://nodejs.org/dist/v4.4.5/node-v4.4.5.tar.gz;
tar zxvf node-v4.4.5.tar.gz;
cd node-v4.4.5;
./configure;
make;
make install;
npm install coffee-script -g;
npm install forever -g
```
## cnpm nodejs淘宝镜像
```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```
## forever nodejs deamon
```
cnpm i -g forever
```
# redis 安装最新版本
```
sudo apt-get install -y python-software-properties  
sudo apt-get install software-properties-common  
sudo add-apt-repository -y ppa:rwky/redis  
sudo apt-get update  
sudo apt-get install -y redis-server
```

# vim 安装
```
apt-get install git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
scp ~/.vimrc root@(ip):
vi ~/.vimrc
:BundleInstall
```

# java8 安装
```
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer
update-java-alternatives -s java-8-oracle
```
修改 /etc/default/tomcat7 配置 `JAVA_HOME=/usr/lib/jvm/java-8-oracle`
## 设置java8为默认JDK 如果已经安装了java8
```
update-java-alternatives -s java-8-oracle
```

### mongodb (2.4.9)
apt-get install mongodb
