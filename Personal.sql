CREATE TABLESPACE ts_Personal
DATAFILE 'C:\df_Personal'
SIZE 100M
AUTOEXTEND ON;

CREATE USER Personal IDENTIFIED BY password
DEFAULT TABLESPACE ts_Personal;

GRANT ALL PRIVILEGES TO Personal;

DROP TABLE CENTROS;
CREATE TABLE CENTROS(
NNUMCEN NUMBER(2) PRIMARY KEY,
CNOMCEN VARCHAR2(30),
CDIRCEN VARCHAR2(30)
);

DROP TABLE DPTOS;
CREATE TABLE DPTOS(
  NNUMDPT NUMBER(3) PRIMARY KEY,
  NNUMCEN NUMBER(2),
  NDIRDPT NUMBER(3),
  CTIPDIR VARCHAR2(1),
  NPREDPT NUMBER(10,2),
  NDPTJEF NUMBER(3),
  CNOMDPT VARCHAR2(30),
  FOREIGN KEY (NNUMCEN) REFERENCES CENTROS(NNUMCEN)
);

DROP TABLE EMPL;
CREATE TABLE EMPL(
  NCODEMPL NUMBER(3) PRIMARY KEY,
  NNUMDPT NUMBER(3),
  NEXTTEF NUMBER(3),
  DFECNAC DATE,
  DFECCING DATE,
  NSALEMPL NUMBER(10,2),
  NCOMEMPL NUMBER(5,2),
  NHIJEMPL NUMBER(2),
  CNOMEMPL VARCHAR2(30),
  FOREIGN KEY (NNUMDPT) REFERENCES DPTOS(NNUMDPT)
);

