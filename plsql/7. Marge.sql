/*
Merge: lo que permite esta sentencia es que dependiendo de una condicion logica: 
actualizar registros (update) cuando la condicion SI se cumple,
insertar registros (insert) cuando la condicion NO se cumple
*/
merge into fac_marca marc using fac_marca_migrar marcm --fac_marca es la tabla que se va a actualizar o a insertar usando los registros de la tabla fac_marca_migrar dependiendo de la condicion, tambien puede usar registros de una vista o un subquery 
on(marc.id_marca=marcm.id_marca)--condicion, en donde se comparan los id, si son iguales se actualiza y si son diferentes de inserta 
when MATCHED then--si la condicion es verdadera, Esta condición es evaluada fila por fila, si la condición es verdadera, se ejecutará la clausula Update; si la condición es falsa, la base de datos insertará el registro desde el origen.
update set marc.nombre_marca = marcm.nombre--actualizamos el nombre_marca de la tabla fac_marca con el de fac_marca_migrar
when NOT MATCHED then--si la condicion es falsa
insert values(sec_fac_marca.nextval,marcm.nombre);--insertamos el id llamando a la secuencia, y el nombre de la fac_marca_migrar