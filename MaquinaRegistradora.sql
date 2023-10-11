drop table ventas;



drop table maquinasRegistradoras;



drop table productos;



drop table vendedores;







create table maquinasRegistradoras (



idMaquina number primary key,



piso number(2)



);







create table productos (



idProducto number primary key,



nombre varchar2(45),



precio number



);







create table vendedores(



idVendedor number primary key,



nombre varchar2(35),



apellidos varchar2(45),



ventas_idVentas number



);







create table ventas (



idVentas number primary key,



idProducto number,



idMaquina number,



idVendedor number



);







alter table ventas add constraint fk_producto foreign key (idProducto) references productos(idProducto);



alter table ventas add constraint fk_maquina foreign key (idMaquina) references maquinasRegistradoras(idMaquina);



alter table ventas add constraint fk_vendedor foreign key (idVendedor) references vendedores(idVendedor);







-- Restricciones



alter table maquinasRegistradoras



add constraint pisoIngresado



check (piso >= 1 AND piso <= 4);







alter table productos



add constraint nombreUnico



unique (nombre);











-- insert



insert into vendedores(idvendedor,nombre,apellidos) values



(1,'Luis','Valdes');



insert into vendedores(idvendedor,nombre,apellidos) values



(2,'Juan','Perez');



insert into vendedores(idvendedor,nombre,apellidos) values



(3,'Pedro','Duran');



insert into vendedores(idvendedor,nombre,apellidos) values



(4,'Maria','Ayala');



insert into vendedores(idvendedor,nombre,apellidos) values



(5,'Lucia','Duran');







