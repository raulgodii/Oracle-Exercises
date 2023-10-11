SET SERVEROUTPUT ON;

-- 3
DECLARE
  i int := 100;
BEGIN
  WHILE i > 0 LOOP
      dbms_output.put_line(i);
      i:=i-1;
  END LOOP;
END;

-- 4
DECLARE
  i int := 2;
BEGIN
  WHILE i <= 100 LOOP
      dbms_output.put_line(i);
      i:=i+2;
  END LOOP;
END;

-- 5
DECLARE
  i int := 1;
BEGIN
  WHILE i < 100 LOOP
      dbms_output.put_line(i);
      i:=i+2;
  END LOOP;
END;

-- 6
DECLARE
  SUMA INT := 0;
  I INT :=0;
BEGIN
  WHILE I <= 100 LOOP
    SUMA := SUMA +I;
    I := I +1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(SUMA);
END;

-- 7
DECLARE
  SUMA INT := 0;
  I INT :=0;
BEGIN
  WHILE I <= 100 LOOP
    SUMA := SUMA +I;
    I := I +2;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(SUMA);
END;

-- 8
DECLARE
  SUMA INT := 0;
  I INT :=1;
BEGIN
  WHILE I <= 100 LOOP
    SUMA := SUMA +I;
    I := I +2;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(SUMA);
END;

-- 9
DECLARE
  SUMA INT := 0;
  I INT :=1;
  CONT INT :=0;
BEGIN
  WHILE I <= 100 LOOP
    SUMA := SUMA +I;
    I := I +2;
    CONT := CONT +1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(SUMA);
  DBMS_OUTPUT.PUT_LINE('Hay ' || cont || ' numeros');
END;

-- 10
DECLARE
N1 INT := &Primer_numero;
N2 INT := &Segundo_numero;
i INT := N1;

BEGIN
  WHILE I <= N2 LOOP
    dbms_output.put_line(i);
    i := i+1;
  END LOOP;
END;

-- 12
SET SERVEROUTPUT ON;
DECLARE
  i int := 1;
  n1 int := &num1;
  n2 int := &num2;
BEGIN
  for i in n1..n2 loop
    if mod(i,2)=0 then dbms_output.put_line(i);
    end if;
  end loop;
END;


-- CURSORES
CREATE TABLE CUSTOMERS(
ID INT NOT NULL,
NAME VARCHAR (20) NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR (25),
SALARY DECIMAL (18, 2),
PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'Komal', 22, 'MP', 4500.00 );

DESCRIBE CUSTOMERS;
select * from customers;


DECLARE
  identificador customers.id%type := &Introduzca_id;
  nombre customers.id%type;
  edad customers.id%type;

BEGIN
  SELECT name,age INTO nombre,edad FROM customers WHERE id = identificador;
  dbms_ouput.put_line('El customer ' ||nombre|| ' tiene ' ||edad||);
END;

-- Realizar un cursor implicito que dada una edad nos devuleva el nombre
-- y direccion del customers. Controlar posibles errores

DECLARE
nombre customers.name%type;
direccion customers.address%type;
edad customers.age%type := &Introduzca_Edad;

BEGIN
  select name, address INTO nombre, direccion FROM customers WHERE age = edad;
  dbms_output.put_line('El customer ' ||nombre|| ' tiene ' ||edad);

  EXCEPTION
    WHEN no_data_found THEN dbms_output.put_line('No hay nadie con esa edad');
    WHEN too_many_rows THEN dbms_output.put_line('Mucha gente con esa edad');
END;

DECLARE
nombre customers.name%type;
direccion customers.address%type;
edad customers.age%type := &Introduzca_Edad;
CURSOR C_Edad IS SELECT name, address FROM customers WHERE age = edad;

BEGIN
  OPEN C_Edad;
  
  LOOP
    FETCH C_Edad INTO nombre, direccion;
    EXIT WHEN C_Edad%NOTFOUND;
    dbms_output.put_line('El customer ' ||nombre|| ' vive ' ||direccion);
  END LOOP;
  
  CLOSE C_Edad;

  EXCEPTION
    WHEN no_data_found THEN dbms_output.put_line('No hay nadie con esa edad');
END;

-- Realizar un cursor explicito sobre la tabla customers que devuelva toda la fila
-- de aquellos customers cuyo salario es superior a (introducir el usuario)
describe customers;
select * from customers;
DECLARE
  id customers.id%type;
  nombre customers.name%type;
  edad customers.age%type;
  direccion customers.address%type;
  salario customers.salary%type;
  buscar customers.salary%type := &Salario;
  
  CURSOR C_SALARIO IS SELECT * FROM customers WHERE salary > buscar;