ALTER TABLE Dptos ADD CONSTRAINT CK_Dptos_TipDir CHECK
(cTipDir IN ('P','F')); COMMIT;
INSERT INTO Centros Values (10,'SEDE CENTRAL','C/ ALCALA 820, MADRID');
INSERT INTO Centros Values (20,'RELACION CON CLIENTES','C/ ATOCHA 405, MADRID');
COMMIT;
--NOTA : El presupuesto va en miles de euros.
INSERT INTO Dptos Values (100,10,260,'P',12,NULL,'DIRECCION GENERAL');
INSERT INTO Dptos Values (110,20,180,'P',15,100,'DIRECC. COMERCIAL');
INSERT INTO Dptos Values (111,20,180,'F',11,110,'SECTOR INDUSTRIAL');
INSERT INTO Dptos Values (112,20,270,'P',9, 100,'SECTOR SERVICIOS');
INSERT INTO Dptos Values (120,10,150,'F',3, 100,'ORGANIZACION');
INSERT INTO Dptos Values (121,10,150,'P',2, 120,'PERSONAL');
INSERT INTO Dptos Values (122,10,350,'P',6, 120,'PROCESO DE DATOS');
INSERT INTO Dptos Values (130,10,310,'P',2, 100,'FINANZAS');
COMMIT;
INSERT INTO Empl Values (110,121,350,'10/11/1939','10/02/1950',1310,Null,3,'PONS, CESAR'); INSERT
INTO Empl Values (120,112,840,'09/06/1945','01/10/1968',1350,110, 1,'LASA, MARIO'); INSERT INTO
Empl Values (130,112,810,'09/11/1955','01/02/1969',1290,110, 2,'TEROL, LUCIANO'); INSERT INTO
Empl Values (150,121,340,'10/08/1940','15/01/1948',1440,Null,0,'PEREZ, JULIO'); INSERT INTO Empl
Values (160,111,740,'09/07/1949','11/11/1968',1310,110, 2,'AGUIRRE, AUREO'); INSERT INTO Empl
Values (180,110,508,'18/10/1944','18/03/1956',1480,50, 2,'PEREZ, MARCOS');
INSERT INTO Empl Values (190,121,350,'12/05/1942','11/02/1962',1300,Null,4,'VEIGA, JULIANA');
INSERT INTO Empl Values (210,100,200,'28/09/1950','22/01/1959',1380,Null,2,'GALVEZ, PILAR');
INSERT INTO Empl Values (240,111,760,'26/02/1952','24/02/1966',1280,100, 3,'SANZ, LAVINIA');
INSERT INTO Empl Values (250,100,250,'27/10/1956','01/03/1967',1450,Null,0,'ALBA, ADRIANA');
INSERT INTO Empl Values (260,100,220,'03/12/1953','12/07/1968',1720,Null,6,'LOPEZ, ANTONIO');
INSERT INTO Empl Values (270,112,800,'21/05/1955','10/09/1966',1380,80, 3,'GARCIA, OCTAVIO');
INSERT INTO Empl Values (280,130,410,'11/01/1958','08/10/1971',1290,Null,5,'FLOR, DOROTEA');
INSERT INTO Empl Values (285,122,620,'25/10/1959','15/02/1968',1380,Null,0,'POLO, OTILIA');
INSERT INTO Empl Values (290,120,910,'30/11/1957','14/02/1968',1270,Null,3,'GIL, GLORIA');
INSERT INTO Empl Values (310,130,480,'21/11/1956','15/01/1971',1420,Null,0,'GARCIA, AUGUSTO');
INSERT INTO Empl Values (320,122,620,'25/12/1967','05/02/1978',1405,Null,2,'SANZ, CORNELIO');
INSERT INTO Empl Values (330,112,850,'19/08/1958','01/03/1972',1280,90, 0,'DIEZ, AMELIA');
INSERT INTO Empl Values (350,122,610,'13/04/1959','10/09/1984',1450,Null,1,'CAMPS, AURELIO');
INSERT INTO Empl Values (360,111,750,'29/10/1958','10/10/1968',1250,100, 2,'LARA, DORINDA');
INSERT INTO Empl Values (370,121,360,'22/06/1977','20/01/1987',1190,Null,1,'RUIZ, FABIOLA');
INSERT INTO Empl Values (380,112,880,'30/03/1978','01/01/1988',1180,Null,0,'MARTIN, MICAELA');
INSERT INTO Empl Values (390,110,500,'19/02/1976','08/10/1986',1215,Null,1,'MORAN, CARMEN');
INSERT INTO Empl Values (400,111,780,'18/08/1979','01/11/1987',1185,Null,0,'LARA, LUCRECIA');
INSERT INTO Empl Values (410,122,660,'14/07/1978','13/10/1988',1175,Null,0,'MUÑOZ, AZUCENA');
INSERT INTO Empl Values (420,130,450,'22/10/1976','19/11/1988',1400,Null,0,'FIERRO, CLAUDIA');
INSERT INTO Empl Values (430,122,650,'26/10/1977','19/11/1988',1210,Null,1,'MORA, VALERIANA');
INSERT INTO Empl Values (440,111,760,'27/09/1976','28/02/1986',1210,100, 0,'DURAN, LIVIA');
INSERT INTO Empl Values (450,112,880,'21/10/1976','28/02/1986',1210,100, 0,'PEREZ, SABINA');
INSERT INTO Empl Values (480,111,760,'04/04/1975','28/02/1986',1210,100, 1,'PINO, DIANA');
INSERT INTO Empl Values (490,112,880,'06/06/1974','01/01/1988',1180,100, 0,'TORRES, HORACIO');
INSERT INTO Empl Values (490,112,880,'06/06/1974','01/01/1988',1180,100, 0,'TORRES, HORACIO');
INSERT INTO Empl Values (500,111,750,'08/10/1975','01/01/1987',1200,100, 0,'VAZQUEZ,
HONORIA'); INSERT INTO Empl Values (510,110,550,'04/05/1976','01/11/1986',1200,Null,1,'CAMPOS,
ROMULO'); INSERT INTO Empl Values (550,111,780,'10/01/1980','21/01/1988',1100,120, 0,'SANTOS,
SANCHO'); COMMIT;
Select * From Centros;
Select * From Dptos;
Select * From Empl;


-- 1. Lista de tablas del esquema
select table_name
from all_tables
where owner = 'PERSONAL';

-- 2. Lista de restricciones del esquema, indicando al menos, nombre de la restricción y tipo de restricción (descrito).
SELECT constraint_name, constraint_type
FROM all_constraints
where owner = 'PERSONAL';

-- 1. Hallar la comisión, el nombre y el salario de los empleados con más de tres hijos, ordenados por comisión y, dentro de comisión, alfabéticamente.
SELECT NCOMEMPL, CNOMEMPL, NSALEMPL, NHIJEMPL
FROM EMPL 
WHERE NHIJEMPL>3
ORDER BY NCOMEMPL ASC;

-- 2. Obtener los nombres de los departamentos que no dependen de otros.
SELECT cnomDPT 
FROM DPTOS 
WHERE NDPTJEF IS NULL;

-- 3. Obtener, por orden alfabético, los nombres y los salarios de los empleados cuyo salario está comprendido entre 250 y 300 euros.
SELECT CNOMEMPL, NSALEMPL 
FROM EMPL
WHERE NSALEMPL BETWEEN 240 AND 300
ORDER BY CNOMEMPL ASC;

-- 4. Datos de los empleados que cumplen la condición anterior o tienen al menos un hijo.
SELECT CNOMEMPL, NSALEMPL 
FROM EMPL
WHERE (NSALEMPL BETWEEN 240 AND 300) OR (NHIJEMPL>1)
ORDER BY CNOMEMPL ASC;

-- 5. Muestre para cada empleado el número de meses que lleva el empleado en la empresa junto con su nombre.
SELECT CNOMEMPL, ROUND(MONTHS_BETWEEN(SYSDATE, DFECCING)) AS MESES
FROM EMPL
ORDER BY MESES;

-- 6. Calcule aquellos empleados que llevan más de 5 años en la empresa. Muestre todos los datos de cada uno de ellos
SELECT * FROM EMPL WHERE MONTHS_BETWEEN(SYSDATE, DFECCING)>60;

-- 7. Hallar, por orden alfabético, los nombres de los empleados tales que si se les da una gratificación de 10 euros por hijo, 
  -- el total de esta gratificación no supera la décima parte del salario.
SELECT CNOMEMPL, NHIJEMPL*10 AS Gratificacion , NSALEMPL/10 AS Salario10
FROM EMPL WHERE NHIJEMPL*10<NSALEMPL/10 ORDER BY CNOMEMPL ASC;

-- 8. Hallar, por orden de número de empleado, el nombre y el salario total (salario más comisi—n) de los empleados 
  -- cuyo salario total supera las 300 euros mensuales.
SELECT NCODEMPL, CNOMEMPL, NSALEMPL+NCOMEMPL AS Salario_Total
FROM EMPL
WHERE NSALEMPL+NCOMEMPL>300;
  
-- 9. Obtener, por orden alfabético, los nombres de los departamentos que no contengan la palabra Dirección ni Sector.
SELECT CNOMDPT
FROM DPTOS
WHERE CNOMDPT NOT LIKE '%DIRECCION%' AND CNOMDPT NOT LIKE '%SECTOR%'
ORDER BY CNOMDPT ASC;

-- 10. Obtener, por orden alfabético, los nombres de los departamentos que, o bien tienen directores 
  -- en funciones o bien en propiedad y su presupuesto no excede los 5 millones o bien no dependen de ningún otro.
SELECT * FROM DPTOS;
SELECT CNOMDPT, CTIPDIR, NPREDPT
FROM DPTOS
WHERE CTIPDIR IN('P', 'F') AND NPREDPT<5000
ORDER BY CNOMDPT ASC;

-- 11. Hallar el número de empleados de toda la empresa.
SELECT DISTINCT COUNT(*) AS N_EMPL
FROM EMPL;

-- 12. Hallar cuántos departamentos hay y el presupuesto anual medio de la empresa para el global de todos los departamentos.
SELECT * FROM DPTOS;
SELECT COUNT(*), AVG(NPREDPT)
FROM DPTOS;

-- 13. Hallar el número de empleados y de extensiones telefónicas del departamento 112.
SELECT * FROM EMPL ORDER BY NNUMDPT;
SELECT COUNT(CNOMEMPL) AS N_EMPL, SUM(NEXTTEF)
FROM EMPL
WHERE NNUMDPT = 112;

-- 14. Idem para los departamentos que no tienen director en propiedad.
SELECT * FROM DPTOS;
SELECT COUNT(CNOMEMPL) AS N_EMPL, SUM(NEXTTEF)
FROM EMPL, DPTOS
WHERE EMPL.NNUMDPT = DPTOS.NNUMDPT
AND NDIRDPT IS NOT NULL;

-- 15. Datos de los empleados que trabajan en el centro con dirección en calle Atocha y tienen dos hijos exactamente. No use Select anidados.
SELECT * FROM EMPL;
SELECT * FROM CENTROS;
SELECT EMPL.* 
FROM EMPL, CENTROS, DPTOS
WHERE EMPL.NNUMDPT = DPTOS.NNUMDPT AND DPTOS.NNUMCEN = CENTROS.NNUMCEN AND CENTROS.CDIRCEN = '%ATOCHA%' AND NHIJEMPL = 2;

-- 16. Extraiga los nombres de las parejas de empleados que trabajan en el mismo centro y tienen los mismos ingresos como salario base. No use Select anidados. Saque también el salario.
-- 17. Utilice las operaciones de conjuntos para extraer los códigos de los departamentos que no hacen de departamento jefe
-- 18. Idem pero que s’ hacen de departamento jefe.
-- 19. Extraiga un listado donde aparezca el código de los departamentos y su nombre conjuntamente con el código de los centros y su nombre.
-- 20. Utilice las operaciones de conjuntos para solventar la consulta número 4.

