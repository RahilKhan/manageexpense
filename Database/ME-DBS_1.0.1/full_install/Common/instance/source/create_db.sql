connect SYS/"#SYS_PASSWORD" as SYSDBA
set echo on
spool #SOURCE_PATH/instance/log/create_db.log
startup nomount pfile="#SOURCE_PATH/instance/install/init.ora";
CREATE DATABASE #DB_INSTANCE_NAME
maxinstances #MAXINSTANCES
maxlogfiles #MAXLOGFILES 
maxlogmembers #MAXLOGMEMBERS 
maxdatafiles #MAXDATAFILES 
DATAFILE '#INSTALL_BASE/data001/#DB_INSTANCE_NAME/#SYSTEM_TABLESPACE.dbf' SIZE #SYSTEM_TBS_SIZE REUSE AUTOEXTEND ON NEXT  512000K MAXSIZE 31G
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE '#INSTALL_BASE/data001/#DB_INSTANCE_NAME/#SYSAUX_TABLESPACE.dbf' SIZE #SYSAUX_TBS_SIZE REUSE AUTOEXTEND ON NEXT  512000K MAXSIZE 31G
SMALLFILE DEFAULT TEMPORARY TABLESPACE #TEMP_TABLESPACE TEMPFILE '#INSTALL_BASE/data001/#DB_INSTANCE_NAME/#TEMP_TABLESPACE.dbf' SIZE #TEMP_TBS_SIZE REUSE AUTOEXTEND ON NEXT 1048576K MAXSIZE 31G
SMALLFILE UNDO TABLESPACE #UNDO_TABLESPACE DATAFILE '#INSTALL_BASE/data001/#DB_INSTANCE_NAME/#UNDO_TABLESPACE.dbf' SIZE #UNDO_TBS_SIZE REUSE AUTOEXTEND ON NEXT  512000K MAXSIZE 31G
CHARACTER SET #ORACLE_CHAR_SET
NATIONAL CHARACTER SET #NATIONAL_CHAR_SET
LOGFILE GROUP 1 ('#INSTALL_BASE/redo001/#DB_INSTANCE_NAME/redo_#DB_INSTANCE_NAME_01_01.log','#INSTALL_BASE/redo002/#DB_INSTANCE_NAME/redo_#DB_INSTANCE_NAME_01_02.log') SIZE #REDOLOG_SIZE,
GROUP 2 ('#INSTALL_BASE/redo002/#DB_INSTANCE_NAME/redo_#DB_INSTANCE_NAME_02_01.log','#INSTALL_BASE/redo003/#DB_INSTANCE_NAME/redo_#DB_INSTANCE_NAME_02_02.log') SIZE #REDOLOG_SIZE,
GROUP 3 ('#INSTALL_BASE/redo003/#DB_INSTANCE_NAME/redo_#DB_INSTANCE_NAME_03_01.log','#INSTALL_BASE/redo001/#DB_INSTANCE_NAME/redo_#DB_INSTANCE_NAME_03_02.log') SIZE #REDOLOG_SIZE
USER SYS IDENTIFIED BY "#SYS_PASSWORD" USER SYSTEM IDENTIFIED BY "#SYS_PASSWORD";
spool off
exit;
