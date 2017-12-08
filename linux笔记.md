### 1.linux系统启动过程

- 内核引导
- 运行 init
- 系统初始化
- 建立终端
- 用户登录系统

> 操作系统>boot>init>运行级别>/etc/init.d/用户登录>Login shell

### 2.文件基本属性

``` bash
ls -s
dr-xr-xr-x
```

- 第一位标识文件类型
> d为目录，-为文件，/为链接文档，b为接口设备，c为串行端口设备
- 后面每3个为一组，读写运行，rwx，-为无权限
> 所有者、同组用户、其他用户

### 3.更改文件属性

- chgrp：更改文件属组
``` bash 
chgrp [-R] 数组名 文件名     
```
> -R 表示递归
- chown：更改文件属主，也可以同时更改文件属组
``` bash
chown [-R] 属主 文件名
chown [-R] 属主名:属组名 文件名
```
-  chmod：更改文件9个属性
``` bash
chmod [-R] xyz 文件或目录
chmod u=rwx,g=rx,o=r test1
```
> 可以使用数字或者符号
r: 4
w:2
x: 1
拥有全部权限的数字即为7
770对应[rwxrwx---]
符号是all, user, group, others的缩写
+（加）
-（除去）
=（设定）

### 4.文件与目录管理

- ls
> -a：全部，包括隐藏文件
-d：仅列出目录本身
-l：长数据串列出，包含文件属性、权限等等
- cd
- pwd
> print working directory
-P：如果是link路径，会显示真实的路径
- mkdir
> -p：允许创建多级目录
-m：配置权限
``mkdir -m 771 test1``
- rmdir
> 删除空目录
-p 一起删除上一级的空目录
- cp
> -a：相当于-pdr
-d：如果是link，则复制link而非文件本身
-f：强制
-i：覆盖时询问
-l：创建hard link，而非复制文件本身
-p：复制文件属性
-r：递归复制
-s：复制成为 symbolic link
-u：源文件比目标文件新才覆盖
- rm
> -f：force，忽略不存在的文件，不会出现警告信息
-i：询问是否删除
-r：递归删除
- mv
> -f：强制直接覆盖
-i：覆盖时询问
-u：源比目标新才覆盖
还可以重命名
``mv test test1``

### 5.Linux文件内容查看

- cat 由第一行开始显示文件内容
> -A：相当于-vET
-b：列出行号，仅针对非空白行做行号显示，空白行不标行号
-E ：将结尾的断行字节 $ 显示出来
-n ：列印出行号，连同空白行也会有行号，与 -b 的选项不同
-T ：将 [tab] 按键以 ^I 显示出来
-v ：列出一些看不出来的特殊字符
- tac 倒序显示，与cat相反
- nl 输出行号
> -b ：指定行号指定的方式，主要有两种：
-b a ：表示不论是否为空行，也同样列出行号(类似 cat -n)；
-b t ：如果有空行，空的那一行不要列出行号(默认值)；
-n ：列出行号表示的方法，主要有三种：
-n ln ：行号在荧幕的最左方显示；
-n rn ：行号在自己栏位的最右方显示，且不加 0 ；（自测无法右方）
-n rz ：行号在自己栏位的最右方显示，且加 0 ；（自测无法右方）
-w ：行号栏位的占用的位数。
- more 一页一页的显示文件内容
> 空白键 (space)：代表向下翻一页；
Enter         ：代表向下翻『一行』；
/字串         ：代表在这个显示的内容当中，向下搜寻『字串』这个关键字；
:f            ：立刻显示出档名以及目前显示的行数；
q             ：代表立刻离开 more ，不再显示该文件内容。
b 或 [ctrl]-b ：
- less 与more类似，但可以向前翻页
> 空白键    ：向下翻动一页；
[pagedown]：向下翻动一页；
[pageup]  ：向上翻动一页；
/字串     ：向下搜寻『字串』的功能；
?字串     ：向上搜寻『字串』的功能；
n         ：重复前一个搜寻 (与 / 或 ? 有关！)
N         ：反向的重复前一个搜寻 (与 / 或 ? 有关！)
q         ：离开 less 这个程序；
- head 只看前几行（自测为10行）
> -n ：后面接数字，代表显示几行的意思
- tail 只看尾几行（自测为10行）
> -n ：后面接数字，代表显示几行的意思
-f ：表示持续侦测后面所接的档名，要等到按下[ctrl]-c才会结束tail的侦测

