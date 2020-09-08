
--��һ�����������ݿ�   (linux�����µ�¼oracle�û���oracle/oracle)
--uat���ݿⱸ��·����/home/oracle/app/oracle/admin/orcl/dpdump   
--�ȱ���md��
expdp xir_md_j/xpar@orcl dumpfile=xir_md_j_HT_20191214.dmp

exp xir_md_j/xpar@orcl dumpfile=xir_md_j_sh_20191210.dmp --�����ļ�����Ϊmd_uat_����+���

--�ٱ���trd��
expdp trd_cams/xpar@orcl dumpfile=trd_cams_HT_20191214.dmp

exp trd_cams/xpar@orcl file=trd_cams_sh_20191210.dmp

--�ڶ�����ɾ���û�   ��plsql��¼sys�û� sys/xquant��(linux�����µ�¼oracle�û�Ҳ���ԣ�sqlplus / as sysdba)
drop user xir_md_j cascade;

drop user trd_cams cascade;

--�統ǰ�û������ӣ�����ɾ������ִ����������ɾ������
--LOCK TRD_CAMS�û�
ALTER USER TRD_CAMS ACCOUNT LOCK;
--�鿴TRD_CAMS��ռ�ý���
SELECT * FROM V$SESSION WHERE USERNAME='TRD_CAMS';
--ɱ�����̣���SID��SERIAL#��
ALTER SYSTEM KILL SESSION '152,6823';sp

--���sql�����������н��̵�kill���
SELECT 'ALTER SYSTEM KILL SESSION '||''''||SID||','||SERIAL#||''''||';' FROM V$SESSION WHERE USERNAME='TRD_CAMS';


--���������ؽ��û�
-- �½��û���XIR_MD_J
CREATE USER "XIR_MD_J"  PROFILE "DEFAULT" IDENTIFIED BY "xpar" DEFAULT TABLESPACE "XIR_MD_DAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
GRANT UNLIMITED TABLESPACE TO "XIR_MD_J";
GRANT "CONNECT" TO "XIR_MD_J";
GRANT "RESOURCE" TO "XIR_MD_J";
GRANT DBA TO XIR_MD_J;

-- �½��û���TRD_CAMS
CREATE USER "TRD_CAMS"  PROFILE "DEFAULT" IDENTIFIED BY "xpar" DEFAULT TABLESPACE "XIR_TRD_DAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
GRANT UNLIMITED TABLESPACE TO "TRD_CAMS";
GRANT "CONNECT" TO "TRD_CAMS";
GRANT "RESOURCE" TO "TRD_CAMS";
GRANT DBA TO TRD_CAMS;



--���Ĳ�����������
--�ȵ�MD�⣬��TRD��  (linux�����µ�¼oracle�û���oracle/oracle) dpdumpĿ¼�¶�Ӧ��dmp�ļ���ź�
impdp xir_md_j/xpar@orcl file='xir_md_j-xmT.dmp' 

impdp xir_md_j/xpar@orclpdb file=xir_md_j_sd_20191127.dmp;

impdp trd_cams/xpar@orcl file='trd_cams-xmT.dmp'

impdp trd_cams/xpar@orclpdb file=

--���뵥����
imp trd_cams/xpar@orcl file=tfnd_nav20170814.dmp full=y 


--��Ҫִ�и��µĽű����޸����ݿ��ַ���˿ںš�web�˿ں�

select * from ttrd_cluster_machine


--����ű�

--ִ�нű�




--ע�⣺���������ԭtrd�⣬���ܻ����25��view����ش�����������²���
--xir_md_j�û���¼��ִ������sql�������б��Ȩ�޸���trd_cams�û�
SELECT 'GRANT ALL ON ' || TABLE_NAME ||' TO '|| '"'||'TRD_CAMS'||'"'||';' FROM ALL_ALL_TABLES WHERE OWNER='XIR_MD_J';

--Ȼ��trd_cams�û���¼�����±������е���ʧ�ܵ���ͼ


--���岽��������ݿ��ttrd_cluster_machine������,��ip�ĳ�ʵ�ʵĵ�ַ
select * from ttrd_cluster_machine for update;


--�޸����ݿ�����
alter user XIR_MD_J IDENTIFIED BY xxxx;

--���ݵ������
select * from timp_config for update;


