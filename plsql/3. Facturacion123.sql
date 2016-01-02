select sysdate from dual --para obtener la fecha del servidor
--dual es una tabla por defecto de oracle que nos sirve mucho para saber por ejemplo la fecha del servidor,  
--dual es una tabla que tiene oracle creada para probar funciones o hacer calculos rápidos
--ejemplo: Obtener el valor absoluto de -20 para ello hay una funcion que obtiene el valor absoluto de cualquier numero QUE ES ABS 
--entonces: seria sobre la tabla dual 
--SELECT ABS(-20) "ABSOLUTO" FROM DUAL; 
--El Resultado Es:
--ABSOLUTO 
----------------- 
--20 
select * from dual

------------------------------Insercion----------
INSERT INTO fac_proveedor values(1,'Jonatan Velandia','Call 21N 8A23','8292695','3213466996');--insertamos, no importa si el nombre de la tabla esta en minuscula
INSERT INTO fac_proveedor(id_proveedor,nombre_contacto,direccion,telefono)values(2,'Javier','Vanegas','Call 21 N 8A23')--cuando queremos insertar No todos los datos, tenemos que especificar que campos vamos a llenar, si vamos a insertar todos los campos entonces no hace falta
select * from FAC_PROVEEDOR

insert into fac_marca values(1,'Coca Cola')
insert into fac_marca values(2,'Diana')
insert into fac_marca values(3,'Fama')
select *from fac_marca

insert into fac_categoria values(1,'Dulces',null,null)--ingresamos null, ya que tenemos que especificar todos los campos
insert into fac_categoria (id_categoria,nombre_categoria) values(2,'Chocolate')--como indicamos los campos no hace falta inidcar null
insert into fac_categoria values(3,'Galletas',null,(select sysdate from dual))--con la subconsulta '(select sysdate from dual)' ingresamos la fecha actual
select *from fac_categoria


insert into fac_producto values(1,4,1,1,'COCACOLA LATA',NULL,10,10,1)--como ya hicimos las relaciones, y ingresamos datos en las tablas que estan relacionadas a esta, ya podemos ingresar datos en esta tabla principal, de lo contrario si no hubieran datos en la stablas relacionadas daria error


-------------------------Crear Tablas---------------
create table fac_marca(--PARA CREAR TABLAS EN ORACLE
id_marca int not null primary key,
nombre_marca varchar(50)
)


--------------PARA ALTERAR UNA TABLA INDICANDO UNA RELACION
ALTER TABLE FAC_PRODUCTO ADD CONSTRAINT FK_FAC_PRODUCTO_PROVEEDOR
FOREIGN KEY(ID_PROVEEDOR) REFERENCES FAC_PROVEEDOR(ID_PROVEEDOR)

ALTER TABLE FAC_PRODUCTO ADD CONSTRAINT FK_FAC_PRODUCTO_MARCA --'FK_FAC_PRODUCTO_MARCA' PUEDE SER CUALQUIER NOMBRE ILUSTRATIVO
FOREIGN KEY(ID_MARCA) REFERENCES FAC_MARCA(ID_MARCA)


--------------CONSULTAS------------
select * from fac_producto p,fac_marca m where p.id_marca=m.id_marca--seleccionar todos los productos con su respectiva marca
select * from fac_producto p,fac_marca m where p.id_marca=m.id_marca and LOWER (m.nombre_marca)='diana'--seleccionar todos los productos con su respectiva marca 'diana', convertimos lo del campo m.nombre_marca en minuscula para compararlo con 'diana que esta en minuscula'



---------------UPDATE---------------
--una buena practica que debemos hacer antes de hacer un delete o un update es primero hacer la consulta. en donde nos arrojara los datos a modificar
--select * from fac_marca where nombre_marca='Fama'--realizamos la consulta, luego reemplazamos por update
update fac_marca set nombre_marca='Fama1'  where nombre_marca='Fama'--reemplazamos el update por el select *from


---------------DELETE----------------------
--primero como buena practica hacemos la consulta de los registros que vamos a eliminar y posteriormente los eliminamos, fijarnos que el registro a eliminar no sea primario y si lo es  que no este siendo utilizado 
select * from fac_proveedor where id_proveedor=1
delete from fac_proveedor where id_proveedor=1 -- no podemos eliminarlo por que este registro esta siendo utlizado por registros de la tabla producto gracias a las relaciones, si lo quicieramos eliminar tendriamos que eliminar los registros de la tabla producto que esten utilizando el  id_proveedor=1
delete from fac_proveedor where id_proveedor=3--este registro si podemos eliminarlo ya que no tiene ninguna dependencia para ninguna tabla, es decir no esta siendo utilizado por ningun registro de la tabla producto

---------------------INSERTAR LLAMANDO LA SECUENCIA--------------------
/*crear secuencia es muy importante para especificar los ids, se crea dirijiendonos en el arbol en el apartado Secuencias y dar click derecho y crear secuencia
indicar un nombre, por estandar debe empesar con SEC que quiere decir secuencia y despues el nombre de la tabal, puede llevar cualquier nombre pero por estandar es recomendable especificar de esta manera
luego indicar el numero por el cual va a empezar, luego la cantidad de cuanto en cuanto va a aumentar, luego especificamos el valor minimo y maximo y aceptar
*/
insert into fac_categoria values(sec_fac_categoria.nextval,'Lacteos',null,(select sysdate from dual));--insertamos un registro  y gracias a la secuencia ingresamos el numero de id para llamar a la secuencia se hace con: sec_fac_categoria.nextval

