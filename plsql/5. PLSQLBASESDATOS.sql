--cometario una sola linea

/*comentario 
  de varias lineas
*/
---Estructura de todo programa plSql

--establecemos parametro de session para poder imprimir en Oracles Sql Developer
set serveroutput on format wrapped
--tiene que empezar con begin, adentro de begin y end indicamos el codigo
begin
  DBMS_OUTPUT.PUT_LINE('Hola Mundo PL/SQL');--intruccion para imprimir por consola
end;--termina con end


--declaracion de variables, este formato es el que tiene que llevar un programa en plsql
set serveroutput on format wrapped
DECLARE
--adentro de declare tenemos que declarar las variables, siempre tiene que ir de primeras
miNombre varchar2(20);--son accesibles por todos los bloques que esten adentro de este
miEdad number(10,2):=21;--tipo de dato que podra almacenar 10 posiciones, 2 de ellas decimales, tambien podemos asignar valor a la variable aca
miFecha date;
BEGIN
  miNombre := 'Jonatan';--Asignamos variables ":="operador de asignacion 
  
  DBMS_OUTPUT.PUT_LINE('Hola Mundo PL/SQL '||miNombre);--"||"operador de concatenacion
  DBMS_OUTPUT.PUT_LINE('Tu Edad Es De: '||miEdad);
  DBMS_OUTPUT.PUT_LINE('Covertimos La Edad A Char: '||to_char(miEdad));--to_char()funcion de oracle para convertir a caracteres
  
  miFecha:= sysdate + 7;--sysdate sirve para asignar la fecha actual del sistema, y sumamos 7 dias, asignamos valor a miFecha
  
  DBMS_OUTPUT.PUT_LINE('Fecha Dentro De 7 Dias: '||miFecha);
  DBMS_OUTPUT.PUT_LINE('Cambiamos Formato Fecha: '||to_char(miFecha,'yyyy/mm/dd'));
  DBMS_OUTPUT.PUT_LINE('La Fecha Actual Es: '||to_char(sysdate,'dd/mm/yyyy'));
  
  
  --podemos anidar cuantos bloques deseemos
  DECLARE 
    MiVariableBooleana boolean := true;--estas variables son accesibles solo por este bloque y el que este adentro, desde afuera de este bloque no podemos acceder a estas variables
    documento varchar(10) := '1073240664';
  begin
    --null; No Es recomendable indicar un bloque y dejarlo vacio, si en el peor de los casos es necesario, tenemos que indicar null `para que no salga error
    if MiVariableBooleana then--Condicional if, evalua una expresion booleana
        DBMS_OUTPUT.PUT_LINE('Este Es Mi Numero De Documento: '||documento);--Si no indicamos nada dadentro del bocle if cuando se cumple la condicion, el programa saca error, tenemos que indicar null, para que no saque error y de esa manera dejar el bocle vacio
    else
      null;--La instruccion else no se puede dejar sin nada adentro, si no necesitamos indicar nada dentro de else, tnemos que indicar null
    end if;
    
  end;
    
END;--tiene que terminar con ;








-------------------------Creacion De Tablas----------------------
SELECT * FROM all_tables;
create table profesor(
idProfesor int not null primary key,
nombreProfesor varchar(50),
apellidoProfesor varchar(30)
);
create table alumno(
idAlumno int not null primary key,
nombreAlumno varchar(50),
apellidoAlumno varchar(50),
idCurso int not null,
foreign key (idCurso) references curso(idCurso)
);
create table materia(
idMateria int not null primary key,
materia varchar(50),
idCurso int not null,
idProfesor int not null,
FOREIGN KEY (idCurso) REFERENCES curso(idCurso),
foreign key (idProfesor) references profesor(idProfesor)
);
create table curso(
idCurso int not null primary key,
curso varchar(50)
);
describe USUARIO; --nos muestra que se haya creado la tabla materia


insert into profesor values(1,'Joselin','Perez');
select * from profesor;

insert into curso values(1,'sesto');
select * from curso;

insert into materia values(1,'fisica1',1,1);
select * from materia m inner join profesor p on p.idProfesor = m.idProfesor inner join curso c on m.idCurso = c.idCurso

insert into alumno values(1,'jonatan','vanegas',1);
select * from alumno

select  c.curso, m.materia from curso c inner join materia m on m.idCurso = c.idCurso


drop table alumno--para eliminar tabla