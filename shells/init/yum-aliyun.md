# centos 安装阿里云镜像yum仓库
uname -r; 查看版本好是不是7
```
cd /etc/yum.repos.d/;
mkdir backup;
mv *.repo backup;
wget http://mirrors.aliyun.com/repo/Centos-7.repo
wget http://mirrors.aliyun.com/repo/epel-7.repo
```