### 6.Linux用户和用户组管理

- useradd 选项 用户名
> -c comment 指定一段注释性描述。
-d 目录 指定用户主目录，如果此目录不存在，则同时使用-m选项，可以创建主目录。
-g 用户组 指定用户所属的用户组。
-G 用户组，用户组 指定用户所属的附加组。
-s Shell文件 指定用户的登录Shell。
-u 用户号 指定用户的用户号，如果同时有-o选项，则可以重复使用其他用户的标识号。
- userdel 删除账户
> -r 常用选项，同时删除用户的主目录
- usermod 选项 用户名
> -l 新用户名，部分系统支持
- passwd 选项 用户名
> -l 锁定口令，即禁用账号。
-u 口令解锁。
-d 使账号无口令。
-f 强迫用户下次登录时修改口令。
- groupadd 选项 用户组
- groupdel 用户组
- groupmod 选项 用户组
> -g GID 为用户组指定新的组标识号。
-o 与-g选项同时使用，用户组的新GID可以与系统已有用户组的GID相同。
-n新用户组 将用户组的名字改为新名字
- newgrp root 切换到其他用户组
> 前提确实为该用户的主组或附加组

### 7.与账号有关的系统文件

- /etc/passwd 记录了用户的一些基本信息
> thyiad:x:200:50:Thyiad thyiad:/usr/sam:/bin/sh
用户名:口令:用户标识号:组标识号:注释性描述:主目录:登录Shell
- /etc/shadow 存放加密后的用户口令
- /etc/group 存放用户组信息
- 批量添加用户
> newusers < user.txt
pwunconv
chpasswd
pwconv

### 8.磁盘管理

- df 检查文件系统的磁盘空间占用情况
> -a ：列出所有的文件系统，包括系统特有的 /proc 等文件系统；
-k ：以 KBytes 的容量显示各文件系统；
-m ：以 MBytes 的容量显示各文件系统；
-h ：以人们较易阅读的 GBytes, MBytes, KBytes 等格式自行显示；
-H ：以 M=1000K 取代 M=1024K 的进位方式；
-T ：显示文件系统类型, 连同该 partition 的 filesystem 名称 (例如 ext3) 也列出；
-i ：不用硬盘容量，而以 inode 的数量来显示
- du 文件和目录磁盘使用的空间的查看
> -a ：列出所有的文件与目录容量，因为默认仅统计目录底下的文件量而已。
-h ：以人们较易读的容量格式 (G/M) 显示；
-s ：列出总量而已，而不列出每个各别的目录占用容量；
-S ：不包括子目录下的总计，与 -s 有点差别。
-k ：以 KBytes 列出容量显示；
-m ：以 MBytes 列出容量显示；
- fdisk 查看分区信息
> -l ：输出后面接的装置所有的分区内容。若仅有 fdisk -l 时， 则系统将会把整个系统内能够搜寻到的装置的分区均列出来。
- mkfs 磁盘格式化
> -t ：可以接文件系统格式，例如 ext3, ext2, vfat 等(系统有支持才会生效)
- mount 磁盘挂载
> mount [-t 文件系统] [-L Label名] [-o 额外选项] [-n]  装置文件名  挂载点
- umount 磁盘卸载
> -f ：强制卸除！可用在类似网络文件系统 (NFS) 无法读取到的情况下；
-n ：不升级 /etc/mtab 情况下卸除。

### 9. vi/vim

