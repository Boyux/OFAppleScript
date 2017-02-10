# OmniFocus 自动化脚本（AppleScript）

一些 OmniFocus 的自动化脚本，包括：

- 自动给某项目内的任务添加默认持续时间 5 分钟；
- 根据项目状况，给相关文件夹内的子文件夹设置标签；
- 根据任务状况，给相关文件夹内的文件设置标签。

AppleScript 可配合 Hazel 使用，具体的 Hazel 规则如下（最后一项匹配规则可避免一分钟内重复执行脚本）：

![][image-1]

若要在 Hazel 中使用 AppleScript，请在代码的开头和结尾添加：

```
`on hazelProcessFile(theFile)
end hazelProcessFile
```
`
如果不使用 Hazel 触发脚本，可以在脚本开头和结尾处添加：

```
`on idle
end idle
```
`
然后保存为应用程序并运行即可。

脚本需要安装 tag：

```
`brew install tag
```
`
## 5 Minutes

某些 Single Action 项目里的任务大多数都能在 5 分钟内完成，即使 5 分钟内无法完成，也能在 5 分钟内决定是该转换成项目，还是该添加子项。因此，用一个脚本来自动给该项目内的所有任务添加默认持续时间（Estimated Time）5 分钟，即可通过时间透视筛选出 5 分钟任务，在零碎的时间解决掉这些任务。

*注：对于已经有持续时间的任务，脚本不会重复添加持续时间。*

## Auto tag work

该脚本是针对我的工作（Work）文件夹内的项目情况，自动给相关文件夹内的子文件夹添加标签的脚本。在工作中，我会给每一个项目创建一个文件夹，用以存储项目相关的文件，通过该脚本，可以实现：

1. 在 OmniFocus 中创建项目，自动在设定位置创建与项目同名文件夹；
2. 根据项目的状态（Status），设置相应标签（Active、Onhold、Completed、Dropped）；
3. 根据项目是否有旗标，添加标签 Flagged。

## Auto Tags Script

该脚本用于对写作产生的文本文件进行标签设置，其功能与“Auto tag work”类似，但针对单个任务而非项目。

[image-1]:	https://dl.dropboxusercontent.com/s/6txqqigecgpzse4/AppleScript.png%20