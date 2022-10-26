SELECT e.apellido FROM sistema.empleados as e;
SELECT e.apellido from sistema.empleados as e group by e.apellido;
SHOW COLUMNS FROM empleados;
SELECT nombre, apellido from sistema.empleados ;
SELECT cuil_cuit from sistema.empleados ;
SELECT concat_ws(" ", nombre,apellido) as empleado from sistema.empleados ;SELECT concat_ws(" ", nombre,apellido) as empleado from sistema.empleados ;
SELECT upper( concat_ws(" ", nombre,apellido) ) as empleado from sistema.empleados ;SELECT concat_ws(" ", nombre,apellido) as empleado from sistema.empleados ;
SELECT lower( concat_ws(" ", nombre,apellido) ) as empleado from sistema.empleados ;SELECT concat_ws(" ", nombre,apellido) as empleado from sistema.empleados ;
SELECT * FROM departamentos;
SELECT nombre, presupuesto FROM departamentos order by presupuesto asc;
SELECT nombre FROM departamentos order by nombre desc;
SELECT apellido, nombre FROM empleados order by apellido, nombre asc;
select nombre, presupuesto FROM departamentos order by presupuesto desc limit 3;
select nombre, presupuesto FROM departamentos where presupuesto > 0 order by presupuesto asc limit 3 ;
select nombre, presupuesto FROM departamentos where presupuesto >= 150000 order by presupuesto asc ;
select nombre, presupuesto FROM departamentos where presupuesto >= 100000 and presupuesto <= 200000;
select nombre, presupuesto FROM departamentos where presupuesto >= 100000 and presupuesto <= 200000;
select nombre, presupuesto FROM departamentos where presupuesto <= 100000 or presupuesto >= 200000;
select nombre, presupuesto FROM departamentos where presupuesto between 100000 and 200000;
-- 19
select nombre, presupuesto FROM departamentos where presupuesto not between 100000 and 200000;
-- 20
select e.nombre, e.apellido, d.nombre  FROM sistema.empleados as e JOIN sistema.departamentos as d WHERE  e.id_departamento = d.iddepartamento;
-- 21
select e.nombre, e.apellido, d.nombre  FROM sistema.empleados as e JOIN sistema.departamentos as d WHERE  e.id_departamento = d.iddepartamento order by d.nombre, e.apellido, e.nombre asc ;
-- 22 no me salio
select d.iddepartamento, d.nombre FROM sistema.departamentos as d WHERE departamentos;
-- 23 
-- select e.nombre, e.apellido, d.nombre, e.cuil_cuit  FROM sistema.empleados as e JOIN sistema.departamentos as d WHERE  e.id_departamento = d.iddepartamento and e.cuil_cuit='27-38382980-3';
select d.nombre  FROM sistema.departamentos as d JOIN sistema.empleados as e WHERE  e.id_departamento = d.iddepartamento and e.cuil_cuit='27-38382980-3';
-- 24 
select d.nombre  FROM sistema.departamentos as d JOIN sistema.empleados as e WHERE  e.id_departamento = d.iddepartamento and e.nombre='Pepe' and e.apellido="Ruiz";
-- 25
select * FROM sistema.empleados e JOIN sistema.departamentos d WHERE  e.id_departamento = d.iddepartamento and d.nombre="I+D" order by e.apellido, e.nombre;
-- 26
select * FROM sistema.empleados e JOIN sistema.departamentos d on  e.id_departamento = d.iddepartamento where d.nombre="I+D" or d.nombre="Contabilidad" or d.nombre="Sistemas"order by e.apellido, e.nombre;
-- 27
select e.nombre, e.apellido FROM sistema.empleados e JOIN sistema.departamentos d on  e.id_departamento = d.iddepartamento where d.presupuesto < 100000 or d.presupuesto>200000 order by e.apellido, e.nombre;






