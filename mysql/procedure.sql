
--在写入之前修改新写入的数据
create trigger t1
before
insert
on ord
for each row
begin
    declare max_num int;
    select sku into max_num from goods where gid=new.gid;
    if new.num>max_num then
    set new.num:=max_num;
    end if;
    update goods set sku=sku-new.num where gid=new.gid;
end$

--mysql的存储工程
create procedure g1()
begin
    select 'hello world';
end$

create procedure g2()
begin
    declare name varchar(32);
    declare age int;
    set name:='jy';
    set age:=12;
    select concat('姓名',name,',','年龄',age);
end$

create procedure g3()
begin
    set @name='zs';
    set @age=25;
    select @name,@age;
end$

--传递参数
create procedure g4(w int,h int)
begin
    select w,h;
end$

create procedure g5(in w int,in h int)
begin
    declare tip varchar(32);
    if w>h then
    set tip:='you are so weight';
    elseif w<h then
    set tip:='you are so heigt';
    else
    set tip:='you are square';
    end if;
    select tip;
end$

--获取返回参数
create procedure g6(age varchar(32))
begin
    select age;
end$

create procedure g7(in age int,out info varchar(32))
begin
    if age>18 then set info='18+';
    elseif age<18 then set info='18-';
    else set info='18=';
    end if;
end$

--while的使用
create procedure p2(in count int)
begin
    declare i int default 0;
    declare sum int default 0;
    while i<count do
        set i:=i+1;
        set sum:=sum+i;
    end while;
    select sum;
end$    
--case的使用
create procedure p3(in age int)
begin
    case
        when age<20 then select '年轻人';
        when age<40 then select '青年人';
        when age<60 then select '中年人';
        else select '老年人';
    end case;
end$
--repeat的使用
create procedure p4(in count int,out sum int)
begin
    declare i int default 0;
    set sum:=0;
    repeat
        set i:=i+1;
        set sum:=sum+i;
        until i>=100 
    end repeat;
end$


-- 游标的使用
-- declare 声明；declare 声明 cursor for sql语句 
--open 
--fetch
--close

---在mysql cursor中，可以declare continue handler来操作1个越界标识 
declare continue handler for not found set you:=0;