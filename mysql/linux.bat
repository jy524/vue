linux命令

tar 解压文件
ls 查看当前目录下面的文件
ll 查看当前目录下面的文件

linux根目录为/

touch 创建的文件

vim
一般模式（vim 文件）
编辑模式（i/a按键进入）
命令模式（:按键进入）
:wq 保存退出
:q  退出
:q! 强制退出

vim中
复制 yy；复制5行 5yy；粘贴 p
删除当前行 dd；删除5行 dd；删除5行

显示行号 
:set:nu;
关闭行号
:set:nonu


关机&重启命令
shutdwon 
    shutdown -h now     立刻关机
    shutdown -h 1       1个小时后关机
    shutdown -r now      立刻重启
halt 
    就是直接使用，效果等价于关机
reboot
    reboot      立刻重启

保存内存中的数据，注意：关机的时候最好先使用这个语句
sync

切换用户使用
su - 用户名来切换

用户管理（用户组）
useradd 用户    --添加用户，自动分配个和用户相同的分组
useradd -d 指定目录 用户
passwd 用户 --给用户指定或者修改密码

pwd --查看当前的目录

删除用户
userdel 用户名  保留家目录
userdel -r 用户名 删除用户同时删除家目录

注意：保留家目录

查询用户信息
id 用户名

切换用户
su 用户名
注意：
1、高权限用户切换低权限用户不需要输入密码
2、可通过exit返回切换前的用户

用户组的概念
groupadd 组名   增加组
groupdel 组名   删除组
分配组
useradd -g 组名 用户名

迁移组
usermod -g 组名 用户名



指令操作（操作）
7大运行级别
设置运行级别 init [012356]
0-关机
1-单用户
2-多用户未联网
3-多用户联网
4-备用
5-图形化界面
6-重启

vim etc/inittab也可设置运行等级

开机启动enter进入可修改运行级别

帮助指令
man 指令
help 指令

文件目录指令
pwd指令  查看当前所在的绝对路径

ls 查看当前目录下的所有文件
    -l  查看详细的文件
    -a  查看包含隐藏文件的所有文件

cd  切换目录
    cd ~    回到家目录

mkdir 创建目录
    mkdir -p 创建多级目录

rmdir 删除目录

touch 创建一个/多个文件

cp 拷贝指令
cp [选项] source dest
选项 -r 递归拷贝目录下的所有文件
\cp 强制覆盖

rm [选项] 要删除的文件或目录
rm -rf 目录     --删除目录
rm -f 文件/目录 --删除文件/目录，不提示


mv 移动文件

cat [选项] 指令 --以只读的方式显示文件内容
cat 文件   --显示文件
cat -n 文件 --显示文件并显示行号
cat -n 文件 | more 分页形式显示内容

more指令
more 文件   --查看文件信息
    enter --一行
    空格    --一页


less 指令   --可用于查看大文件

> --输出重定向
>> --追加信息
eg: ls -l>文件
    ls -al>>文件 
    cat text1>文件  
    echo '123'>>文件


echo 指令 --输出内容到控制台

head 指令 --查看指定文件前面的内容
head -n 10 文件     --查看指定文件的前10行信息

tail 指令  --查看文件的后10行内容
tail -n 5 文件      --查看指定文件的后5行内容
tail -f 文件        --实时的追踪某个文件的内容变化

ln指令
--给文件创建一个软连接
In -s 源地址 软连接文件

history 指令
--查看已经执行过的历史命令，也可以执行历史指令
history --查看所有的历史指令
history n --查看最后的n条历史指令
!i --执行编号为i的历史指令


时间日期类 
date 当前时间
date "+%Y"  --查看当前年份
date "+%m"  --查看当前月份
date "+%Y-%m-%d %H:%M:%s"   --格式化时间

date -s 时间    --按照date格式显示时间

cal --查看日历指令

搜索查找类
find 指令 --查找文件
    find [搜索范围] [选项]
    eg:
    find /home -name hello.txt --按照名称搜索指定路径下文件
    find /opt -user root --按照文件的用户查找
    find / -size +20M --按照文件大小查找文件
     

locate 指令 --通过创建数据库实现快速定位文件
1）创建数据库 updatedb
2）使用 locate 1.text1


grep 过滤查找
grep [选项] 查找内容

cat 1.txt | grep -n yes --显示行号
cat 2.txt | grep -i yes --不区分搜索元素的大小写


压缩和解压类
gzip 压缩文件
gunzip 解压文件

注意：gzip压缩后不会保留源文件


zip 压缩包名 压缩文件
unzip 压缩包名

eg:
zip -r bag.zip /home/
unzip -d /opt/ bag.zip

tar 指令操作（操作）
tar -zcvf 压缩包名 文件
压缩多个文件
tar -zcvf bag.tar.gz 1.txt 2.txt
解压文件
tar -zxvf bag.tar.gzip
解压到指定目录
tar -zxcf bag.tar.gz -c /opt/

组管理和权限管理
文件
1、所有者；2、所在组；3、其他组；

>groupadd police
>useradd -g police tom
>passwd tom


chown 用户 文件 --改变文件所有者
chgrp 组名 文件 --改变文件所在组

>groupadd bandit
>usemod -g bandit tom

文件权限
-rwxr--r-- 1 tom police 6 1.txt
第1位-表示文件，d-表示目录
2-4表示拥有者的全新
5-7 表示同组的用户的权限
8-10 表示不同组的用户的权限

修改权限
chmod u=rwx,g=rwx,o=rwx 文件/目录
u：所有者
g：所在组
o：其他人
a：所有人

chomd u-x,g+w 文件 

--定时任务
crontab指令
crontab -e  --编辑
crontab -l  --查看
crontab -r  --删除 

* * * * *
分 小时 天 月 周


磁盘分区和挂载



