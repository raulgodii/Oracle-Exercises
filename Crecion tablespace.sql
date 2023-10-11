
DROP TABLESPACE EJERCICIOS;
create tablespace ejercicios
datafile 'c:\ejercicios.dat' size 100M
default storage( Initial 100K next 100K)
online
Permanent;

DROP USER EJERCICIOS;
create user ejercicios
IDENTIFIED by MANAGER
default tablespace ejercicios
temporary tablespace temp;


grant dba to ejercicios;