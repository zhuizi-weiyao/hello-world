--/home/oracle/OracleData 该路径需根据实际配置
--1.//建表空间XIR_TRD
CREATE  TABLESPACE "XIR_TRD_DAT" DATAFILE 
'/home/oracle/app/oracle/oradata/orcl/XIR_TRD_DAT01.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/orcl/XIR_TRD_DAT02.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/orcl/XIR_TRD_DAT03.dbf' SIZE 2G REUSE autoextend on next 100m, 
'/home/oracle/app/oracle/oradata/orcl/XIR_TRD_DAT04.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/orcl/XIR_TRD_DAT05.dbf' SIZE 2G
REUSE autoextend on next 100m LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

CREATE  TABLESPACE "XIR_TRD_IDX" DATAFILE 
'/home/oracle/app/oracle/oradata/orcl/XIR_TRD_IDX01.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/orcl/XIR_TRD_IDX02.dbf' SIZE 2G
REUSE autoextend on next 100m LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

--2.//建表空间XIR_MD
CREATE  TABLESPACE "XIR_MD_DAT" DATAFILE 
'/home/oracle/app/oracle/oradata/orcl/XIR_MD_DAT01.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/orcl/XIR_MD_DAT02.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/orcl/XIR_MD_DAT03.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/orcl/XIR_MD_DAT04.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/orcl/XIR_MD_DAT05.dbf' SIZE 2G
REUSE autoextend on next 100m LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO; 

CREATE  TABLESPACE "XIR_MD_IDX" DATAFILE 
'/home/oracle/app/oracle/oradata/orcl/XIR_MD_IDX01.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/orcl/XIR_MD_IDX02.dbf' SIZE 2G
REUSE autoextend on next 100m LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO; 

--3.//建表空间XIR_TEMP
ALTER TABLESPACE "TEMP" ADD TEMPFILE 
'/home/oracle/app/oracle/oradata/orcl/XIR_TEMP01.dbf' SIZE 2G REUSE autoextend on next 100m;






--/home/oracle/OracleData 该路径需根据实际配置
--1.//建表空间XIR_TRD
CREATE  TABLESPACE "XIR_TRD_DAT_TEMP" DATAFILE 
'/home/oracle/app/oracle/oradata/ORCL/XIR_TRD_DAT_TEMP01.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/ORCL/XIR_TRD_DAT_TEMP02.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/ORCL/XIR_TRD_DAT_TEMP03.dbf' SIZE 2G REUSE autoextend on next 100m, 
'/home/oracle/app/oracle/oradata/ORCL/XIR_TRD_DAT_TEMP04.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/ORCL/XIR_TRD_DAT_TEMP05.dbf' SIZE 2G
REUSE autoextend on next 100m LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

CREATE  TABLESPACE "XIR_TRD_IDX_TEMP" DATAFILE 
'/home/oracle/app/oracle/oradata/ORCL/XIR_TRD_IDX_TEMP01.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/ORCL/XIR_TRD_IDX_TEMP02.dbf' SIZE 2G
REUSE autoextend on next 100m LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

--2.//建表空间XIR_MD
CREATE  TABLESPACE "XIR_MD_DAT_TEMP" DATAFILE 
'/home/oracle/app/oracle/oradata/ORCL/XIR_MD_DAT_TEMP01.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/ORCL/XIR_MD_DAT_TEMP02.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/ORCL/XIR_MD_DAT_TEMP03.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/ORCL/XIR_MD_DAT_TEMP04.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/ORCL/XIR_MD_DAT_TEMP05.dbf' SIZE 2G
REUSE autoextend on next 100m LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO; 

CREATE  TABLESPACE "XIR_MD_IDX_TEMP" DATAFILE 
'/home/oracle/app/oracle/oradata/ORCL/XIR_MD_IDX_TEMP01.dbf' SIZE 2G REUSE autoextend on next 100m,
'/home/oracle/app/oracle/oradata/ORCL/XIR_MD_IDX_TEMP02.dbf' SIZE 2G
REUSE autoextend on next 100m LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO; 