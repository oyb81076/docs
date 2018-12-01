# redis
## 使用redis的基本场景
### 服务器集群通信
* 使用 pub/sub 功能，对所有服务器发送广播，来一起处理某些事务

### session服务器
session分成cookieSession(会话session)和idSession(和用户相关信息的缓存)分别存在两个db中
db1 用来存放cookieSession  
db2 用来存放idSession  
然后使用dbsize 来统计当前在线用户以及当前登录的用户

### 缓存服务器
这个有待考虑,memcache在这方面并不弱,如果使用redis的话

### 消息队列
消费者使用brpop阻塞读取队列尾部信息,发布者使用lpush从头部插入数据

## 操作
* auth password
* echo message
* ping 向服务器发送ping服务器回复pong，用来测试链接的延迟以及链接是否依旧有效
* quit 断开链接
* select index 切换数据库
* dbsize	获取当前db的记录总数
* flushdb	清空当前db
* flushall 清空所有db

## redis 数据库操作
### 基本行为
* set key value [ex seconds] [nx|xx] 添加会完全覆盖原有的ttl 
	[ex seconds] 设置有效期 [nx]只有原有值不存在才成功 [xx]只有原有值存在才成功
* del key [key...]	删除
* expire key seconds 设置有效时间
* ttl key	获取剩余时间
* persist	key 移除有效时间，变成永久有效
* exists key 判断是否存在
* keys pattern	获取所有符合pattern的key
* randomkey	获取一个随机主键
* type key 获取类型
* scan index 游览key

* append key value 为key字符尾部追加字符,如果key不存在会创建
* incr key 加1,原子操作,如果不存在会初始化成0
* incrby key value 加value,原子操作,不存在就初始化为0
* incrbyfloat key value 加value,原子操作，value为浮点数,不存在初始化为0
* decr key 减1,原子操作,如果不存在会初始化成0
* decrby key value 减value,原子操作,不存在就初始化为0
* get key 获取value
* getrange key start end 截取字符串,取值包括第start字符和end字符,支持负数索引 -1表示最后一个字符
* setrange key offset value 替换字符
* getset key value 返回旧值并设置新值
* mget key [key...] 获取多个
* mset key value [key value ...] 设置多个
* msetnx key value [key value ...]设置多个,而且只有当所有的key都不存在的时候财税成功
* setnx key value 当key不存在的时候设置值 等效于 setnx key value nx
* setex key seconds value 设置值并给定expire 等效于 set key value ex seconds
* strlen key 返回字符长度

### Hash操作
* hdel key field [field...]
* hexists key field
* hget key field
* hgetall key
* hincrby key field increment
* hincrbyfloat key field increment
* hkeys key
* hlen key 返回field数量
* hmget key field [field ...] 返回多个field
* hmset key field value [field value...]设置多个值
* hset key field value
* hsetnx key field
* hvals key
* hscan

### List
* ``blpop key [key...] timeout`` block left pop item from {key} in {timeout} seconds;
* ``brpop key [key...] timeout`` block right pop item form {key} in {timeout} seconds;
* ``brpoplpush key value timeout`` block right pop item from {key} and left push {value} within {timeout} seconds;
* ``lindex key index`` get the {index} one of {key}
* ``linsert key before|after pivot value`` insert {value} to  {key} before or after {pivot}
* ``llen key`` get length of {key}
* ``lpop key`` remove left item from {key} and return it
* ``lpush key value [value...]`` 从左侧插入数据, lpush list a b c,等于执行 lpush list a ;lpush list b;lpush list c;
* ``lpushx key value``  left push value to key when exist
* ``lrange key start stop`` get values of list from start to stop
* ``lrem key count value`` remove values witch equals {value} for {count} times from left to right,
	if {count} < 0 remove from right to left;
* ``lset key indx value`` replace value in {index} with {value}
* ``ltrim key start stop`` remove except values from {start} to {end}
* ``rpop key`` remove right item form list and return it;
* ``rpoplpush key value`` remove item from right and push item from left;
* ``rpush key value`` add item to right of list;

### Set
* ``sadd key member [member]``
* ``sdiff key [key...]`` 差集 计算方式好像有些不靠谱，别用
* ``sdiffstore destination key [key...]`` store the diff of keys
* ``sinter key [key...]``  返回交集
* ``sinterstore destination key [key...]`` 查找交集并储存
* ``sismember key member `` 判断{memeber}是不是{key}的成员
* ``smembers key`` 返回所有成员
* ``smove source destination member`` 把memeber从source移动到destination
* ``spop key`` 随机移除一个元素并返回
* ``srandmember key [count]`` 随机返回{count}个元素
* ``srem key member [member...]`` 移除元素
* ``sunion key [key...]``合并集合并返回
* ``sunionstore key [key...]``合并集合并储存
* ``sscan`` ????

### SortedSet
* ``zadd key score member [[score member]...]``  添加元素,score是排序的权重,类型是int or double
* ``zcard key`` 返回length
* ``zcount key min max`` 返回score ∈ [min,max]的数量
* ``zincrby key increment member`` 为member的socre增加increment
* ``zrange key start stop [withscores]`` 获取score ∈ [min,max]的members -inf 表示无穷小 +inf表示无穷大
* ``zrevrange key start stop [withscores]`` 逆序排列score返回range
* ``zrangebyscore key min max [withscores] [limit offset count]``获取score ∈ [min,max]的members
* ``zrevrangebyscore key start stop [withscores] [limit offset count]``逆序排列根据
* ``zrank key member`` 返回member的排名,从0开始计数
* ``zrevrank key member``
* ``zrem key member [member...]`` 删除
* ``zremrangebyrank key start stop`` 根据排名删除成员 
* ``zremrangebyscore key start stop`` 根据score删除成员
* ``zcore key member``
* ?``zunionstore``
* ?``zinterstore``
* ?``zscan``
* ?``zrangebylex``
* ?``zlexcount``
* ?``zremrangebylex``

### Pub/Sub 
这个是与DB无关的
* ``psubscribe pattern [pattern...]`` 订阅一个或多个频道
* ``publish channel message`` 把消息发布到指定频道
* ``pubsub <subcommand> [argument [argument...]]``
* ``punsubscribe [pattern [pattern..]]`` 指定客户端退订
* ``subscribe channel [channel..]`` 订阅给定的一个或多个凭悼信息
* ``unsubscribe channel`` 退订

### hyperloglog 
独立映射计数器，比如用来记录站点的访问量问题，他只能用来计数，不能做其他设计，只是所占空间相对比较小

### Transaction
* ``multi``		标记一个事务开始
* ``discard`` 取消事务，放弃之间提交的所有命令(类似回滚)
* ``exec``		执行提交的命令(类似commit)
* ``watch key [key...]`` 监视一个或多个key
* ``unwatch``	取消对所有key的监视

