DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;

CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);

CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);

CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);

INSERT INTO clientes VALUES(1, 'Aarón', 'Rivero', '20-4148122-1', 'Garuhape', 100);
INSERT INTO clientes VALUES(2, 'Adela', 'Salas', '27-42482596-3', 'Capiovi', 200);
INSERT INTO clientes VALUES(3, 'Adolfo', 'Rubio', '23-37928596-3', 'Posadas', NULL);
INSERT INTO clientes VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO clientes VALUES(5, 'Marcos', 'Loyola', '24-42481327-3', 'Posadas', 200);
INSERT INTO clientes VALUES(6, 'María', 'Santana', '27-38771523-1', 'Obera', 100);
INSERT INTO clientes VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO clientes VALUES(8, 'Pepe', 'Ruiz', '20-27436152-2', 'Iguazu', 200);
INSERT INTO clientes VALUES(9, 'Guillermo', 'López', '20-42481328-1', 'Andresito', 225);
INSERT INTO clientes VALUES(10, 'Daniel', 'Santana', '20-40159624-3', 'Apostoles', 125);
INSERT INTO vendedores VALUES(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15);
INSERT INTO vendedores VALUES(2, 'Juan', 'Gómez', '20-39231523-3', 0.13);
INSERT INTO vendedores VALUES(3, 'Diego','Flores', '20-38481221-3', 0.11);
INSERT INTO vendedores VALUES(4, 'Marta','Herrera', '27-40481736-1', 0.14);
INSERT INTO vendedores VALUES(5, 'Antonia','Carretero', '20-31481370-7', 0.12);
INSERT INTO vendedores VALUES(6, 'Manuel','Domínguez', '20-29876342-3', 0.13);
INSERT INTO vendedores VALUES(7, 'Antonio','Vega', '20-32521596-3', 0.11);
INSERT INTO vendedores VALUES(8, 'Alfredo','Ruiz', '20-42436477-3', 0.05);
INSERT INTO pedidos VALUES(1, 150.5, '2020-10-05', 5, 2);
INSERT INTO pedidos VALUES(2, 270.65, '2019-09-10', 1, 5);
INSERT INTO pedidos VALUES(3, 65.26, '2022-10-05', 2, 1);
INSERT INTO pedidos VALUES(4, 110.5, '2021-08-17', 8, 3);
INSERT INTO pedidos VALUES(5, 948.5, '2021-09-10', 5, 2);
INSERT INTO pedidos VALUES(6, 2400.6, '2021-07-27', 7, 1);
INSERT INTO pedidos VALUES(7, 5760, '2018-09-10', 2, 1);
INSERT INTO pedidos VALUES(8, 1983.43, '2021-10-10', 4, 6);
INSERT INTO pedidos VALUES(9, 2480.4, '2019-10-10', 8, 3);
INSERT INTO pedidos VALUES(10, 250.45, '2018-06-27', 8, 2);
INSERT INTO pedidos VALUES(11, 75.29, '2021-08-17', 3, 7);
INSERT INTO pedidos VALUES(12, 3045.6, '2022-04-25', 2, 1);
INSERT INTO pedidos VALUES(13, 545.75, '2022-01-25', 6, 1);
INSERT INTO pedidos VALUES(14, 145.82, '2022-02-02', 6, 1);
INSERT INTO pedidos VALUES(15, 370.85, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(16, 2389.23, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(17, 275.93, '2021-08-17', 2, 5);
INSERT INTO pedidos VALUES(18, 328.34, '2021-08-17', 1, 3);
INSERT INTO pedidos VALUES(19, 1838.66, '2020-03-19', 3, 4);
INSERT INTO pedidos VALUES(20, 2598.23, '2020-05-21', 5, 1);


-- SELECT e.apellido FROM sistema.empleados as e;

-- 1 
SELECT * 
FROM pedidos 
ORDER BY fecha;
-- 2 
SELECT * 
FROM pedidos 
ORDER BY cantidad LIMIT 2;
-- 3
SELECT clientes.id, clientes.nombre, clientes.apellido 
FROM clientes JOIN pedidos 
where clientes.id = pedidos.id_cliente GROUP BY clientes.id;
-- 4
SELECT * 
FROM pedidos 
WHERE fecha > "2022-01-01" AND cantidad > 500;
-- 5 
SELECT * 
FROM vendedores 
WHERE comisión BETWEEN 0.05 AND 0.11;
-- 6 
SELECT MAX(comisión) 
FROM vendedores;
-- 7 
SELECT clientes.id, clientes.nombre, clientes.apellido 
FROM clientes 
WHERE cuitcuil 
ORDER BY  clientes.apellido, clientes.nombre;
-- 8 
SELECT * 
FROM clientes 
WHERE clientes.nombre LIKE "A%n" OR clientes.nombre LIKE "P%" 
ORDER BY  clientes.apellido, clientes.nombre;
-- 9
SELECT * 
FROM clientes 
WHERE clientes.nombre LIKE "A%" 
ORDER BY  clientes.apellido, clientes.nombre;
-- 10
SELECT * 
FROM vendedores 
WHERE vendedores.nombre LIKE "%el" or vendedores.nombre LIKE "%o" 
GROUP BY vendedores.nombre;
-- 11
SELECT clientes.id, clientes.nombre, clientes.apellido 
FROM clientes JOIN pedidos on clientes.id = pedidos.id_cliente  
GROUP BY clientes.id 
ORDER BY clientes.apellido;
-- 12
SELECT * 
FROM pedidos JOIN clientes ON pedidos.id_cliente = clientes.id 
ORDER BY clientes.apellido;
-- 13
SELECT * 
FROM pedidos JOIN vendedores  ON pedidos.id_vendedor = vendedores.id 
ORDER BY vendedores.apellido;
-- 14
SELECT * 
FROM clientes JOIN pedidos JOIN vendedores ON clientes.id = pedidos.id_cliente and vendedores.id = pedidos.id_vendedor  
ORDER BY vendedores.apellido;
-- 15
SELECT * 
FROM clientes JOIN pedidos ON clientes.id = pedidos.id_cliente 
WHERE fecha > "2022-01-01" AND cantidad between 300 and 1000;
-- 16
SELECT vendedores.nombre, vendedores.apellido 
FROM clientes JOIN pedidos JOIN vendedores on clientes.id = pedidos.id_cliente and vendedores.id = pedidos.id_vendedor  
WHERE clientes.nombre = "Maria";
-- 17
SELECT clientes.nombre, clientes.apellido 
FROM clientes JOIN pedidos JOIN vendedores on clientes.id = pedidos.id_cliente and vendedores.id = pedidos.id_vendedor  
WHERE vendedores.nombre = "Daniel" AND vendedores.apellido = "Sáez";
-- 18
SELECT * 
FROM clientes  LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente 
ORDER BY clientes.apellido, clientes.nombre;
-- 19
SELECT * 
FROM vendedores LEFT JOIN pedidos on vendedores.id = pedidos.id_vendedor 
ORDER BY vendedores.apellido, vendedores.Nombre;
-- 20
SELECT * 
FROM clientes  LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente  
WHERE pedidos.id_cliente IS NULL;
-- 21
SELECT * 
FROM vendedores LEFT JOIN pedidos on vendedores.id = pedidos.id_vendedor 
WHERE pedidos.id_vendedor IS NULL;
-- 22 
SELECT clientes.nombre, clientes.apellido, clientes.id as "ID", "cliente"  
FROM clientes  LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente  
WHERE pedidos.id_cliente IS NULL
UNION
SELECT vendedores.nombre, vendedores.apellido, vendedores.id as "ID", "vendedor" 
FROM vendedores LEFT JOIN pedidos on vendedores.id = pedidos.id_vendedor 
WHERE pedidos.id_vendedor IS NULL
ORDER BY apellido, nombre asc;

-- 23
SELECT SUM(cantidad) FROM pedidos;

-- 24
SELECT avg(cantidad) FROM pedidos;

-- 25
SELECT count(distinct(id_vendedor)) FROM pedidos ;

-- 26
SELECT count(distinct(id)) from clientes;

-- 27 
SELECT max(cantidad) FROM pedidos;

-- 28
SELECT min(cantidad) FROM pedidos;

-- 29
SELECT max(clientes.categoría) as "max categoria", clientes.ciudad 
from clientes group by ciudad;
-- 30 

select max(pedidos.cantidad), pedidos.fecha, pedidos.id_cliente, clientes.nombre, clientes.apellido
from pedidos inner join clientes 
on pedidos.id_cliente = clientes.id
group by pedidos.fecha;

-- 31
SELECT max(pedidos.cantidad) as Max_Pedido,    fecha, id_cliente, clientes.nombre, clientes.apellido 
from ventas.pedidos inner join ventas.clientes on ventas.clientes.id=ventas.pedidos.id_cliente
WHERE pedidos.cantidad > 2000
group by ventas.pedidos.id_cliente,ventas.pedidos.fecha;

-- 32
SELECT max(pedidos.cantidad), pedidos.fecha, vendedores.id, vendedores.nombre, vendedores.apellido
From pedidos inner join vendedores on vendedores.id = pedidos.id_vendedor
where pedidos.fecha = "2021-08-17"
group by pedidos.fecha, vendedores.id;

-- 33
select count(pedidos.id_cliente) , clientes.id, clientes.nombre, clientes.apellido
from pedidos right join clientes
on pedidos.id_cliente = clientes.id
group by clientes.id;

-- 34
select count(pedidos.id_cliente) , clientes.id, clientes.nombre, clientes.apellido
from pedidos right join clientes
on pedidos.id_cliente = clientes.id
where year(fecha) = 2020
group by clientes.id;

-- 35
select max(pedidos.cantidad), year(pedidos.fecha) from pedidos 
group by  year(pedidos.fecha);

-- 36
select count(pedidos.cantidad), year(pedidos.fecha) from pedidos 
group by  year(pedidos.fecha);

-- 37
Select * from pedidos left join clientes
on pedidos.id_cliente = clientes.id
where clientes.nombre = "adela";

-- 38
Select * from pedidos left join vendedores
on pedidos.id_vendedor = vendedores.id
where vendedores.nombre = "Daniel";

-- 39
Select  *
from clientes left join pedidos
on clientes.id = pedidos.id_cliente 
where year(pedidos.fecha) = 2022 
order by pedidos.cantidad desc
limit 1;

-- 40
Select  pedidos.fecha, pedidos.cantidad
from pedidos left join clientes
on pedidos.id_cliente = clientes.id
where clientes.nombre = "pepe"
order by pedidos.cantidad asc
limit 1;

-- 41 
select *
from clientes 
where clientes.id in (select id_cliente from pedidos);

-- 42
select *
from vendedores
where vendedores.id not in (select id_vendedor from pedidos);

-- 43
select *
from clientes
where exists (select * from pedidos where clientes.id = pedidos.id_cliente);

-- 44
select *
from vendedores
where not exists (select * from pedidos where vendedores.id = pedidos.id_vendedor);

 







