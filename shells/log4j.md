# log4j设置
## 简单配置
```
log4j.rootLogger=info,stdout
log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%d{HH:mm:ss.S} %p [%c] %m%n
log4j.appender.stdout.Target=System.out
log4j.appender.stdout.encoding=UTF-8


log4j.logger.org.springframework.jdbc.datasource.DataSourceTransactionManager=DEBUG,stdout
```
## patern
```
%p: 输出日志信息优先级，即DEBUG，INFO，WARN，ERROR，FATAL,
%d: 输出日志时间点的日期或时间，默认格式为ISO8601，也可以在其后指定格式，比如：%d{yyy MMM dd HH:mm:ss,SSS}
%r: 输出自应用启动到输出该log信息耗费的毫秒数
%c: 类的全名
%M: 方法名
%t: 输出产生该日志事件的线程名
%l: 输出日志事件的发生位置,相当于%C.%M(%F:%L)的组合,包括类目名、发生的线程，以及在代码中的行数。
%x: 输出和当前线程相关联的NDC(嵌套诊断环境)。
%%: 输出一个"%"字符
%F: 输出日志消息产生时所在的文件名称
%L: 输出代码中的行号
%m: 输出代码中指定的消息,产生的日志具体信息
%n: 输出一个回车换行符

```
