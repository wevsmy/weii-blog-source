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
   └─weii          // 博客 weii 主题 
```

## 调试

```bash
~/blog $ hugo server -D
```

## 更新主题
```bash
~/blog $ git submodule update --rebase --remote
```

## 部署
```bash
./01-deploy-public.sh
./02-deploy-weii.sh
./03-deploy-source.sh
```