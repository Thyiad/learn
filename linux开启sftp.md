### sftp

``` bash
ssh -V
groupadd sftp
useradd -g sftp -s /sbin/nologin -d / ftpthy    # -d设置登入目录
passwd ftpthy
vim /etc/ssh/sshd_config    # Subsystem 改为 Subsystem sftp internal-sftp
systemctl restart sshd
```

如果需要限制访问目录，执行以下两步

- 1.设置用户登入目录：
``` bash
mkdir /home/sftp/ftpthy   # useradd 时设置登入目录
chown -R ftpthy:sftp /home/sftp/ftpthy  # 设置文件夹拥有者
```
- 2.限制用户访问目录：
```
Match User ftpuser
ChrootDirectory /home/sftp
ForceCommand    internal-sftp
```
目录权限注意事项：
由ChrootDirectory指定的目录开始一直往上到系统根目录为止的目录拥有者都只能是root
由ChrootDirectory指定的目录开始一直往上到系统根目录为止都不可以具有群组写入权限
chmod -R 544 /home/sftp/ftpthy
