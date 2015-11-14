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
# 查看当前的链接
show processlist;

# 查看配置文件my.cnf位置
mysql -help | grep my.cnf

# 设置事务隔离级别
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ

# 查看当前事务隔离级别
SELECT @@session.tx_isolation

# 事务处理
SET autocommit=1;
commit;
rollback;
# 
```

## 事务隔离级别的锁问题
### REPEATABLE READ
* update,select for update会阻塞其他update以及select for update都会被阻塞,阻塞在rollback或commit之后结束
