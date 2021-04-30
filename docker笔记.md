---
title: docker笔记
lang: zh-cn
---

### 1.yum 安装Docker
``` bash
# docker 要求centos系统的内核版本高于3.10
uname -r
yum -y install docker   # -y：对所有提问都回答yes
service docker start    # 启动docker后台服务
docker run hello-world  # 测试运行hello-world
```

### 2.Docker 守护进程

``` bash
docker daemon -H tcp://0.0.0.0:2375 # -H调整网络和端口配置
docker daemon -H unix://home/docker/docker.sock # 也可以指定一个Unix套接字路径
docker daemon -H tcp://0.0.0.0:2375 -H unix://home/docer/docker.sock    # 也可以指定多个绑定地址
docker daemon -D    # 输出docker守护进程的详细信息
service docker status   # 检查docker守护进程是否正在运行
service docker start    # 启动docker守护进程
service docker stop # 停止docker守护进程
```

### 3.容器使用

``` bash
docker run -t -i  运行容器  
# 创建一个能进行交互的容器，这两个参数是最基本的，后跟 /bin/bash 之类的参数，指定要运行的程序
# -i 保证容器中的STDIN是开启的
# -t 告诉docker为要创建的容器分配一个伪tty终端
# -d 后台运行（全称：detached，分离）
# --name    指定名称
# --restart=on-failure:5    容器的退出代码非0时自动重启5次，其他值还有always等等
# nginx的话需要 nginx -g "daemon off"，否则运行完容器就退出了，因为nginx是运行一个bash（pid为1），容器是把pid为1的程序作为容器是否正在运行的依据，
exit    # 停止并退出容器
docker start    # 启动容器
docker attach   # 进入容器会话
docker logs # 获取容器的日志，-f 跟踪日志，与tail -f相似，-t加上时间戳
docker top # 查看容器内部运行的进程
docker stats #查看一个或多个容器的统计信息
docker exec -d test_machine touch /etc/new_config_file  # 在容器内部额外启动新进程
docker stop # 停止容器
docker inspect --format '{{.Name}} {{.State.Running}}' daemon_dave  # 获取更多的容器信息，--format 来查看指定信息，后面的容器名可以传递多个（同时查看多个容器的信息）
docker ps   # 查看正在运行的容器， -a 查看所有容器， -q 
docker ps -a # 查看所有容器
docker rm # 删除容器
```

### 4.镜像使用

``` bash
docker images  # 列出本地主机上的镜像
docker search # 查找镜像
docker pull  # 下载镜像
docker tag 860c279d2fec runoob/centos:dev # 为镜像添加标签
docker rmi  # 删除镜像
```

### 5.日志驱动

``` bash
docker run --log-driver="syslog"
```

### 6.构建镜像

- 创建基础目录
``` bash
mkdir static_web
cd static_web
touch Dockerfile
```
- 填写Dockerfile
``` bash
# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER Thyiad Tao "1520583107@qq.com"
RUN apt-get update && apt-get install -y nginx  # 也可以用exec格式的RUN指令：RUN [ "apt-get","-y","nginx" ]
RUN echo 'Hi, Iam in your container' \
    >/usr/share/nginx/html/index.html
EXPOSE 80   # EXPOSE指令告诉Docker该容器内的应用程序将会使用容器的指定端口
```
- 编译镜像
``` bash
cd static_web
docker build -t="thyiad/static_web:v1" .
# --no-cache 指定不使用缓存
```

### 7.volume命令
```
docker volume ls
docker volume inspect --format '{{.Mountpoint}}' xxx_wp_certs
```

> 获取这个卷在宿主机中的实际路径

### 7.docker compose

### docker配置shadowsocks
``` bash
docker run --restart=always --name=myshadowsocks -d -p 54285:54285 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 54285 -k thyiad -m aes-256-cfb
docker ps
```



# dockerfile里面的命令

```
FROM
MAINTAINER
ARG
RUN
WORKDIR
COPY  # copy 宿主目录（./xx，编译目录下面的文件、文件夹）到镜像目录
VOLUME
ENTRYPOINT
```

# 编译dockerfile
```
docker build -t="thyiad/my-frp:v1" .
```

# 查看卷
```
docker volume ls
docker volume inspect --format '{{ .Mountpoint }}' 自动前缀_卷名

apt-get update
docker exec
```

### docker-compose 强制重新编译

```
docker-compose up -d --no-deps --build <service_name>
```

### docker-compose 一些配置

```
port:
  - 宿主端口:镜像端口
expose:
  - 8080 # 给其他服务可以访问的接口
volumes:
  - 宿主目录:镜像目录
```