# mysql
## 记录mysql的sql日志 5.1.29+
```
添加 /etc/mysql/my.cnf文件
[mysqld]
general_log_file=/path/to/query.log
然后在mysql命令行中输入
SET global general_log = 1;
```

## 常用语句
```
show processlist;
# 查看当前的链接
mysql -help | grep my.cnf
# 查看配置文件my.cnf位置
```
