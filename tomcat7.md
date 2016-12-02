# 关于jstl
## jstl 1.2.x
```
web.xml
<web-app
	xmlns="http://java.sun.com/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
	version="3.0">
</web-app>
jsp
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
ssh
scp ~/.m2/repository/javax/servlet/jstl/1.2/jstl-1.2.jar root@{host}:/usr/share/tomcat7/lib/
```
## nio
在放弃apache mod_jk 使用nginx反向代理的时候, 可以使用nio模式
```
 <Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" />
 修改为
<Connector port="8080"
					 protocol="org.apache.coyote.http11.Http11NioProtocol"
					 connectionTimeout="20000"
					 redirectPort="8443"
					 URIEncoding="UTF-8"
					 />
关闭ajp
```

## share lib 自定义shareLib
vi /etc/tomcat7/catalina.properties
```
common.loader=${catalina.base}/lib,${catalina.base}/lib/*.jar,${catalina.home}/lib,${catalina.home}/lib/*.jar,/Users/apple/IdeaProjects/fuliqi/mall/share/build/lib/*.jar
```
