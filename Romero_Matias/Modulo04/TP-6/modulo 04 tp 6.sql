DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;

CREATE TABLE departamentos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);
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

CREATE TABLE paises (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);

CREATE TABLE provincias (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
id_pais INT UNSIGNED NOT NULL,
FOREIGN KEY (id_pais) REFERENCES paises(id)
);

CREATE TABLE localidades (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
cp INT UNSIGNED ,
id_provincia INT UNSIGNED NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincias(id)
);

-- 2 -------------------------
alter table empleados
add direccion VARCHAR(30) ,
add id_localidad INT UNSIGNED NOT NULL ,
add email VARCHAR(30) ,
add telefono INT,
add fecha_ingreso date ,
add tms timestamp,
ADD CONSTRAINT fk_id_localidad FOREIGN KEY (id_localidad) REFERENCES localidades(id);

-- 3 -------------------------
alter table departamentos
add gasto DOUBLE,
add tms timestamp;

-- 4 -------------------------

INSERT INTO paises values (1, "Argentina");
INSERT INTO paises values (2, "Brasil");
INSERT INTO paises values (3, "Paraguay");
INSERT INTO paises values (4, "Bolivia");
INSERT INTO paises values (5, "Chile");

INSERT INTO provincias values (1, "Misiones" , 1);
INSERT INTO provincias values (2, "Corrientes" , 1);
INSERT INTO provincias values (3, "Entre Rios" , 1);
INSERT INTO provincias values (4, "Chacho" , 1);
INSERT INTO provincias values (5, "Formosa" , 1);

INSERT INTO localidades values (1, "Posadas" , 3315, 1);
INSERT INTO localidades values (2, "Alem" , 3330, 1);
INSERT INTO localidades values (3, "Charata" , null, 4);
INSERT INTO localidades values (4, "Parana" , null, 3);
INSERT INTO localidades values (5, "Resistencia" , 3315, 4);

INSERT INTO departamentos VALUES(1, 'Desarrollo', 120000, true, 2000, null);
INSERT INTO departamentos VALUES(2, 'Sistemas', 150000, true, 60000, null);
INSERT INTO departamentos VALUES(3, 'Recursos Humanos', 280000, true, null, null);
INSERT INTO departamentos VALUES(4, 'Contabilidad', 110000, true, null, null);
INSERT INTO departamentos VALUES(5, 'I+D', 375000, true, null, null);

INSERT INTO empleados VALUES(1, '27-32481596-3', 'Aarón', 'Rivero', 1, true, null, 2, null, null,null,null);
INSERT INTO empleados VALUES(2, '27-29557532-1', 'Adela', 'Salas', 2, true, null, 2, null, null,null,null);
INSERT INTO empleados VALUES(3, '20-36970642-1', 'Adolfo', 'Rubio', 3, true, null, 2, null, null,null,null);
INSERT INTO empleados VALUES(4, '20-41705545-1', 'Adrián', 'Suárez', 4, true, null, 2, null, null,null,null);
INSERT INTO empleados VALUES(5, '20-17087203-3', 'Marcos', 'Loyola', 5, true, null, 2, null, null,null,null);

-- 5 -------------------------
rename table pedidos to movimientos ;

-- 6 -------------------------
CREATE TABLE proveedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
razon_social VARCHAR(30) NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
naturaleza VARCHAR(30),
cuit VARCHAR(30) ,
id_localidad INT UNSIGNED NOT NULL ,
estado BOOLEAN,
tms timestamp,
 FOREIGN KEY (id_localidad) REFERENCES localidades(id)
);

CREATE TABLE marcas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(200),
imagen VARCHAR(200) ,
id_proveedor INT UNSIGNED NOT NULL,
estado BOOLEAN,
tms timestamp,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id)
);

CREATE TABLE productos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(200),
id_marca INT UNSIGNED NOT NULL ,
stock DOUBLE ,
precio DOUBLE ,
estado BOOLEAN,
tms timestamp,
FOREIGN KEY (id_marca) REFERENCES marcas(id)
);

CREATE TABLE cajas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
horainicio datetime ,
horacierre datetime ,
estado BOOLEAN,
tms timestamp

);

-- 7 -------------------------
INSERT INTO proveedores VALUES(1, 'juan carlos proveedor' , 'Juan ', 'Perez', 'coso' , '20-33456789/2', 2, true, null);
INSERT INTO proveedores VALUES(2, 'te proveo' , 'matias', 'romero', '99' , null, 2, true, null);
INSERT INTO proveedores VALUES(3, 'prov' , 'ana', 'Perez', null , null, 2, true, null);
INSERT INTO proveedores VALUES(4, 'crack' , 'pedro ', 'rodrigez', 'juridico' , '20-35689741/2', 2, false, null);
INSERT INTO proveedores VALUES(5, 'sultan' , 'maria ', 'garcia', 'fisico' , '20-99887654/2', 2, true, null);

