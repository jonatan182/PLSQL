/*
Procedimiento Almacenado: es un conjunto de instruciones a las que se les da un nombre, se almacena en la bd en la cual trabaja el usuario,
permite agrupar y organizar tareas repetitivas que ayudan al usuario en confiabilidad seguridad y sobre todo proteccion de datos cuando trabajamos desde el lado del servidor.

Un procedimiento almacenado puede contener cualquier cantidad y tipo de instrucciones DML(para manipulacion de datos como: insert, update, delete), NO
instruciociones DDL(de definicion de datos como: create..,drop..alter).

Los procedimiento almacenados pueden hacer referencia a tablas, vistas, a funciones definidas por el usuario y a otros procedimientos almacenados

Ej:
create or replace procedure NOmbreProcedimiento
(parametros)
as
begin
  instrucciones 1
  intruciones 2
end;

el uso de or replace permite sobreescribir un procedimiento existente, si se omite y el procedimiento existe, se producira un error.
los parametros pueden ser de entrada(in) o de lsalidad (out), o de entrada y salida (in out). el valor por defecto es in, y se toma ese valor
encaso de que no especifiquemos nada.

Para crear el procedimiento almacenado, lo podemos hacer de dos formas uno es mediante el script y el otro es dirijiendonos al apartado de procedimientos
dar click derecho y crearlo

*/
CREATE OR REPLACE PROCEDURE PROC_MARCA 
(
  VAR_IDMARCA IN NUMBER --recibimos un parametro ya que la variable es IN
) 
AS 
BEGIN
  insert into fac_marca values(var_idmarca,'ejemplo marca');--insertamos una marca,
END PROC_MARCA;

execute proc_marca(13);--para ejecutar el procedimiento almacenado y pasamos el parametro que es de tipo entero

-------EJEMPLO CON CASES-----------
CREATE OR REPLACE PROCEDURE PROC_MARCA 
(
  VAR_IDMARCA IN NUMBER --recibimos un parametro ya que la variable es IN
) 
AS 
BEGIN
CASE VAR_IDMARCA--para validar var_idmarca en los diferentes when
    WHEN 11 THEN--si var_idmarca es 11 entonces inserta el registro   
      insert into fac_marca values(var_idmarca,'ejemplo marca');--insertamos una marca,
    WHEN 12 THEN--si var_idmarca es 12 entonces imprimimos very good
      DBMS_OUTPUT.PUT_LINE('Very Good');
    ELSE--si var_idmarca no es ninguno de los anteriores entonces imprime registro no valido 
      DBMS_OUTPUT.PUT_LINE('Registro No Valido');
  END CASE;
END PROC_MARCA;

-------EJEMPLO CON IF-----------
CREATE OR REPLACE PROCEDURE PROC_MARCA 
(
  VAR_IDMARCA IN NUMBER --recibimos un parametro ya que la variable es IN
) 
AS 
BEGIN
  if VAR_IDMARCA=11 then
    insert into fac_marca values(var_idmarca,'ejemplo marca');--insertamos una marca,
  elsif VAR_IDMARCA=12 then
    DBMS_OUTPUT.PUT_LINE('Very Good');
  else
    DBMS_OUTPUT.PUT_LINE('Registro No Valido');
  end if;
END PROC_MARCA;