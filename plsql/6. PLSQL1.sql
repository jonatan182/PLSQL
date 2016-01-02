--PL/SQL: 
/*
¿que es?
se encarga de ampliar SQl con los elementos caracteristicos de los lenguajes de programacion, comovariables, sentencias, bucles,etc.
Es el lenguajes de programacion que proporciona oracle para extender el SQL estandar con otro tipo de instrucciones.
Algunos componentes de plsql:
-bloques
-variables
-tipos
-Expresiones, operadores
-funciones
-estructuras de control
-Cursores
-Procedimientos
-paquetes 
-disparadores
*/

--BLOQUES: los programas PL/SQl estan compuesto por bloques que pueden estar situados uno detras de otros(Estructura Secuencial),
--O pueden estar uno dentro de otro(Estructuras Anidadas)
--Estructura de Un bloque, estan compuestas por 3 partes
/*
  1. Seccion declarativa: se situan en ella las variables, cursores y tipos usados por el bloque
  2. Seccion ejecutable: Se situan en ella las ordenes SQL  y las ordenes procedimentales que se lleva acabo el trabajo del bloque
  3. Seccion De Excepiones: Se situan en ella el codigo que no se ejecuta almenos que ocurra un error
*/--EJEMPLO
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
  select id_categoria into v_numero1 from fac_categoria where id_categoria=2;
  if v_numero1=1 then
    DBMS_OUTPUT.PUT_LINE('Es Uno'||v_numero1);
  else
    DBMS_OUTPUT.PUT_LINE('No Es Uno'||v_numero1);
  end if;
END;





