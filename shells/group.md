# Linux 用户组管理
```
#添加用户,同时会创建一个用户组app,并为其设置密码
useradd app
passwd app
# 添加tomcat7 nginx mysql等进入这个用户组
usermod -a -G app tomcat7
usermod -a -G app mysql 
#修改文件夹的组属性,这样tomcat7,nginx,mysql 都拥有这个
chgrp -R app /app
#修改文件夹的组权限
chmod -R 775 /app
```
