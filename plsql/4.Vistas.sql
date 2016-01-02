--vistas: hay dos tipos de vistas en plsql vista normal, y vista materializada,
/*
  -Una vista normal es el resultado de un query, cada vez que se accede al query se ejecuta el query. La informacion que se muestra es del estado
  actual de las tablas
  
  -Una vista materializada es el resultado de un query, que se guarda en cache como si de una tabla se tratase. La informacion que almacena
  corresponde al momento en que se refresco la VM "vista materializada"
  
  - la diferencia entre las dos vistas es que la vista normal es en tiempo real de ejecucion de cada tabla por ej: una vez creadas las 2 vistas
  y si se inserto el registro 7, y luego se ejecuta la vista normal, nos va a mostrar hasta el ultimo registro que en este caso seria 7. En cambio una vista materializada
  se utiliza mas que todo para hacer analisis de datos, solo se muestra los registros que estaban desde que se creo o actualizo la vista materializada,
  en este caso NO nos mostrara el 7
  
  -para crear una vista normal nos dirijimos al apartado de vistas y damos click derecho y crear vista o  tambien por script como lo indicamos abajo
*/
create view  vw_Categoria --una vista no puede recibir parametros 
as--solo puede encapsular peticiones select
select * from FAC_CATEGORIA;

select * from vw_Categoria;--ejecutamos la vista

  --para crear una vista materializada, nos dirijimos al apartado de vistas materializadas que esta en el arbol, y damos neva vista materializada o tambien oir script como lo indicamos abajo

create materialized view vm_categoria
as
 select * from FAC_CATEGORIA;
 
select * from vm_Categoria;--ejecutamos la vista materializada

--Hacemos una insercion para ver la diferencia
insert into fac_categoria values(8,'Frutas',null,'30/09/2015','24/10/15 18:03:16,525000000');
select * from vw_Categoria;--ejecutamos la vista normal nos muestra todos los registros incluyendo el ultimo que fue el 8
select * from vm_Categoria;--ejecutamos la vista materializada, no nos muestra el registro 7

--Para Actualizar La Vista Materializada manualmente, cada vez que ejecutemos la siguiente instruccion se actualiza la vista materializada con los registros que llevamos
EXECUTE DBMS_MVIEW.REFRESH( LIST => 'vm_Categoria', METHOD => 'C' );--Acatualizamos la vista materializada, si luego de actualizarla
--introducimos nuevos registros en FAC_CATEGORIA no se se guardaran en la vista materializada hasta que nuevamente la actualicemos con ese comando visto