insert into productos(idProducto,nombre,precio) values (1,'Arroz:



tucapel',950);



insert into productos(idProducto,nombre,precio) values (2,'Arroz:



Zaror',650);



insert into productos(idProducto,nombre,precio) values (3,'cafe:



nescafe',750);



insert into productos(idProducto,nombre,precio) values (4,'cafe:



Colombiano',690);



insert into productos(idProducto,nombre,precio) values (5,'cafe: Juan



Valdez',2470);



insert into productos(idProducto,nombre,precio) values (6,'Salsa de



tomate: DoÃ±a clara',790);



insert into productos(idProducto,nombre,precio) values (7,'Salsa de



tomate: carozzi',750);



insert into productos(idProducto,nombre,precio) values (8,'Te:



Club',850);



insert into productos(idProducto,nombre,precio) values (9,'Te:



Lipton',930);



insert into productos(idProducto,nombre,precio) values (10,'Galletas:



Costa',470);



insert into productos(idProducto,nombre,precio) values (11,'Galletas:



Salvado',520);



insert into productos(idProducto,nombre,precio) values (12,'Galletas:



Triton',760);



insert into productos(idProducto,nombre,precio) values (13,'Azucar:



iansa',986);



insert into productos(idProducto,nombre,precio) values (14,'Azucar:



Acuenta',300);



insert into productos(idProducto,nombre,precio) values (15,'Azucar:



Refinada',2950);



insert into productos(idProducto,nombre,precio) values (16,'Galletas:



ricalata',660);



insert into productos(idProducto,nombre,precio) values (17,'Aceite:



Miraflores',660);



insert into productos(idProducto,nombre,precio) values (18,'Aceite:



Belmontt',489);



insert into productos(idProducto,nombre,precio) values (19,'Aceite:



Acuenta',489);







insert into MaquinasRegistradoras(idmaquina,piso) values (1,2);



insert into MaquinasRegistradoras(idmaquina,piso) values (2,2);



insert into MaquinasRegistradoras(idmaquina,piso) values (3,2);



insert into MaquinasRegistradoras(idmaquina,piso) values (4,4);



insert into MaquinasRegistradoras(idmaquina,piso) values (5,4);



insert into MaquinasRegistradoras(idmaquina,piso) values (6,4);



insert into MaquinasRegistradoras(idmaquina,piso) values (7,3);



insert into MaquinasRegistradoras(idmaquina,piso) values (8,5);







insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(1,2,2,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(2,2,2,19);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(3,2,2,19);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(4,2,2,18);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(5,2,2,17);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(6,2,2,10);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(7,2,2,1);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(8,2,2,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(9,2,2,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(10,2,2,4);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(11,2,2,5);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(12,2,2,6);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(13,4,2,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(14,4,2,4);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(15,4,2,10);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(16,4,2,12);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(17,4,2,13);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(18,4,2,11);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(19,4,2,14);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(20,6,2,16);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(21,6,2,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(22,6,2,14);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(23,6,2,16);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(24,2,4,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(25,2,4,4);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(26,2,4,10);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(27,2,2,6);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(28,2,2,7);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(29,2,2,8);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(30,4,2,9);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(31,4,2,19);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(32,3,3,18);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(33,3,4,17);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(34,2,5,13);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(35,2,4,11);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(36,2,4,18);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(37,2,4,8);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(38,2,4,6);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(39,2,4,6);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(40,2,4,11);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(41,6,4,10);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(42,2,2,7);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(43,6,2,4);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(44,2,4,6);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(45,2,4,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(46,8,4,4);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(47,8,2,12);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(48,7,4,17);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(49,2,4,15);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(50,1,2,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(51,5,2,6);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(52,6,2,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(53,4,2,10);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(54,4,2,7);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(55,2,4,4);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(56,8,4,3);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(57,7,4,2);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(58,4,4,14);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(59,6,4,14);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(60,4,3,6);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(61,8,2,1);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(62,2,4,6);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(63,2,5,14);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(64,2,4,12);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(65,2,4,11);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(66,3,1,16);



insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values



(67,3,4,6);







-- Indices



create unique index NombresVendedores



on vendedores(nombre, apellidos);







create index NombreProductos



on productos(nombre, precio);







create index MaquinasRegistradoras



on maquinasregistradoras(piso, idMaquina);











-- Consultas



-- A. El producto más vendido



SELECT *



FROM (SELECT p.idProducto, p.Nombre, COUNT(V.idProducto) FROM Productos P LEFT JOIN Ventas V ON P.idProducto = V.idProducto GROUP BY p.idProducto, P.Nombre



ORDER BY COUNT(V.idProducto) DESC) where rownum = 1;







-- B. El número de ventas de cada producto, ordenado de más a menos



SELECT p.idProducto, count(v.idProducto) FROM productos p, ventas v



WHERE p.idProducto = v.idProducto



GROUP BY p.idProducto



ORDER BY count(v.idProducto) desc;







-- C. Obtener un informe completo de ventas, indicando el nombre del



-- cajero que realizó la venta, nombre y precios de los productos



-- vendidos y piso en el que se encuentra la máquina registradora donde



-- ser realizó.



SELECT distinct p.nombre, p.precio, m.idMaquina as "CAJERO", m.piso



FROM productos p, maquinasRegistradoras m, ventas v



WHERE v.idProducto = p.idProducto AND v.idMaquina = m.idMaquina;







-- D. Ventas totales realizadas en cada piso.



SELECT count(v.idMaquina), m.piso FROM ventas v, maquinasRegistradoras m



WHERE m.idMaquina = v.idMaquina AND m.piso = m.piso



GROUP BY m.piso;







-- E. Obtener el código y nombre de cada empleado junto con el total de



-- sus ventas.



SELECT ve.idVendedor, ve.nombre, count(v.idVendedor) FROM vendedores ve, ventas v



WHERE v.idVendedor = ve.idVendedor



GROUP BY ve.idVendedor, ve.nombre;







-- F. Obtener el código y nombre de aquellos vendedores que hayan



-- realizado ventas en pisos cuyas ventas totales sean inferiores a los



-- 28000.



SELECT distinct ve.idVendedor, ve.nombre FROM vendedores ve, ventas v



WHERE v.idVendedor = ve.idVendedor



AND v.idMaquina in (SELECT v.idMaquina FROM ventas v, maquinasRegistradoras m, productos p



WHERE m.idMaquina = v.idMaquina AND m.piso = m.piso AND p.idProducto = v.idProducto



GROUP BY v.idMaquina



HAVING sum(p.precio) < 28000



);