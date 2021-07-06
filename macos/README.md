# MacOS 重装系统后需要安装的资料
## 开机密码长度
```bash
pwpolicy -clearaccountpolicies
passwd
```
可以使用低于4位的密码
## 字体问题
```bash
defaults -currentHost write -globalDomain AppleFontSmoothing -int 1
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
```

## Shadowsock
https://originss.co

## Idea
https://www.jetbrains.com/idea/

## Cocos Creator
https://www.cocos.com/creator

## Android Studio
* Studio https://developer.android.google.cn/studio
* ant https://ant.apache.org/srcdownload.cgi
* ndk https://developer.android.google.cn/ndk/downloads?hl=zh_cn

## oss
* oss-browser https://github.com/aliyun/oss-browser
* ossutil https://help.aliyun.com/document_detail/50452.html

## JDK
* jdk8 https://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html
* jdk最新版本 https://www.oracle.com/technetwork/java/javase/downloads/index.html

## AppStore
* xcode
* qq
* trello

## vscode
https://code.visualstudio.com/
用vscode打开当前文件夹, 会有插件推荐, settings.json 可以当作用户默认设置
#### 解决vscode下长安按钮只会相应一次的问题
```bash
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
```

## Chrome
https://www.google.cn/intl/zh-CN/chrome/  
#### 常用插件
* cVim
* React Developer Tools
* Redux DevTools

## Homebrew
https://brew.sh
安装的时候最好先安装好shadowsock, 然后``cp bash_profile ~/.bash_profile``, 并且取消proxy注解, 这样可以使用代理下载, 会流畅很多
#### 常用依赖
```bash
# 常用的
brew install mysql mongodb rabbitmq redis macvim nginx wget autojump

# 语言相关
brew install node yarn golang python@3 gradle maven protobuf

# node-canvas 使用的依赖
brew install pkg-config cairo pango libpng jpeg giflib librsvg
```
## Mysql8
接触密码验证的方法
```bash
mysql -uroot;
UNINSTALL COMPONENT 'file://component_validate_password';
alter user 'root'@'localhost' identified with mysql_native_password by 'sa';
```
在mysql5.7中删除validate_password的方式位
```bash
uninstall plugin validate_password;
```
## yarn 淘宝景象
```bash
yarn config set registry https://registry.npm.taobao.org
```

## vim
#### YouCompleteMe
因为安装时间非常的长久, 所以提安装, 如果直接BundleInstall需要个把小时，而且看不到进度
```bash
git clone --recursive https://github.com/Valloric/YouCompleteMe.git .vim/bundle/YouCompleteMe
brew install cmake
cd ~/.vim/bundle/YouCompleteMe; ./install.py;
```
#### 安装
```bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
cp vimrc ~/.vimrc;
cp gvimrc ~/.gvimrc;
mvim +BundleInstall +qall
```

