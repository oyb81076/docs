# 数据库设计原则
* 读写分离
	可以用master-slave实现读写分离,master写,slave读
	也可以用拆表实现,把经常修改的数据和不常修改的数据分到两个表
* 在任何情况下都要弃使用auto_increment
	为了程序设计上的等幂函数
	这点在分布式的时候尤其明显
	但是可以用算法实现一个类似auto_increment的功能
* 人为操作容错性
	系统必须对有bug程序写入的错误数据有足够的适应能力,可以容忍人为错误的系统。
	* 使用数据冗余来保证,当应为人为误操作,或代码bug造成错误之后,数据内容可以恢复过来
	* 在crud操作中保留cr,而ud则以c代替,
		用新数据替代原来的数据,而让被ud的数据失效,在一定时期之后删除

