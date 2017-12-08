### 1.yum 安装Docker
``` bash
# docker 要求centos系统的内核版本高于3.10
uname -r
yum -y install docker   # -y：对所有提问都回答yes
service docker start    # 启动docker后台服务
docker run hello-world  # 测试运行hello-world
```