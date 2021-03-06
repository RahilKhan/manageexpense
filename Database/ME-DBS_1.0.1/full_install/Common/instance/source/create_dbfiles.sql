connect SYS/#SYS_PASSWORD as SYSDBA
set echo on
spool #SOURCE_PATH/instance/log/create_dbfiles.log
CREATE TABLESPACE "#DEFAULT_TABLESPACE" LOGGING DATAFILE '#INSTALL_BASE/data001/#DB_INSTANCE_NAME/#DEFAULT_TABLESPACE.dbf' SIZE #DEFAULT_TBS_SIZE REUSE AUTOEXTEND ON NEXT  1280K MAXSIZE 31G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO;
CREATE TABLESPACE "#AUDIT_TABLESPACE" LOGGING DATAFILE '#INSTALL_BASE/data001/#DB_INSTANCE_NAME/#AUDIT_TABLESPACE.dbf' SIZE #AUDIT_TBS_SIZE REUSE AUTOEXTEND ON NEXT  1280K MAXSIZE 31G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO ;
CREATE TABLESPACE "#TOOLS_TABLESPACE" LOGGING DATAFILE '#INSTALL_BASE/data001/#DB_INSTANCE_NAME/#TOOLS_TABLESPACE.dbf' SIZE #TOOLS_TBS_SIZE REUSE AUTOEXTEND ON NEXT  320K MAXSIZE 31G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO ;
ALTER DATABASE DEFAULT TABLESPACE "#DEFAULT_TABLESPACE";
spool off
exit;
