# 几条重要建议
* 分支保持一下几条 master,release,snapshot
	* master分支为主分支
	* snapshot为开发中的分支,这个也可以根据开发者的名字或者其他方式命名
	* release分支表示服务器正在运行的版本,因为服务器上正在运行的版本有可能随时需要临时补丁
* 分支合并
	* 每一个分支都有自己的维护者,合并的行为交给分支维护者来操作
	* 分支合并的步骤
		* snapshot 维护者
			* git fetch origin master
			* git checkout snapshot
			* git merge master
			* git commit -am "merge from master"
			* git push origin snapshot
		* master 维护者
			* git fetch origin snapshot
			* git checkout master
			* git merge snapshot
			* git commit -am "merge from snapshot"
			* git push origin master
		* snapshot 维护者
			* git pull origin master

# 常用命令
git rm .gradle
git rm --cache .gradle
git branch -d 2.0.3
git push --delete origin 2.0.3

git tag tagName
git tag -d tagName
git push origin tags
git push origin tagName

git branch branchName
git checkout branchName
git branch -d branchName

# 完整配备 .gitignore
```
.DS_Store
*.sw?
node_modules/
bower_components/
dev/
dist/
build/
target/
.idea/
tmp/
.gradle/
*.log
*.pid
*.iml
```
