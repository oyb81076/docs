```
ufw allow 22
ufw allow 80
ufw deny all
ufw allow 8080 from 122.12.12.12
ufw enable
ufw disable
ufw status
ufw delete 1 #输入status里面看到的序号来删除
```


```
ufw deny 27017
ufw deny 3306
ufw deny 6379
ufw enable
```