- 命令模式
> 启动时便进入了命令模式
``i 切换到插入模式``
``:切换到底线命令模式，以在最底一行输入命令``

- 插入模式
> 字符按键以及Shift组合，输入字符
ENTER，回车键，换行
BACK SPACE，退格键，删除光标前一个字符
DEL，删除键，删除光标后一个字符
方向键，在文本中移动光标
HOME/END，移动光标到行首/行尾
Page Up/Page Down，上/下翻页
Insert，切换光标为输入/替换模式，光标将变成竖线/下划线
ESC，退出输入模式，切换到命令模式

- 底线命令模式
> q 退出程序
w 保存文件

- 移动光标的命令
> h 或 向左箭头键(←)	光标向左移动一个字符
j 或 向下箭头键(↓)	光标向下移动一个字符（enter也是向下移动）
k 或 向上箭头键(↑)	光标向上移动一个字符
l 或 向右箭头键(→)    光标向右移动一个字符（空格也是向右移动光标）
数字+方向键  移动指定位数
[Ctrl] + [f]	屏幕『向下』移动一页，相当于 [Page Down]按键 (常用)
[Ctrl] + [b]	屏幕『向上』移动一页，相当于 [Page Up] 按键 (常用)
[Ctrl] + [d]	屏幕『向下』移动半页
[Ctrl] + [u]	屏幕『向上』移动半页
\+	光标移动到非空格符的下一行
\-	光标移动到非空格符的上一行
0 或功能键[Home]	这是数字『 0 』：移动到这一行的最前面字符处 (常用)
$ 或功能键[End]	移动到这一行的最后面字符处(常用)
G   移动到最后一行
nG  n为数字，移动到第n行
gg  移动到第一行

- 搜索的命令
> /word   向下搜索word
?word   向上搜索word
n   移动到匹配的下一个
N   移动到匹配的上一个
:n1,n2s/word1/word2/g   在n1和n2之间寻找word1，并替换为word2
:1,$s/word1/word2/gc    从第一行到最后一行寻找word1，并替换为word2，且在替换前询问用户

- 复制粘贴的命令
> x, X  x向后删除一个字符，X向前删除一个字符
nx  连续删除n个字符
dd  删除游标所在行
ndd 删除光标往下N行
d1G 删除光标所在到第一行
dG  删除光标所在到最后一行
d\$  删除光标所在到行末
d0  删除光标所在到行首
yy  复制当前行
nyy 复制N行
y1G，yG，y0，y$    与d类似
p   粘贴到下一行
P   粘贴到上一行
J   将当前行与下一行合并
u   回退(常见ctrl+z)
ctrl+r  前进（常见ctrl+y）  
.   重复前一个动作

- 进入编辑模式的命令
> i, I   从当前光标处插入，从当前行的第一个非空格符处开始插入
a, A    从下一个字符处开始插入，从当前行最后一个字符处开始插入
o, O    在下面插入新行，从上面插入新行
r, R    取代字符一次，一直取代直到按下ESC

- 进入指令模式的命令
> :w    保存文件
:w! 强制写入
:q  离开vi
:q! 强制离开，不保存文件
:wq 强制存储后离开
ZZ  同:wq
:w filename 另存为
:r filename 读入另外一个文件，追加到下一行
:n1,n2 w filename   将指定行另存为文件
:! command  暂时离开vi执行其他linux命令，显示命令执行结果

- vim环境的变更
> :set nu   显示行号
:set nonu   取消行号

### 10.linux yum命令

- yum check-update  列出所有可更新的软件
- yum update    更新所有软件
- yum install <package_name>    安装指定软件
- yum update <package_name> 更新指定软件
- yum list  列出所有可以安装的软件
- yum remove <packeage_name> 删除软件
- yum search <keyword>  搜索软件
- yum clean packages    清除缓存目录下的软件
- yum clean headers 清除缓存目录下的headers
- yum clean oldheaders  清除缓存目录下旧的headers
- yum clean, yum clean all  清除缓存目录下的软件包及旧的headers
> 等于 yum clean packages; yum clean oldheaders
- 安装国内 yum 源
> 备份/etc/yum.repos.d/CentOS-Base.repo
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
下载对应版本的repo文件，放入/etc/yum.repos.d/

