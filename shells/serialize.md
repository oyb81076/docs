# 序列化和反序列化
## 可选项
* json
	* fastjson
	* gson
	* jackjson
* idl
	* protocol buffer
* java.io.serializable

## 在mybatis,memcached的时候,数据的序列化反序列化
### 特性
* 数据结构简单,
	在mybatis中数据不象hibernate那样存在对象引用,
	所以序列化不存在循环引用等问题
* 日期类型,
	因为thrift,protobuf都不存在日期类型,日期类型只能用long来代替,
	这样的话entity对象序列化到protobuf就无法使用IDL直接生成entity,
	而需要一个手工代码转化,这个基本难以忍受


### 方案选择
* fastjson是目前最熟悉的
* gson的供应者是行业标杆
* jackjson 资格最老

基本上确定使用json,至于哪个json需要实际情况测试,
现实应用场景通常是10个左右字段的pojo,的序列化反序列化
如果是数组的话,通常是10行数据,多的话20行数据,大于20行的数据很少出现
大部分情况下
* 40% 一条数据(个人数据,常用页面,配置数据) 10 cols x 1 row
* 20% 10行数据(首页数据) 10 cols x 15 rows
* 40% 简单数据(分类等,标签) 2 cols x 50 rows

