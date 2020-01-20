## 注意内存不到1G是无法完成编译的 (最好在未安装任何服务的时候安装ycm, 不然就会碰到到存不足编译失败的情况)
git clone --depth=1 --recursive https://github.com/Valloric/YouCompleteMe.git .vim/bundle/YouCompleteMe
yum install automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel
cd ~/.vim/bundle/YouCompleteMe; ./install.py;

在 .vimrc 中增加行 Plugin 'Valloric/YouCompleteMe'

更新操作 git pull --recurse-submodules
git submodule update --init --recursive
