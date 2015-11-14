# makefile管理项目
## 接口设计
* var.make		 变量文件
* make default 检查依赖,安装依赖
* make install 将源码安装到本地的测试环境
* make release 同步到服务器
* make testing 同步到测试服务器 
* make test		 执行测试
* make clean	 清理

## 基本思路
在build/dist下部署一分和release状态下一模一样的文件夹,然后按照需要rsync到服务器上
## Demo
### var.make
```
base:=/app/company/project
releaseHost:=hostname.com
testingHost:=testing.hostname.com
```
### Makefile 
```
include var.make
.PHONY: clean default release testing test
default:
	cd assets;npm install;bower install; 
install:build/dist
	mkdir -p $(base)/log;
	cd $(base);ln -sf $(pwd)/conf/local conf;
	cd $(base);ln -sf $(pwd)/bin/local bin;
	cd $(base);ln -sf $(pwd)/assets assets;
	cd $(base);ln -sf $(pwd)/build/dist/java java;
release:build/dist
	cd build/dist; ln -sf $(pwd)/conf/release conf;
	cd build/dist; ln -sf $(pwd)/bin/release bin;
	rsync --rsh=ssh -avz --copy-unsafe-links --exclude=".DS_Store" build/dist root@$(releaseHost):$(base)
	
testing:build/dist
	cd build/dist; ln -sf $(pwd)/conf/testing conf;
	cd build/dist; ln -sf $(pwd)/bin/testing bin;
	rsync --rsh=ssh -avz --copy-unsafe-links --exclude=".DS_Store" build/dist root@$(testingHost):$(base)
test:
	gradle test;
clean:
	rm -rf build;
build/dist:build
	mkdir -p build/dist/{assets,java/{META-INF,WEB-INF/classes}};
	cd build/dist;ln -s $(pwd)/assets .;
	cd build/dist/java/WEB-INF/classes;ln -s $(pwd)/build/classes/main/* .;ln -s $(pwd)/build/resources/main/* .;
	cd build/dist/java/WEB-INF;ln -s $(pwd)/build/lib .;ln -s $(pwd)/src/main/webapp/WEB-INF/* .;
	cd build/dist/java/META-INF;ln -s $(pwd)/build/tmp/war/* .;
build:
	gradle assemble;
```
