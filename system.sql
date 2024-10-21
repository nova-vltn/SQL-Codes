--A. Roles and Previleges--
CREATE ROLE plm_developers;
GRANT CREATE SESSION TO plm_developers;
GRANT UNLIMITED TABLESPACE TO plm_developers;
GRANT CREATE ANY TABLE to plm_developers;
GRANT CREATE ANY VIEW to plm_developers;
GRANT CREATE SYNONYM to plm_developers;


CREATE ROLE plm_testers;
GRANT CREATE SESSION TO plm_testers;
GRANT UNLIMITED TABLESPACE TO plm_testers;
GRANT SELECT ANY TABLE to plm_testers;

--Create 2 users (francis and jose) and assign the role pim_developers
CREATE USER francis1 IDENTIFIED BY francis;
CREATE USER jose1 IDENTIFIED BY jose;
GRANT CREATE SESSION TO francis, jose;
GRANT UNLIMITED TABLESPACE TO francis, jose;
GRANT plm_developers TO francis, jose;

--Create 2 users (maria and josefa) and assign the role plm_testers
CREATE USER maria IDENTIFIED BY maria;
CREATE USER josefa IDENTIFIED BY josefa;
GRANT CREATE SESSION TO maria, josefa;
GRANT UNLIMITED TABLESPACE TO maria, josefa;
GRANT plm_testers TO maria, josefa;


--B.Database and table creation
--Create a user (PLM_INFO_SYSTEM) and assign the role plm_developers
CREATE USER plm_info_system IDENTIFIED BY plml234;
GRANT CREATE SESSION TO plm_info_system;
GRANT UNLIMITED TABLESPACE TO plm_info_system;
GRANT plm_developers TO plm_info_system;  


