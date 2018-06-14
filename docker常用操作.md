# dockerfile里面的命令

FROM
MAINTAINER
ARG
RUN
WORKDIR
COPY
VOLUME
ENTRYPOINT

# 编译dockerfile
docker build -t="thyiad/my-frp:v1" .



# 查看卷
docker volume ls
docker volume inspect --format '{{ .Mountpoint }}' 自动前缀_卷名


apt-get update
docker exec