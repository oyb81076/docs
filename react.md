#实例化
#首次实例化
getDefaultProps
getInitialState
componentWillMount
render
componentDidMount
#实例化完成后的更新
getInitialState
componentWillMount
render
componentDidMount
#存在期
>组件已存在时的状态改变

componentWillReceiveProps
shouldComponentUpdate
componentWillUpdate
render
componentDidUpdate
#销毁&清理期
componentWillUnmount

定时触发的事件

setTimeout //定时触发
复制类事件

onCopy //copy元素内容时触发
onCut //内容剪切时触发
onPaste //粘贴时触发
#组件类事件

onCompositionEnd
onCompositionStart
onCompositionUpdate
#键盘类事件

onKeyDown  //按下键盘按键时触发
onKeyPress  //按下键盘按键并松开时触发
onKeyUp //放开先前按下的  按键时触发
#表单类事件

onChange //内容改变时触发
onInput //事件在用户输入时触发
onSubmit //提交时触发
#焦点类事件
onFocus //获得焦点时触发
onBlur //失去焦点时触发
#鼠标类事件
onClick
onContextMenu
onDoubleClick
onDrag
onDragEnd
onDragEnter
onDragExit
onDragLeave
onDragOver
onDragStart
onDrop
onMouseDown
onMouseEnter
onMouseLeave
onMouseMove
onMouseOut
onMouseOver
onMouseUp
#选择器类事件
onSelect //事件会在文本框中的文本被选中时发生。
#触摸类事件
onTouchCancel //一般在一些高级事件发生时，触发取消touch事件。例如暂停游戏，存档等。
onTouchEnd //移走手指时触发
onTouchMove //移动手指时触发
onTouchStart //按下手指时触发
#插件类事件
onScroll //元素滚动时执行 JavaScript
#轮事件
onWheel //事件在鼠标滚轮在元素上下滚动时触发。
#多媒体类事件
onAbort
onCanPlay
onCanPlayThrough
onDurationChange
onEmptied
onEncrypted
onEnded
onError
onLoadedData
onLoadedMetadata
onLoadStart
onPause
onPlay
onPlaying
onProgress
onRateChange
onSeeked
onSeeking
onStalled
onSuspend
onTimeUpdate
onVolumeChange
onWaiting
#图片类事件
onLoad //事件会在页面或图像加载完成后立即发生。
onError //事件会在文档或图像加载过程中发生错误时被触发。
#动画类事件
onAnimationStart //动画开始时调用
onAnimationEnd //动画结束时调用。但有点问题是连续播放时可能不会触发
onAnimationIteration
#转换类事件
onTransitionEnd
