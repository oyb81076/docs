# Gradle 手册
## task
### 定义一个任务 
{}中间区域为脚本区域,可以视为构造函数,脚本的第一阶段就是构造所有任务
```
task <name> {
	//build scripts
}
task hello {
	println "hello world!"
}
``
### 追加任务
>> <<符号等同于doLast

```
task hello << {
	    println 'Hello Earth'
}
hello.doFirst {
	    println 'Hello Venus'
}
hello.doLast {
	    println 'Hello Mars'
}
hello << {
	    println 'Hello Jupiter'
}
////

task hello << {
	//scripts
}
//等价于
task hello {
	//scripts
}
等价于
task hello {}
hello.doLast {
	//scripts
}

```
### 使用变量
```
String username = "hello"
task hello <<{
	println username + " world!"
	println "${username} world!"
	println "$username world!"
}
```
### 循环
```
task count << {
	4.times {
		println "$it"
	}
	4.times { item->
		println "$item"
	}
}
```
### 任务依赖
dependsOn来定义,可以在参数定义(run1),也可以在内部定义(run2),也可以在外部定义run3
dependsOn的运行顺序不是按照arry的顺序，而是按照arry里面字幕的顺序，
如果希望任务能按照期望的顺序执行下去,必须在每一个任务上指定依赖(如task blank)，不然就会按照task的名字顺序执行
```
task hello <<{
	println "hello"
}
task blank(dependsOn:hello) <<{
	println "blank"
}
task world(dependsOn:blank) <<{
	println "world!"
}
task runs(dependsOn:[hello,blank,world]) {
}
task runs2{
	dependsOn = [hello,blank,world]
}
task run3{}
run3.dependsOn = [hello,blank,world]
```
### 任务脚本
脚本执行顺序，
1.先按代码顺序执行一遍整个脚本，{中间块的代码会被执行到}
2.然后根据gradle的参数所指定的任务,执行分析这个任务的依赖dependsOn,
3.依次执行每一个任务的task1.doFirst,task1.doLast,task2.doFirst,task2.doLast....
```
task world(dependsOn:'hello') {
	println "world.{}"
	doLast {
		println "world.doLast"
	}
	doFirst {
		println "world.doFirst"
	}
}
task hello {
	println "hello.{}"
	doLast {
		println "hello.doLast"
	}
	doFirst {
		println "hello.doFirst"
	}
}
///执行结果
world.{}
hello.{}
hello.doFirst
hello.doLast
world.doFirst
world.doLast
```
### properties
```
ext {
	spring = "4.2.1.RELEASE"
}
task printspring {
   println "$spring"
	 ext.spring = "changed now"
}
printspring << {
   println "$spring"
}
///结果
4.2.1.RELEASE
changed now
```
### 默认任务
```
defaultTasks 'clean', 'run'
```
### 函数
```
File[] fileList(String dir) {
	    file(dir).listFiles({file -> file.isFile() } as FileFilter).sort()
}
```
### taskGraph 根据执行的任务判断
```
task distribution << {
    println "We build the zip with version=$version"
}

task release(dependsOn: 'distribution') << {
    println 'We release now'
}

gradle.taskGraph.whenReady {taskGraph ->
    if (taskGraph.hasTask(release)) {
        version = '1.0'
    } else {
        version = '1.0-SNAPSHOT'
    }
}
```


### 关于 jar 的打包配置
```
/// 配置 manifest 中的main 和 依赖的 jar
jar {
    def libs = ""
    configurations.runtime.each { $it ->
        if (libs != "") {
            libs += " "
        }
        libs += " lib/" + $it.getName()
    }
    manifest {
        attributes 'Main-Class': 'com.ganroft.captcha.rpc.Main'
        attributes 'Class-Path': "$libs"
    }
}

/// 打包生成 out 文件夹 
task release {
    dependsOn 'build'
    doLast {
        copy {
            from configurations.runtime
            into "out/lib"
        }
        copy {
            from("build/libs") {
                include "*.jar"
            }
            into "out"
        }
    }
}
/// 依赖包复制
task lib (type: Copy){
	from configurations.runtime
	into 'lib'
	def copyDetails = []
	eachFile { copyDetails << it }
	doLast {
		copyDetails.each { FileCopyDetails details ->
			def target = new File(destinationDir, details.path)
			if(target.exists()) {
				target.setLastModified(details.lastModified)
			}
		}
	}
}
```
## Maven 设置
```
apply plugin: 'maven'

//archivesBaseName = "thrift-tx"
group = "com.ganroft"
version = "1.2-SNAPSHOT"
repositories {
    mavenLocal()
    maven { url 'http://maven.oschina.net/content/groups/public/' }
}
```
加载插件 maven 之后就可以使用gradle install 发布jar包到本地依赖了


