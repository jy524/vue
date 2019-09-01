>groupadd police
>groupadd bandit
>useradd -g police jack
>useradd -g police jerry
>useradd -g bandit xh
>useradd -g bandit xq

>touch 1.txt
>chmod 640 1.txt
>chomd o=r,g=rw 1.txt
>usermod -g police xh


神仙妖怪练习题
>groupadd god 
>groupadd ghost
>useradd -g god ss
>useradd -g god ts
>useradd -g ghost wk
>useradd -g ghost pig

>passwd ss
>passwd ts
>passwd wk
>passwd pig

>vim mokey.java
>chmod 760 mokey.java
>usermod -g ghost ss
>vim mokey.java

//创建练习
>useradd mycentos
>passwd mycentos
>mkdir -r /test/t11/t1
>cd /text/t1/t1/
>vim aa.txt
>chmod 700
>date>aa.txt

>cd ~
>rm -rf /test
>userdel -r mycentos
>init 5
>reboot/halt
