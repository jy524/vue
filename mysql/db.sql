-- 冲刷缓存
flush privileges

--创建新用户并授予权限

-- 创建新用户
create user `zs`@`127.0.0.1` identified by '123'

create user 'ls2'@'127.0.0.1' identified by '123'

-- 删除用户
drop user 'ls2'@'127.0.0.1'

-- 重命名用户
rename user 'zs'@'127.0.0.1' to 'ls'@'127.0.0.1'

-- 修改密码
set password for 'ls'@'127.0.0.1'=password('111')

-- 数据表的授权
grant 权限1[,权限2,权限3····] on *.* to 用户名@ip地址
eg:
    -- 添加服务器权限
    grant all on *.* to 'ls'@'127.0.0.1';
    grant insert,delete,update,select on test.* to 'ls'@'127.0.0.1';

-- 取消权限
revoke 权限2[,权限3,权限4] on *.* from 用户名@ip地址
eg:
    -- 移除服务器权限
    revoke all on *.* from 'ls'@'127.0.0.1';
    revoke insert,delete,update on test.* from 'ls'@'127.0.0.1';