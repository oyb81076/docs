# 关于nginx常用配置
## 常用配置
```
server {
	#端口
	listen 80;
	#host
	server_name error.dev;
	#字符
	charset utf-8;
	#访问日期
	access_log /app/error/log/nginx-access.log;
	#错误日志
	error_log	/app/error/log/nginx-error.log;
	#根目录地址
	root /app/error/assets/;
	#开启错误定向
	fastcgi_intercept_errors on; 
	#404 错误页面
	error_page 404 /404.html;

	location ~ ^[^.]*$ {
		#重定向到tomcat
		proxy_pass http://127.0.0.1:8080;
		#设置真实IP到头报
		proxy_set_header X-Real-IP $remote_addr;
		#设置虚拟主机到头报,和tomcat的host对应
		proxy_set_header HOST localhost;
		#重置response重定向,把tomcat的重定向路径替换到当前server的地址
		proxy_redirect http://localhost http://error.dev;
		#设置response防Frame注入
		add_header X-Frame-Options SAMEORIGIN;
		#设置response防Xss注入
		add_header X-Xss-Protection "1; mode=block";
		#开启重定向错误跳转配置
		proxy_intercept_errors on;
		#把tomcat状态码为404的页面用/dy_404.html代替
		error_page 404 /dy_404.html;
	}
}
```
## 其他配置
```
```

