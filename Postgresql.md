  postgresql常用命令：
    1. 登录数据库
        a. 使用postgres用户登录 
	  sudo -u postgres psql
	b. 普通登录
	  psql -U dbuser -d database -h 127.0.0.1 -p 543
	
    2. 查看控制台帮助文档
        > \h

    3. 查看所有数据库
        > \l

    4. 切换数据库
        > \c depot_development

    5. 查看表
	a. 查看所有的表
          > \d
	b. 查看表结构
          > \d db_table

    6. 查看所有用户
	> \du

    7. 创建用户
	a. 使用createuser创建用户 
	  sudo -u postgres createuser dbuser
	b. 登录控制台创建用户
	  sudo -u postgres psql
	  > create user dbuser with password 'password'
	c. 修改密码 
	  ALTER USER postgres WITH PASSWORD 'postgres';
	d. 常用创建用户命令
	  sudo postgres -c createuser -D -A -P username
    8. 修改密码
	a. psql终端修改dbuser密码	
	  > \password dbuser
	b. psql终端修改dbuser密码
	  > alter user dbuser with password 'password';
	c. 删除linux系统postgres用户的密码
	  > sudo passwd -d postgres
	d. 修改linux系统postgres用户的密码
	  > sudo -u postgres passwd
    9. 删除用户
	a. 在terminal中执行
	  sudo -u postgres dropuser dbuser
	b. 在psql终端中执行
	  > drop user dbuser;

    10. 修改用户权限
        alter role user
            SUPERUSER
            NOSUPERUSER
            CREATEDB
            NOCREATEDB
            CREATEROLE
            NOCREATEROLE
            CREATEUSER
            NOCREATEUSER
            INHERIT
            NOINHERIT
            LOGIN
            NOLOGIN
            CONNECTION LIMIT connlimit
            PASSWORD password
            ENCRYPTED
            UNENCRYPTED
            VALID UNTIL 'timestamp'


    10. 创建数据库
	a. 方式一
	  sudo -u postgres createdb -O dbuser testdb
	b. 方式二
	  > create database testdb owner dbuser;
	  > grant all privileges on database testdb to dbuser;
	  > \c testdb;
	  > alter schema public owner to dbuser;
	  > grant all privileges on all sequences in schema public to dbuser;
	  > grant all privileges on all tables in schema public to dbuser;
	c. 常用创建数据库命令
	  sudo postgres -c createdb -O username dbname
    11. 退出控制台
	> \q

    12. 常用控制台命令
	\password           设置密码。
	\q                  退出。
	\h                  查看SQL命令的解释，比如\h select。
	\?                  查看psql命令列表。
	\l                  列出所有数据库。
	\c [database_name]  连接其他数据库。
	\d                  列出当前数据库的所有表格。
	\d [table_name]     列出某一张表格的结构。
	\du                 列出所有用户。
	\e                  打开文本编辑器。
	\conninfo           列出当前数据库和连接的信息。

    13. 基本的SQL语句
	# 创建新表
	CREATE TABLE user_tbl(name VARCHAR(20), signup_date DATE);
	
	# 插入数据
	INSERT INTO user_tbl(name, signup_date) VALUES('张三', '2013-12-22');
	
	# 查询记录
	SELECT * FROM user_tbl;
	
	# 更新数据
	UPDATE user_tbl set name = '李四' WHERE name = '张三';
	
	# 删除记录
	DELETE FROM user_tbl WHERE name = '李四' ;
	
	# 添加字段
	ALTER TABLE user_tbl ADD email VARCHAR(40);
	
	# 更改字段类型
	ALTER TABLE user_tbl ALTER COLUMN signup_date SET NOT NULL;
	
	# 设置字段默认值（注意字符串使用单引号）
	ALTER TABLE user_tbl ALTER COLUMN email SET DEFAULT 'example@example.com';
	
	# 去除字段默认值
	ALTER TABLE user_tbl ALTER email DROP DEFAULT;
	
	# 重命名字段
	ALTER TABLE user_tbl RENAME COLUMN signup_date TO signup;
	
	# 删除字段
	ALTER TABLE user_tbl DROP COLUMN email;
	
	# 表重命名
	ALTER TABLE user_tbl RENAME TO backup_tbl;
	
	# 删除表
	DROP TABLE IF EXISTS backup_tbl;
	
	# 删除库
	\c hello2;
	DROP DATABASE IF EXISTS hello;

    14. 备份/恢复
	1. pg_dump 备份
	  pg_dump --format=t -d db_name -U user_name -W -h 127.0.0.1 > dump.sql
	2. pg_dumpall 备份所有数据库
	3. pg_restore 恢复
	  pg_restore -d db_name -h 127.0.0.1 -U user_name < dump.sql
	4. psql testdb < testdb.sql 导入数据

	
    15. 
