# Jedis
java操作redis的封装
## Maven
```
<dependency>
    <groupId>redis.clients</groupId>
    <artifactId>jedis</artifactId>
    <version>2.7.2</version>
    <type>jar</type>
    <scope>compile</scope>
</dependency>
```
## 特别说明
redis的并不支持事务,所以在程序上，就直接放弃redis的事务相关内容,把redis的操作放在service层代码的尾处