### 11.运行shell

- shell 的分类
> Bourne Shell（/usr/bin/sh或/bin/sh）UNIX最初使用的shell
Bourne Again Shell（/bin/bash）Bourne Shell 的扩展
C Shell（/usr/bin/csh）
K Shell（/usr/bin/ksh）
Shell for Root（/sbin/sh）

- 两种运行方式
``` bash
    chmod +x ./test.sh
    ./test.sh    # 不能写成test.sh，否则会从系统path中寻找，把 test.sh 当成一个程序来执行（本质是一个脚本文件被当成参数传递给 /bin/sh 执行）
    /bin/sh test.sh
```
- 定义及使用变量
``` bash
your_name="tom"
echo $your_name
echo "your name is ${your_name}"
readonly your_name  # 只读变量
unset your_name  # unset 不能删除只读变量
```
- 字符串
``` bash
str= 'abc'
# 区别同 php
# 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
# 单引号字串中不能出现单引号（对单引号使用转义符后也不行）。
echo ${#str}  # 输出字符串的长度
echo ${str:1:4}  # 截取字符串，从索引1开始截取4个字符
echo `expr index "$str" a`  # 输出 a 在 abc 中的索引：0
```

- 数组
``` bash
array_name=(1 2 3 4 5)  # 定义数组
array_name[0]=0  # 设置元素
${array_name[0]}  # 读取元素
echo ${array_name[@]}  # 读取数组的所有元素
echo ${#array_name[@]}  # 获取数组的长度
echo ${#array_name[*]}  # 同上，获取长度
```

- 参数
``` bash
$n  # $加数字，获取指定索引参数
$*  #  一个字符串显示所有参数，$1 $2 $3 的形式
$$  # 脚本运行的当前进程ID号
$!  # 后台运行的最后一个进程的ID号
$@  # 与$*相同，但是返回的是个数组，("$1" "$2" "$3") 的形式
$-  # 显示shell使用的当前选项
$?  # 显示最后命令的退出状态，0表示没有错误，其他任何值表明有错误
```

### 12.Shell 基本运算符

- 算术运算符
``` bash
# 原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用
val = `expr 2 + 2`  # 2 + 2之间必须要有空格，必须要用``包裹住
echo $val
+
-
*
/
%
=
==
!=
```
- 关系运算符
``` bash
if [ $a -eq $b ]    # 中间要有空格，必须使用[]包裹住
then
    echo "a等于b"
else
    echo "a不等于b"
-eq
-ne
-gt
-lt
-ge
-le
```
- 布尔运算符
``` bash
if [ $a -lt $b -o $a -gt $b ]   # 与关系运算符类似
!
-o   等同于    ||
-a   等同于    &&
```
- 字符串运算符
``` bash
if [ $a = $b ]
=
!=
-z  # 是否长度为0
-n  # 是否长度不为0
str # 是否为空
```
- 文件测试运算符
``` bash
if [ -r $file ]
then
   echo "文件可读"
-b # 设备文件
-c  # 字符设备文件
-d  # 目录
-f  # 普通文件
-g  # 设置了 SGID 位
-k  # 设置了粘着位 
-p  # 有名管道
-u  # 设置了SUID位
-r  # 可读
-w  # 可写
-x  # 可执行
-s  # 为空
-e  # 存在
```

### 13.Shell echo 命令

- read 命令从标准输入读取一行，并赋值给指定变量
``` bash
read name
echo $name
```
- 转义用 \
``` bash
echo -e "OK! \n" # -e 开启转义，\n换行，\c不换行
echo "It it a test"
```
- 显示结果保存至文件
``` bash
echo "It is a test" > myfile
```