--�������������
impdp system/******** directory=DUMPFILE dumpfile=TRD_CAMS_13W.DMP schemas=trd_cams logfile=trd_cams.20160612.log 

--�û�Ȩ������


revoke dba from xir_md_j;

grant dba to trd_cams;

grant dba to xir_md_j;
--��ͬ���
select * from dba_synonyms;
--�鿴�û������еı�
SELECT * FROM ALL_TABLES WHERE OWNER='XIR_MD_J';
--����ͬ���
CREATE OR REPLACE PUBLIC SYNONYM TABLE_NAME FOR TRD_CAMS.TABLE_NAME;
SELECT 'CREATE OR REPLACE PUBLIC SYNONYM '||TABLE_NAME||' FOR TRD_CAMS.'||TABLE_NAME||';' FROM ALL_ALL_TABLES WHERE OWNER='TRD_CAMS';


--�鿴�û�����Ȩ��
SELECT * FROM USER_TAB_PRIVS;
--�鿴�û�ϵͳȨ��
SELECT * FROM user_sys_privs;
--�鿴�û���ɫ
SELECT * FROM USER_ROLE_PRIVS;

--�鿴���ݿ��ַ���
select userenv('language') from dual;

--���û�����Ȩ��
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



--������ԭtrd�⣬��Ҫmd����丳Ȩ����Ȩ�ޣ�����������ͬ���

SELECT 'GRANT ALL ON ' || TABLE_NAME || ' TO TRD_CAMS;' FROM USER_TABLES;






--���������֮���޸�IP

--xams_j2ee_working�е�sysconfig�ļ�

--PP�µ� xQuant.PP.Service.config

--ETL�µ�config.xml

--���ݿ��е�IP------
��Ҫִ�и��µĽű����޸����ݿ��ַ���˿ںš�web�˿ں�

select * from ttrd_cluster_machine

������ڲ���IP��ifconfig  




CREATE USER "XIR_MD_J_TEMP"  PROFILE "DEFAULT" IDENTIFIED BY "xpar" DEFAULT TABLESPACE "XIR_MD_DAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
GRANT UNLIMITED TABLESPACE TO "XIR_MD_J_TEMP";
GRANT "CONNECT" TO "XIR_MD_J";
GRANT "RESOURCE" TO "XIR_MD_J";
GRANT DBA TO XIR_MD_J;

-- �½��û���TRD_CAMS
CREATE USER "TRD_CAMS_TEMP"  PROFILE "DEFAULT" IDENTIFIED BY "xpar" DEFAULT TABLESPACE "XIR_TRD_DAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
GRANT UNLIMITED TABLESPACE TO "TRD_CAMS_TEMP";
GRANT "CONNECT" TO "TRD_CAMS";
GRANT "RESOURCE" TO "TRD_CAMS";
GRANT DBA TO TRD_CAMS;

-- �鿴������㱾��
strings libxQuantTp.so | grep 'version'


-- ����������
-- ����һ
-- ��ѯ�����ı�
select b.owner TABLEOWNER, b.object_name TABLENAME, c.OSUSER LOCKBY,
c.USERNAME LOGINID, c.sid SID, c.SERIAL# SERIAL
from v$locked_object a,dba_objects b, v$session c 
where b.object_id = a.object_id AND a.SESSION_ID =c.sid;

--��ѯ������������sql

select l.session_id sid,s.serial#,l.locked_mode,l.oracle_username,s.user#,l.os_user_name,s.machine,s.terminal,a.sql_text,a.action
from v$sqlarea a, v$session s, v$locked_object l
where l.session_id = s.sid and s.prev_sql_addr = a.address
order by sid, s.serial#;

-- ���������ı� ��kill sid��serial��
alter system kill session '156,37633';
--�������������ı�
SELECT 'ALTER SYSTEM KILL SESSION '||''''||SID||','||SERIAL||''''||';' FROM (select b.owner TABLEOWNER, b.object_name TABLENAME, c.OSUSER LOCKBY,
c.USERNAME LOGINID, c.sid SID, c.SERIAL# SERIAL
from v$locked_object a,dba_objects b, v$session c 
where b.object_id = a.object_id AND a.SESSION_ID =c.sid);


--������
--�鿴��Щ����ס��
select b.owner,b.object_name,a.session_id,a.locked_mode from v$locked_object a,dba_objects b where b.object_id = a.OBJECT_ID;

--��ѯ���������ĻỰ
select b.username,b.sid,b.serial#,logon_time from v$locked_object a , v$session b where a.session_id = b.sid order by b.LOGON_TIME;

--���sid��serial#
select sid,serial#,paddr from v$session where sid = 259;

--��v$process��ͼ,�õ�spid
select spid from v$process where addr= '00000003E32BDE28';

--ɱ������(sid,serial#)
alter system kill session '259,37152';