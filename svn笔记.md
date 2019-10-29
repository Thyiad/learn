### svn 常用命令

- checkout到本地
```bash
svn checkout server-path
```

- 忽略文件夹及文件
```bash
svn propset svn:ignore '.idea'  # 忽略单个
svn propset svn:ignore ".svnignore  # 忽略多个
> ad
> material
> logs
> images
> " ./
```

- 添加
```bash
svn add
svn add *
svn add */*
svn add */**/* 
```

- 上传
```bash
svn commit -m ""
```