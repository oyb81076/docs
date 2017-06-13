#安装
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

sudo apt-get install -y mongodb-org=3.4.0 mongodb-org-server=3.4.0 mongodb-org-shell=3.4.0 mongodb-org-mongos=3.4.0 mongodb-org-tools=3.4.0
sudo apt-get install -y mongodb-org=3.4.0
# 导入导出
## 整个数据库导出
mongodump -h dbhost -d dbname -o dir
导出的文件夹为 dir/{dbname}/
## 整个数据库恢复
mongorestore -h dbhost -d dbname dir/{dbname}
## 导出为数据
mongoexport


# shell文档[查看](https://docs.mongodb.com/manual/)
