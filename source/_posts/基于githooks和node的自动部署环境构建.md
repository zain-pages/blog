---
title: 基于githooks和node的自动部署环境搭建
date: 2018-04-01 22:53:13
tags: 技术博客
---

最初的 Vue 脚手架 `Vue-cli` 和 React 脚手架 `ceate-react-app` 在编译工程时仅仅将工程编译到本地的一个dist文件夹中，对于我想在我的githubpage上面配置我的网站和音乐播放器造成了困难：我必须build之后再切换分支，将我的dist文件夹内容放进这个分支中，然后重新push才可以实现其部署。

在公司中发现公司工程是使用 makefile 一键部署的，激发了我也将自己的小项目一键部署的欲望。
因为我的项目需要经常处在 windows 环境开发所以不打算用 makefile 文件处理，直接上 nodejs 来处理这个问题即可。

决定了大体技术选型，我们需要明白我们要处理一个什么样的问题：

根据我的需求，我需要将我编译的工程一键部署到 githubpages 上。

1. githubpages 其实往往就是这个工程的 master 分支，也就是说，我需要将我编译后的文件推送到指定的远程分支上。
2. 如果再深入一点，我希望我的后端也可以实现推送到远程分支的时候自动拉取到服务器上，就是最好不过了。

事实上这个部署的思路是在我之前的搬瓦工服务器上面构思并实践的，它分为两个部分，分别对应着我上面的两个需求：

1. git-deployer
2. express 服务器端部署工具

明确了我们的需求，开始技术细节的思考。还是按照两边分开来思考：因为两个需求比较独立。

需求一，需要将编译后文件一键push到远程分支。
脑海中隐约觉得自己似乎有遇到过这样的情景：

没错，就是这个hexo博客的部署。我所期望的效果是和执行 `hexo d` 这个命令一样的效果，所以我决定根据我的经验先去研究一下hexo博客是怎样部署的。
通过阅读 `hexo-deployer-git` 的源代码，理解了它部署的过程：
1. 在工程目录下创建一个临时文件夹。
2. 将指定的编译后的文件放到这个文件夹之中。
3. 将这个文件夹初始化为git的工程，并将 `remote` 和 分支分别设定为指定的量。
4. 进行 `force push` 。

明白了它的思路，搜索npm没有相关的可以支持配置普适工程部署的包，于是决定自己写一个。

那么思考一下我所需要完成工程的细节：我想要做一个命令行工具，这个工具用于操作创建指定的临时文件夹并设定git参数，然后进行`force push`。
基于这些细节上网搜索，我选定了`shelljs`与`commender`作为我的实践工具。

之后就有了这个简单的包：
[git-deployer](https://github.com/Zainking/git-deployer)

当然，这个包并不完美，如有人在issues里面所提的：
> 目前的使用方式是
> git-deploy -r git@github.com:username/project.git -d ./dist
> 每次都要输入项目地址。
> 可以参考hexo的deploy增加配置文件，
> （本地项目配置）？本地配置 : 输入配置

可能会参考下一个版本迭代时加入这个功能。

进入下一个问题，我希望每次在我的master分支被push时，我的服务器中都能够进行一个pull操作来执行自动部署。
经过查找资料，我发现了解决这个问题的关键: `githooks`
`githooks`是指在git中进行关键操作时触发的指定脚本，在github中就提供在push的时候，对指定网址post一个指定请求的`githooks`。

那么关键的问题也解决了，只需要在自己的服务器上建立一个服务，专门接受这个post请求，如果这个请求是需要pull的某个工程的push请求，即在对应工程执行pull即可。

google搜索一番，发现已经有相关实现：
[Node.js:使用hook+shell+git进行自动化构建
](https://smallpath.me/post/Node.js:%E4%BD%BF%E7%94%A8git%E5%92%8Cwebhook%E8%BF%9B%E8%A1%8C%E8%87%AA%E5%8A%A8%E5%8C%96%E6%9E%84%E5%BB%BA)

思考一番发现这个老哥似乎和自己思路一模一样，本着不重复造轮子的原则，直接将老哥大部分代码拷贝，进行细节调整后放到自己服务器上，用nginx代理一个特殊的端口到这个服务上，稍作微调即正常运行。

现在我所有的线上个人项目都使用 `git-deployer + npm script`进行一键部署，爽歪歪。

## 参考资料
* [hexo-deployer-git](https://github.com/hexojs/hexo-deployer-git)
* [Node.js命令行程序开发完整教程
](https://www.kancloud.cn/outsider/clitool/313173)
* [Git-Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
* [Node.js:使用hook+shell+git进行自动化构建
](https://smallpath.me/post/Node.js:%E4%BD%BF%E7%94%A8git%E5%92%8Cwebhook%E8%BF%9B%E8%A1%8C%E8%87%AA%E5%8A%A8%E5%8C%96%E6%9E%84%E5%BB%BA)