-  原样输出
``` bash
echo `$name\"`  # 使用单引号
```

- 显示命令执行结果
``` bash
echo `date`
```

### 14.Shell printf 命令

- printf 命令的语法：
``` bash
printf format-string [arguments...]
# format-string: 为格式控制字符串
# arguments: 为参数列表。

printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
-：左对齐，默认右对齐
10：宽度10，不够空格补全，超出则显示全部内容
%d：Decimal 十进制证书
%s： String 字符串
%c：Char 字符，如果是字符串，自动截取第一个字符作为结果输出
%f：Float 浮点
\a：警告字符，通常为ASCII的BEL字符
\b：后退
\c：不显示输出结果中结尾的换行字符
\f：换页
\n：换行
\r：回车
\t：水平制表符
\v：垂直制表符
\\：反斜杠字符
\ddd：表示1到3位8进制字符。仅在格式字符串中有效
\0ddd：表示1到3位8进制字符
```

### 15.Shell test 命令

``` bash
num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo '两个数相等！'
-eq
-ne
-gt
-ge
-lt
-le
=
!=
-z  # 字符串长度为0
-n  # 字符串长度不为0
```

### 16.Shell 流程控制

-  if else 条件判断
``` bash
if condition
then
    command1
else
    command
fi
```

- for 循环
``` bash
for var in item1 item2 ... itemN
do
    command1
    command2
done
# 一行
for var in item1 item2 ... itemN; do command1; command2… done;
```

- while 语句
``` bash
while condition
do
    command
done
# 无限循环：
while :
do
    command
done
# 或者
while true
do
    command
done
```

- until 循环

``` bash
until condition # 直到条件为真
do
    command
done
```

- case
``` bash
case 值 in
值1)
    command1
;;
值2|值3)
    command2
;;
*)
    command3
;;
esac
```

- 跳出循环
``` bash
break
continue
```

### 17.Shell 函数

``` bash
function funname(){ # function 关键字可选
     echo "第一个参数为 $1 !" # 参数通过 $n 获取，$1表示第一个参数，n>=10时，需要使用${n}来获取参数
    return int # 返回值必须是 int
}

funname
echo "返回值为：$?"  # 返回值通过 $? 来获得
# 函数定义必须放在脚本开始部分
$#  传递到脚本的参数个数
$*  以一个单字符串显示所有向脚本传递的参数："$1 $2 … $n"
$$  脚本运行的当前进程ID号
$!  后台运行的最后一个进程的ID号
$@  与$*相同，但是使用时加引号："$1" "$2" … "$n"
$-	显示Shell使用的当前选项，与set命令功能相同。
$?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
```

### 18.Shell 输入/输出重定向

- 命令列表
``` bash
command > file  # 将输出重定向到file
command < file  # 将输入重定向到file
command >> file # 追加的方式重定向到file
n > file	# 将文件描述符为 n 的文件重定向到 file。
n >> file	# 将文件描述符为 n 的文件以追加的方式重定向到 file。
n >& m	# 将输出文件 m 和 n 合并。
n <& m	# 将输入文件 m 和 n 合并。
<< tag	# 将开始标记 tag 和结束标记 tag 之间的内容作为输入。
```

-  文件描述符
``` bash
标准输入文件(stdin)：0
标准输出文件(stdout)：1
标准错误文件(stderr)：2

command 2 > file                    # stderr重定向到file
command 2 >> file                   # stderr追加到file
command > file 2>&1             # stdout 和 stderr合并后重定向到file，&表示重定向的目标不是一个文件，而是一个文件描述符，>&也可写做&>
command < file1 > file2
```

- Here Document
``` bash
wc -l << EOF
    欢迎来到
    菜鸟教程
    www.runoob.com
EOF
3   # 输出结果为 3 行
```

-  /dev/null 文件
``` bash
command > /dev/null # 执行命令，但又不希望在屏幕上显示输出结果
```

### 19.Shell 文件包含
``` bash
. filename  # .号后面一个空格，导入一个脚本文件进来
```