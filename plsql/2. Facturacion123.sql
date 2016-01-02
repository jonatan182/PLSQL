----------------------BLOQUES--------------
set serveroutput on format wrapped --instruccion para poder imprimir por consola, en la salida del script
DECLARE
  v_numero1 NUMBER := 1;
  v_numero2 NUMBER := 5;
  v_salida NUMBER;
  v_salida_marca VARCHAR(20);
  v_salida_id_marca number;
  v_id_marca number :=3;
  v_divisionPorCero number;
BEGIN
   --v_salida:= (v_numero1 + v_numero2);
   --DBMS_OUTPUT.PUT_LINE(v_salida);
   select (v_numero1 + v_numero2) into v_salida from dual;--con into almacenamos la suma de las dos variables en la variable v_salida
   DBMS_OUTPUT.PUT_LINE('la suma es: '||v_salida);--para imprimir
   
   SELECT nombre_marca into v_salida_marca from fac_marca where id_marca=v_id_marca;--con into almacenamos el nombre_marca de la consulta en la variable v_salida_marca, solo podemos almacenar un registro por eso utilizamos el where, si quicieramos imprimir mas registros tendriamos que utilizar cursores
   DBMS_OUTPUT.PUT_LINE('la marca es: '||v_salida_marca);
   
   SELECT nombre_marca, id_marca into v_salida_marca,v_salida_id_marca from fac_marca where id_marca=v_id_marca;--con into almacenamos el nombre_marca y el v_salida_id_marca de la consulta en la variable v_salida_marca y v_salida_id_marca, solo podemos almacenar un registro a cada variable por eso utilizamos el where, si quicieramos imprimir mas registros tendriamos que utilizar cursores
   DBMS_OUTPUT.PUT_LINE('La Marca Es: '||v_salida_marca||' Y El Id Es: '||v_salida_id_marca);
   
   v_divisionPorCero := 3/0;/*nos genera un error y la excepcion lo atrapa y imprime el mensage*/
   
   EXCEPTION--manejo de excepciones
    WHEN ZERO_DIVIDE THEN--zero:divide atrapa las exceptiones que se produzcan cuando se haga una divicion por cero
      dbms_output.put_line('Error Division Por Cero');
END;

select * from fac_producto p inner join fac_marca m on p.id_marca = m.id_marca --para hacer inner join

select * from fac_marca
select decode(id_marca,1,'gaseosa',--estamos haciendo como una especie de else if, endonde si no es 1 ni 2 imprime otro que este seria el else
                      2,'Arroz',
              'otro') from fac_marca--sentencia plsql que permite hacer como una especie de condición, en donde si el parámetro "id_marca" el que recibimos tras la consulta de la tabla fac_marca es "1", --devuelve "gaseosa", pero si el parámetro recibido  es "2" entonces devuelve "arroz", si el id_marca no es 1 ni 2 entonces muestra otro. 
              
--TIMESTAM GUARDA LA FECHA Y LA HORA
--para obtener el dia, fecha, hora independientemente de la columna fecha que es de tipo timestam lo hacemos de la siguiente manera 
select trunc(fecha)as fecha from fac_categoria -- para mostrar solo la fecha, es decir quitamos las horas
select extract(day from fecha) as dia from fac_categoria -- para mostrar solo el dia, se hace con extract(day from campo_fecha), donde campo_fecha es el campo d ela tabla que contiene la fecha de la cual se extraera el dia
select extract(month from fecha)as mes from fac_categoria -- para mostrar solo el mes
select extract(year from fecha)as año from fac_categoria -- para mostrar solo el año

--ahora todo en una misma instruccion
select trunc(fecha)as fecha, extract(day from fecha)as dia, extract(month from fecha) as mes, extract(year from fecha) as año from fac_categoria
--para mostrar la hora
select to_char(fecha,'HH12:MI:SS') from fac_categoria--si cambiamos el HH24 por HH12 nos muestra la hora en formato de 12 horas

--ahora todo en una misma linea
select trunc(fecha)as fecha, extract(day from fecha)as dia, extract(month from fecha) as mes, extract(year from fecha) as año, to_char(fecha,'HH24:MI:SS')as Hora from fac_categoria