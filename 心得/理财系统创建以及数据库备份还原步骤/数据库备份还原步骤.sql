
--第一步：备份数据库   (linux环境下登录oracle用户：oracle/oracle)
--uat数据库备份路径：/home/oracle/app/oracle/admin/orcl/dpdump   
--先备份md库
expdp xir_md_j/xpar@orcl dumpfile=xir_md_j_HT_20191214.dmp

exp xir_md_j/xpar@orcl dumpfile=xir_md_j_sh_20191210.dmp --备份文件命名为md_uat_日期+编号

--再备份trd库
expdp trd_cams/xpar@orcl dumpfile=trd_cams_HT_20191214.dmp

exp trd_cams/xpar@orcl file=trd_cams_sh_20191210.dmp

--第二步，删除用户   （plsql登录sys用户 sys/xquant）(linux环境下登录oracle用户也可以：sqlplus / as sysdba)
drop user xir_md_j cascade;

drop user trd_cams cascade;

--如当前用户有连接，不能删除，先执行以下命令删除连接
--LOCK TRD_CAMS用户
ALTER USER TRD_CAMS ACCOUNT LOCK;
--查看TRD_CAMS的占用进程
SELECT * FROM V$SESSION WHERE USERNAME='TRD_CAMS';
--杀掉进程，‘SID，SERIAL#’
ALTER SYSTEM KILL SESSION '152,6823';sp

--这个sql可以生成所有进程的kill语句
SELECT 'ALTER SYSTEM KILL SESSION '||''''||SID||','||SERIAL#||''''||';' FROM V$SESSION WHERE USERNAME='TRD_CAMS';


--第三步，重建用户
-- 新建用户：XIR_MD_J
CREATE USER "XIR_MD_J"  PROFILE "DEFAULT" IDENTIFIED BY "xpar" DEFAULT TABLESPACE "XIR_MD_DAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
GRANT UNLIMITED TABLESPACE TO "XIR_MD_J";
GRANT "CONNECT" TO "XIR_MD_J";
GRANT "RESOURCE" TO "XIR_MD_J";
GRANT DBA TO XIR_MD_J;

-- 新建用户：TRD_CAMS
CREATE USER "TRD_CAMS"  PROFILE "DEFAULT" IDENTIFIED BY "xpar" DEFAULT TABLESPACE "XIR_TRD_DAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
GRANT UNLIMITED TABLESPACE TO "TRD_CAMS";
GRANT "CONNECT" TO "TRD_CAMS";
GRANT "RESOURCE" TO "TRD_CAMS";
GRANT DBA TO TRD_CAMS;



--第四步，导入数据
--先导MD库，后导TRD库  (linux环境下登录oracle用户：oracle/oracle) dpdump目录下对应的dmp文件需放好
impdp xir_md_j/xpar@orcl file='xir_md_j-xmT.dmp' 

impdp xir_md_j/xpar@orclpdb file=xir_md_j_sd_20191127.dmp;

impdp trd_cams/xpar@orcl file='trd_cams-xmT.dmp'

impdp trd_cams/xpar@orclpdb file=

--导入单个表
imp trd_cams/xpar@orcl file=tfnd_nav20170814.dmp full=y 


--需要执行更新的脚本和修改数据库地址、端口号、web端口号

select * from ttrd_cluster_machine


--编译脚本

--执行脚本




--注意：如果单独还原trd库，可能会出现25个view的相关错误，需进行以下操作
--xir_md_j用户登录，执行以下sql，把所有表的权限赋给trd_cams用户
SELECT 'GRANT ALL ON ' || TABLE_NAME ||' TO '|| '"'||'TRD_CAMS'||'"'||';' FROM ALL_ALL_TABLES WHERE OWNER='XIR_MD_J';

--然后trd_cams用户登录，重新编译所有导入失败的视图


--第五步，检查数据库表ttrd_cluster_machine的配置,把ip改成实际的地址
select * from ttrd_cluster_machine for update;


--修改数据库密码
alter user XIR_MD_J IDENTIFIED BY xxxx;

--数据导入服务
select * from timp_config for update;