BEGIN
  OPEN C_SALARIO;
    LOOP
      FETCH C_SALARIO INTO id,nombre,edad,direccion,salario;
      EXIT WHEN C_SALARIO%NOTFOUND;
      dbms_output.put_line('ID: ' ||id|| ', Nombre: ' ||nombre|| ', Edad: ' ||edad|| ', Direccion: ' ||direccion|| ', Salario: ' ||salario);
    END LOOP;
  CLOSE C_SALARIO;
END;


/* 1.- Construya una función llamada nombre PL/SQL que pida al usuario su nombre 
por teclado y que posteriormente lo visualice de la siguiente forma "El nombre introducido es: NOMBRE". */ 
SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION NOMBRE(v_nombre IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('El nombre introducido es: ' || v_nombre);
  RETURN V_NOMBRE;
END;

/* 2.- Construya un procedimiento PL/SQL que pida por teclado el dni de la persona 
y que posteriormente se muestre el nombre y la edad de la persona correspondiente. Controla las posibles excepciones */ 
CREATE TABLE personas ( dni VARCHAR2(9) PRIMARY KEY, nombre VARCHAR2(15), apellidos VARCHAR2(15), edad NUMBER ); -- Inserción de datos
INSERT INTO personas(dni,nombre,apellidos,edad) VALUES ('11','Juan','Álvarez',18); 
INSERT INTO personas(dni,nombre,apellidos,edad) VALUES ('22','José','Jiménez',22); 
INSERT INTO personas(dni,nombre,apellidos,edad) VALUES ('33','María','Pérez',35); 
INSERT INTO personas(dni,nombre,apellidos,edad) VALUES ('44','Elena','Martínez',20); 

SELECT * FROM PERSONAS;

CREATE OR REPLACE PROCEDURE obtener_persona(v_dni personas.dni%type) IS
  v_nombre personas.nombre%type;
  v_edad personas.edad%type;
BEGIN
  SELECT nombre, edad INTO v_nombre, V_EDAD
  FROM personas
  WHERE dni = v_dni;
  
  DBMS_OUTPUT.PUT_LINE('La persona con DNI ' ||v_dni|| ' se llama ' ||v_nombre|| ' y tiene ' ||v_edad|| ' años.' );
  
  EXCEPTION
  WHEN no_data_found THEN 
    dbms_output.put_line('No hay nadie con ese DNI');
  WHEN OTHERS THEN
    dbms_output.put_line('Ha ocurrido un error: ' || sqlerrm);
END;

DECLARE
  dni_personas personas.dni%type := &Introduce_un_valor;
BEGIN
  obtener_persona(dni_personas);
END;


-- Realizar un procedimiento que dada una edad devuelva el nombre y la edad de las personas mayores a esa edad 
-- y en V_NUMERO el numero de personas que cumplen la condicion
CREATE OR REPLACE PROCEDURE obtener_persona_EDAD(v_edad personas.edad%type, v_numero OUT NUMBER) IS

  CURSOR C_EDAD IS SELECT
BEGIN

END;


create table dept(  
  deptno     number(2,0),  
  dname      varchar2(14),  
  loc        varchar2(13),  
  constraint pk_dept primary key (deptno)  
);


create table emp(  
  empno    number(4,0),  
  ename    varchar2(10),  
  job      varchar2(9),  
  mgr      number(4,0),  
  hiredate date,  
  sal      number(7,2),  
  comm     number(7,2),  
  deptno   number(2,0),  
  constraint pk_emp primary key (empno),  
  constraint fk_deptno foreign key (deptno) references dept (deptno)  
);


insert into DEPT (DEPTNO, DNAME, LOC)
values(10, 'ACCOUNTING', 'NEW YORK');

insert into dept  
values(20, 'RESEARCH', 'DALLAS');

insert into dept  
values(30, 'SALES', 'CHICAGO');

insert into dept  
values(40, 'OPERATIONS', 'BOSTON');

-- Insert EMP row, using TO_DATE function to cast string literal into an oracle DATE format.
insert into emp  
values(  
 7839, 'KING', 'PRESIDENT', null,  
 to_date('17-11-1981','dd-mm-yyyy'),  
 5000, null, 10  
);

insert into emp  
values(  
 7698, 'BLAKE', 'MANAGER', 7839,  
 to_date('1-5-1981','dd-mm-yyyy'),  
 2850, null, 30  
);

insert into emp  
values(  
 7782, 'CLARK', 'MANAGER', 7839,  
 to_date('9-6-1981','dd-mm-yyyy'),  
 2450, null, 10  
);

insert into emp  
values(  
 7566, 'JONES', 'MANAGER', 7839,  
 to_date('2-4-1981','dd-mm-yyyy'),  
 2975, null, 20  
);

insert into emp  
values(  
 7788, 'SCOTT', 'ANALYST', 7566,  
 to_date('13-JUL-87','dd-mm-rr') - 85,  
 3000, null, 20  
);
insert into emp  
values(  
 7902, 'FORD', 'ANALYST', 7566,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 3000, null, 20  
);

insert into emp  
values(  
 7369, 'SMITH', 'CLERK', 7902,  
 to_date('17-12-1980','dd-mm-yyyy'),  
 800, null, 20  
);

insert into emp  
values(  
 7499, 'ALLEN', 'SALESMAN', 7698,  
 to_date('20-2-1981','dd-mm-yyyy'),  
 1600, 300, 30  
);

insert into emp  
values(  
 7521, 'WARD', 'SALESMAN', 7698,  
 to_date('22-2-1981','dd-mm-yyyy'),  
 1250, 500, 30  
);

insert into emp  
values(  
 7654, 'MARTIN', 'SALESMAN', 7698,  
 to_date('28-9-1981','dd-mm-yyyy'),  
 1250, 1400, 30  
);

insert into emp  
values(  
 7844, 'TURNER', 'SALESMAN', 7698,  
 to_date('8-9-1981','dd-mm-yyyy'),  
 1500, 0, 30  
);

insert into emp  
values(  
 7876, 'ADAMS', 'CLERK', 7788,  
 to_date('13-JUL-87', 'dd-mm-rr') - 51,  
 1100, null, 20  
);

insert into emp  
values(  
 7900, 'JAMES', 'CLERK', 7698,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 950, null, 30  
);

insert into emp  
values(  
 7934, 'MILLER', 'CLERK', 7782,  
 to_date('23-1-1982','dd-mm-yyyy'),  
 1300, null, 10  
);
-- Realizar una función que se le pase un número de departamento y devuelva el 
-- número de empleados que tiene dicho departamento
-- numero_empleados si el departamento no existe que devuelva un -1
select * from emp;
select * from dept;

CREATE OR REPLACE FUNCTION numero_empleados(n_departamento EMP.DEPTNO%TYPE) RETURN INT IS
  N INT := 0;
BEGIN
  SELECT count(*) INTO N FROM emp WHERE deptno=n_departamento;
  if n=0 then
    n :=-1;
  end if;
  return n;
END;

DECLARE
  nDep emp.deptno%type := &introduce;
  n int;
BEGIN
  n := numero_empleados(nDep);
  dbms_output.put_line('El numero de empleados es ' || n);
END;


-- Realizar un procedimiento que se llame empleado_minimo_salario(job,empno1,empno2)
-- dado un trabajo devuelva el codigo de los empleados que cobran menos en ese trabajo
CREATE OR REPLACE PROCEDURE empleado_minimo_salario(job emp.job%type, empno1.empno%type, empno2.empno%type) IS
BEGIN
END;

-- TRIGGERS
DROP TABLE classified_table;
CREATE TABLE classified_table(descripcion varchar2(500));
select * from personas;
DESCRIBE CLASSIFIED_TABLE;

CREATE OR REPLACE TRIGGER audit_trigger BEFORE INSERT OR DELETE OR UPDATE
ON personas FOR EACH ROW
BEGIN
  IF INSERTING THEN
      INSERT INTO classified_table VALUES (USER || ' is inserting' || ' new key: ' || :new.dni);
    
    ELSIF DELETING THEN
      INSERT INTO classified_table VALUES (USER || ' is deleting' || ' old key: ' || :old.dni);
    
    ELSIF UPDATING('Nombre') THEN
      INSERT INTO classified_table VALUES (USER || ' is updating' || ' old formula: ' || :old.nombre || ' new formula: ' || :new.nombre);
    
    ELSIF UPDATING THEN
      INSERT INTO classified_table VALUES (USER || ' is updating' || ' old key: ' || :old.dni || ' new key: ' || :new.dni);
  END IF;
END; 

INSERT INTO personas(dni,nombre,apellidos,edad) VALUES ('67','Maria','Jimenez',150);
DELETE PERSONAS WHERE DNI='66';
UPDATE PERSONAS SET NOMBRE='MARadfIAa' WHERE DNI='11';
UPDATE PERSONAS SET DNI='66' WHERE DNI='33';

select * from personas;
select * from classified_table;

-- Realizar un trigger sobre la tabla personas que se llama tr_edad, que compruebe que al insertar
-- una nueva personas o al actualizar la edad de una persona sea inferior a 120 años. Si es mayor, genera un error.

CREATE OR REPLACE TRIGGER tr_edad BEFORE INSERT OR UPDATE
ON personas FOR EACH ROW
BEGIN
  IF :new.edad > 120 THEN 
    INSERT INTO classified_table VALUES (USER || ' ha intentado introducir una edad inválida');
    dbms_output.put_line('Edad supera el limite');
  END IF;
END;

 
 --CLUB DE BARRIO
create table socios(
documento char(8) not null,
nombre varchar(30),
domicilio varchar(30),
constraint PK_socios primary key (documento)
);
create table inscritos(
documento char(8) not null,
deporte varchar(30) not null,
matricula char(1),
constraint CK_inscritos check (matricula in ('s','n')),
constraint PK_inscritos primary key (documento,deporte),
constraint FK_inscritos_documento foreign key(documento)
references socios (documento)
);

create table morosos(
documento char(8) not null
);
insert into socios values ('22222222','Ana Acosta','Avellaneda 800');
insert into socios values ('23333333','Bernardo Bustos','Bulnes 234');
insert into socios values ('24444444','Carlos Caseros','Colon 321');
insert into socios values ('25555555','Mariana Morales','Maipu 483');
insert into inscritos values ('22222222','tenis','s');
insert into inscritos values ('22222222','natacion','n');
insert into inscritos values ('23333333','tenis','n');
insert into inscritos values ('24444444','tenis','s');
insert into inscritos values ('24444444','futbol','s');
insert into morosos values ('22222222');
insert into morosos values ('23333333');

/*1.Cree un disparador de inserción que no permita ingresar inscripciones si el
socio es moroso.*/
create or replace trigger denegarInscripcion before insert on inscritos for each row
declare 
algo int:=0;
moroso_Documento morosos.documento%type;
BEGIN
  select count(*)into algo from morosos where documento=:new.documento;
  --select documento into moroso_Documento from morosos where documento=:new.documento;
  if algo<>0 then
  raise_application_error(-20000,'errorasdasd');
end if;
end;
select count(*) from morosos where documento='24444444';

insert into inscritos values('22222222','loquesea','s');


/*2.Cree otro "insert trigger" para "inscritos" que ingrese el socio en la tabla
"morosos" si no ha pagado la matricula*/

create or replace trigger mover_a_morosos before insert on inscritos for each row
begin
   if :new.matricula='n' then
    insert into morosos values(:new.documento);
  end if;
  end;
  
  insert into inscritos values('24444444','algo','n');
  select * from morosos;
select * from socios;
select * from inscritos;
/*3. Creamos un disparador sobre la tabla "socios" para que no permita ingresar
nuevos*/

create or replace trigger no_permitir_ingresar before insert on socios for each row
begin
  raise_application_error(-20000,'NO ESTA PERMITIDO INSERTAS MAS SOCIOS, LARGATE A OTRO CLUB');
end;
insert into socios values('22224444','asere','c alguna');

select * from morosos;
select * from socios;
select * from inscritos;

-- Realizar un trigger sobre la tabla inscritos para que una vez que se modifique 
-- la matricula y se haya pagado la actividad, compruebe que el socio no sea moroso 
-- y lo borre de la tabla morosos
-- pragma autonomous_transaction;
CREATE OR REPLACE TRIGGER tr_morosos AFTER UPDATE ON inscritos FOR EACH ROW
DECLARE
N INT := 0;
BEGIN
  SELECT count documento INTO N FROM inscritos
  WHERE documento = :NEW.documento and matricula = 'n';
  IF N = 0 THEN
    DELETE FROM morosos WHERE documento = :NEW.documento;
  END IF;
END;
 
 update inscritos set matricula = 's' where documento = '22222222';
 describe morosos;
 describe inscritos;
 
-- EJERCICIOS / 5. Relacion trigger / Ejercicio 1 - EMPRESA

create table secciones(
 codigo int,
 nombre varchar(30),
 sueldomaximo decimal(8,2),
 constraint PK_secciones primary key(codigo)
 );
 create table empleados(
 documento char(8) not null,
 nombre varchar(30) not null,
 domicilio varchar(30),
 codigoseccion int not null,
 sueldo decimal(8,2),
 constraint PK_empleados primary key(documento),
 constraint FK_empelados_seccion
 foreign key (codigoseccion) references secciones(codigo)
 );
 insert into secciones values(1,'Administracion',1500);
 insert into secciones values(2,'Sistemas',2000);
 insert into secciones values(3,'Secretaria',1000);
 insert into empleados values('22222222','Ana Acosta','Avellaneda 88',1,1100);
 insert into empleados values('23333333','Bernardo Bustos','Bulnes 345',1,1200);
 insert into empleados values('24444444','Carlos Caseres','Colon 674',2,1800);
 insert into empleados values('25555555','Diana Duarte','Colon 873',3,1000);
-- Cree un disparador para que se ejecute cada vez que una instrucción "insert" ingrese datos en
-- "empleados"; el mismo debe verificar que el sueldo del empleado no sea mayor al sueldo
-- máximo establecido para la sección, si lo es, debe mostrar un mensaje indicando tal situación
-- y deshacer la transacción. 

CREATE OR REPLACE TRIGGER tr_transaccion BEFORE INSERT ON empleados FOR EACH ROW
DECLARE
  v_sueldo_maximo secciones.sueldomaximo%TYPE;
BEGIN
  SELECT sueldomaximo INTO v_sueldo_maximo
  FROM secciones, empleados
  WHERE codigo=codigoseccion and codigo = :NEW.codigoseccion;

  IF :NEW.sueldo > v_sueldo_maximo THEN
    RAISE_APPLICATION_ERROR(-20001, 'El sueldo del empleado excede el sueldo máximo de la sección.');
  END IF;
END;

insert into empleados values('26666666','David Quirante','Colon 855',3,1400);

drop table empleados;
CREATE TABLE empleados
(dni char(4) PRIMARY KEY,
nomemp varchar2(15),
mgr char(4),
salario integer DEFAULT 1000,
usuario varchar2(15),
fecha date );
ALTER TABLE EMPLEADOS ADD(FOREIGN KEY (mgr) REFERENCES empleados (DNI) );

insert into empleados values('22222222','Ana Acosta','Avellaneda 88',1,1100);
 insert into empleados values('23333333','Bernardo Bustos','Bulnes 345',1,1200);
 insert into empleados values('24444444','Carlos Caseres','Colon 674',2,1800);
 insert into empleados values('25555555','Diana Duarte','Colon 873',3,1000); 

select * from empleados;
describe empleados;
/*
Crear un trigger sobre la tabla EMPLEADOS para que no se permita que un empleado sea
jefe (MGR) de más de cinco empleados.
*/
CREATE OR REPLACE TRIGGER JEFES ON empleados BEFORE UPDATE OR INSERT FOR EACH ROW
DECLARE
BEGIN
END;

CREATE OR REPLACE FUNCTION NUM_JEFES(docu empleados.dni%type) return int IS
num int := 0;
BEGIN
  select count(dni) into num from empleados
  where mgr = docu;
END;

/*
Crear un trigger para impedir que se aumente el salario de un empleado en más de un 20%.
• Es necesario comparar los valores :old.salario y
:new.salario cada vez que se modifica el atributo salario
(BEFORE UPDATE). 
*/

create or replace
TRIGGER aumentar_salario BEFORE UPDATE ON empleados FOR EACH ROW
BEGIN
  IF (:new.SALARIO) > (:old.SALARIO*1.2) THEN
    raise_application_error(-20000, 'El salario es mayor al salario permitido');
  END IF;
END;

update empleados set SALARIO=6000 where documento = '22222222';


CREATE TABLE empleados_baja
(dni char(4) PRIMARY KEY,
nomemp varchar2(15),
mng char(4),
salario integer,
usuario varchar2(15),
fecha date ); 

/*
Crear un trigger que inserte una fila en la tabla
empleados_baja cuando se borre una fila en la tabla
empleados.
• Los datos que se insertan son los correspondientes al
empleado que se da de baja en la tabla empleados, salvo en
las columnas usuario y fecha se grabarán las variables del
sistema USER y SYSDATE que almacenan el usuario y
fecha actual.
• El comando que dispara el trigger es AFTER DELETE
*/

CREATE OR REPLACE TRIGGER tr_insertar AFTER DELETE ON empleados FOR EACH ROW
BEGIN
  INSERT INTO empleados_baja VALUES(:OLD.dni, :OLD.nomemp, :OLD.mgr, :OLD.SALARIO, USER, SYSDATE);
END;