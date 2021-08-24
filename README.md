# weii blog source
> 博客源码

博客地址: [weii.ink](https://www.weii.ink) or [weii.xyz](https://www.weii.xyz)


## 源码结构

```text
weii-blog-source
├─archetypes
├─content          // 博客文章 MD
│  ├─about
│  └─posts
├─public           // hugo 生产的静态博客文件
├─static           // 博客所有文件资源
└─themes
   └─meme          // 博客 meme 主题 
```

## 新建文章、页面
```bash
~/blog $ hugo new "posts/hello_world.md"
~/blog $ hugo new "about/_index.md"
```

## 调试

```bash
~/blog $ hugo server -D
```

## 生产调试

```bash
~/blog $ hugo server -D --renderToDisk --environment production
```

## 更新主题
```bash
~/blog $ git submodule update --rebase --remote
```

## 部署
```bash
~/blog $ ./01-deploy-public.sh
~/blog $ ./02-deploy-source.sh
```