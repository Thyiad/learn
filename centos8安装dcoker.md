```
dnf update -y ; reboot
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf list docker-ce
dnf install docker-ce --nobest -y
systemctl start docker
systemctl enable docker
# docker run hello-world    # 测试docker
dnf install curl -y
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version