INSERT INTO marcas VALUES(1, 'marolio' , 'sabor a tu vida', 'img.png', 1 , true, null);
INSERT INTO marcas VALUES(2, 'vital' , 'de la gente', 'img.png', 2 , true, null);
INSERT INTO marcas VALUES(3, 'manaos' , 'vamos manaols', 'img.png', 3 , true, null);
INSERT INTO marcas VALUES(4, 'sancor' , 'la chocolatadita', 'img.png', 2 , true, null);
INSERT INTO marcas VALUES(5, 'patito' , 'cuac', 'img.png', 1 , true, null);

INSERT INTO productos VALUES(1, 'leche' , 'descremada', 4, 22 ,  50, true, null);
INSERT INTO productos VALUES(2, 'cafe' , '500gs', 1, 15 ,  90, true, null);
INSERT INTO productos VALUES(3, 'arroz' , '1kg', 4, 22 ,  50, true, null);
INSERT INTO productos VALUES(4, 'lenteja' , 'partidas', 4, 22 ,  50, true, null);
INSERT INTO productos VALUES(5, 'zardinas' , 'al natural', 4, 22 ,  50, true, null);

-- 8 -------------------------
select d.nombre, d.presupuesto, d.gasto, sum(d.presupuesto - d.gasto) as diferencia
from departamentos d
where d.estado = 1
group by d.id;

-- 9 -------------------------
select localidades.nombre localidad, paises.nombre pais
from localidades 
join provincias  
on id_provincia = provincias.id 
join paises
on provincias.id_pais = paises.id
order by paises.nombre;

-- 10 -------------------------
update empleados
SET telefono = 375452092
WHERE idemplaedo = 1;

update empleados
SET fecha_ingreso = "2022-10-22", id_localidad = 1
WHERE idemplaedo = 2;

-- 11 -------------------------
INSERT INTO vendedores VALUES(1, 'contanza' , 'exito', '20-321332987/6', 0.3);
INSERT INTO vendedores VALUES(2, 'cintia' , 'ledezma', '20-2343245679832/6', 0.4);
INSERT INTO vendedores VALUES(3, 'caro' , 'rivadavia', '20-2345647543/6', 0.5);
INSERT INTO vendedores VALUES(4, 'mika' , 'patito', '20-34534566/6', 0.6);
INSERT INTO vendedores VALUES(5, 'gimana' , 'anga', '20-3561654987/6', 0.7);

-- 12 -------------------------
alter table movimientos
add id_producto INT UNSIGNED NOT NULL,
add estado boolean, 
add tms timestamp,
add tipo_movimiento VARCHAR(30),
ADD CONSTRAINT fk_id_productos FOREIGN KEY (id_producto) REFERENCES productos(id);

-- 13 -------------------------

select * from movimientos;
select * from clientes;
INSERT INTO clientes VALUES(1, 'matias' , 'romero', '20-33321654/2', 2, 2);

INSERT INTO movimientos VALUES(1, 10 , '2022-10-28', 1, 1, 1 , null, null, 1);
INSERT INTO movimientos VALUES(2, 20 , '2022-10-28', 1, 1, 1 , null, null, 1);
INSERT INTO movimientos VALUES(3, 30 , '2022-10-28', 1, 1, 1 , null, null, 1);
INSERT INTO movimientos VALUES(4, 40 , '2022-10-28', 1, 1, 1 , null, null, 1);
INSERT INTO movimientos VALUES(5, 50 , '2022-10-28', 1, 1, 1 , null, null, 1);

-- 14 -------------------------
update movimientos SET estado = true WHERE id > 3;



-- 16 -------------------------
CREATE TABLE parametros(
id INT UNSIGNED NOT NULL,
tms TIMESTAMP,
cosas JSON ,
id_usuario INT UNSIGNED NOT NULL
);

-- 17 -------------------------
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('1',null,'{"idDeLaCosa": 101, "permisos": "PUT, GET"}','1');
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('2',null,'{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente","grupo": "ventas"}','1');
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('3',null,'{"zonaHoraria": "America/Argentina/BuenosAires"}','1');
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('4',null,'{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}','2');
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('5',null,'{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}','3');