--导入数据命令补充
impdp system/******** directory=DUMPFILE dumpfile=TRD_CAMS_13W.DMP schemas=trd_cams logfile=trd_cams.20160612.log 

--用户权限问题


revoke dba from xir_md_j;

grant dba to trd_cams;

grant dba to xir_md_j;
--查同义词
select * from dba_synonyms;
--查看用户的所有的表
SELECT * FROM ALL_TABLES WHERE OWNER='XIR_MD_J';
--创建同义词
CREATE OR REPLACE PUBLIC SYNONYM TABLE_NAME FOR TRD_CAMS.TABLE_NAME;
SELECT 'CREATE OR REPLACE PUBLIC SYNONYM '||TABLE_NAME||' FOR TRD_CAMS.'||TABLE_NAME||';' FROM ALL_ALL_TABLES WHERE OWNER='TRD_CAMS';


--查看用户对像权限
SELECT * FROM USER_TAB_PRIVS;
--查看用户系统权限
SELECT * FROM user_sys_privs;
--查看用户角色
SELECT * FROM USER_ROLE_PRIVS;

--查看数据库字符集
select userenv('language') from dual;

--建用户增加权限
GRANT CREATE SEQUENCE TO "TRD_CAMS";
GRANT CREATE ANY TRIGGER TO "TRD_CAMS";
GRANT CREATE ANY PROCEDURE TO "TRD_CAMS";
GRANT UNLIMITED TABLESPACE TO "TRD_CAMS";
GRANT CREATE SESSION TO "TRD_CAMS";
GRANT CREATE SYNONYM TO "TRD_CAMS";
GRANT CREATE ANY SYNONYM TO "TRD_CAMS";
GRANT CREATE TABLE TO "TRD_CAMS";
GRANT CREATE SEQUENCE TO "TRD_CAMS";
GRANT CREATE VIEW TO "TRD_CAMS";
GRANT CREATE ANY INDEX TO "TRD_CAMS";
GRANT CREATE ANY DIRECTORY TO "TRD_CAMS";
GRANT "CONNECT" TO "TRD_CAMS";
GRANT "RESOURCE" TO "TRD_CAMS";



--单独还原trd库，需要md库给其赋权（表权限），不用重做同义词

SELECT 'GRANT ALL ON ' || TABLE_NAME || ' TO TRD_CAMS;' FROM USER_TABLES;






--导入虚拟机之后，修改IP

--xams_j2ee_working中的sysconfig文件

--PP下的 xQuant.PP.Service.config

--ETL下的config.xml

--数据库中的IP------
需要执行更新的脚本和修改数据库地址、端口号、web端口号

select * from ttrd_cluster_machine

虚拟机内部的IP，ifconfig  




CREATE USER "XIR_MD_J_TEMP"  PROFILE "DEFAULT" IDENTIFIED BY "xpar" DEFAULT TABLESPACE "XIR_MD_DAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
GRANT UNLIMITED TABLESPACE TO "XIR_MD_J_TEMP";
GRANT "CONNECT" TO "XIR_MD_J";
GRANT "RESOURCE" TO "XIR_MD_J";
GRANT DBA TO XIR_MD_J;

-- 新建用户：TRD_CAMS
CREATE USER "TRD_CAMS_TEMP"  PROFILE "DEFAULT" IDENTIFIED BY "xpar" DEFAULT TABLESPACE "XIR_TRD_DAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
GRANT UNLIMITED TABLESPACE TO "TRD_CAMS_TEMP";
GRANT "CONNECT" TO "TRD_CAMS";
GRANT "RESOURCE" TO "TRD_CAMS";
GRANT DBA TO TRD_CAMS;

-- 查看计算核算本版
strings libxQuantTp.so | grep 'version'


-- 表被锁处理方法
-- 方法一
-- 查询被锁的表
select b.owner TABLEOWNER, b.object_name TABLENAME, c.OSUSER LOCKBY,
c.USERNAME LOGINID, c.sid SID, c.SERIAL# SERIAL
from v$locked_object a,dba_objects b, v$session c 
where b.object_id = a.object_id AND a.SESSION_ID =c.sid;

--查询导致锁表的相关sql

select l.session_id sid,s.serial#,l.locked_mode,l.oracle_username,s.user#,l.os_user_name,s.machine,s.terminal,a.sql_text,a.action
from v$sqlarea a, v$session s, v$locked_object l
where l.session_id = s.sid and s.prev_sql_addr = a.address
order by sid, s.serial#;

-- 解锁被锁的表 （kill sid和serial）
alter system kill session '156,37633';
--批量解锁被锁的表
SELECT 'ALTER SYSTEM KILL SESSION '||''''||SID||','||SERIAL||''''||';' FROM (select b.owner TABLEOWNER, b.object_name TABLENAME, c.OSUSER LOCKBY,
c.USERNAME LOGINID, c.sid SID, c.SERIAL# SERIAL
from v$locked_object a,dba_objects b, v$session c 
where b.object_id = a.object_id AND a.SESSION_ID =c.sid);


--方法二
--查看哪些表被锁住了
select b.owner,b.object_name,a.session_id,a.locked_mode from v$locked_object a,dba_objects b where b.object_id = a.OBJECT_ID;

--查询引起死锁的会话
select b.username,b.sid,b.serial#,logon_time from v$locked_object a , v$session b where a.session_id = b.sid order by b.LOGON_TIME;

--查出sid和serial#
select sid,serial#,paddr from v$session where sid = 259;

--查v$process视图,得到spid
select spid from v$process where addr= '00000003E32BDE28';

--杀死进程(sid,serial#)
alter system kill session '259,37152';