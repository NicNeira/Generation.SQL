select * from alumnos a;
select * from grupos g ;

-- INNER JOIN
/*select * 
from alumnos a
inner join grupos g 
on a.grupo_id  = g.id ;*/

select *
from alumnos a 
inner join grupos g 
on a.grupo_id = g.id ;

select a.id , a.nombre as 'alumno', g.nombre as 'nombreGrupo' -- as ofr
from alumnos a 
inner join grupos g 
on a.grupo_id = g.id
where g.id =4;


-- left join : Se da prioridad a la tabla de la izquierda

select *
from alumnos a 
left join grupos g 
on a.grupo_id = g.id ;

select a.id , a.nombre as 'alumno', g.nombre as 'nombreGrupo' -- as ofr
from alumnos a 
inner join grupos g 
on a.grupo_id = g.id

-- Rigth join : Se da prioridad a la tabla de la derecha

INSERT INTO Grupos VALUES(7, 'Grupo7');
INSERT INTO Grupos VALUES(8, 'Grupo8');

select *
from alumnos a 
RIGHT join grupos g 
on a.grupo_id = g.id ;

select a.id , a.nombre as 'alumno', g.nombre as 'nombreGrupo' -- as ofr
from alumnos a 
RIGHT join grupos g 
on a.grupo_id = g.id

-- full join : Trae todo el universo de datos, pero no funciona en mysql

/*select *
from alumnos a 
full join grupos g 
on a.grupo_id = g.id ;
*/

-- Alternativa para mysql

select *
from alumnos a 
RIGHT join grupos g 
on a.grupo_id = g.id 
union
select *
from alumnos a 
LEFT join grupos g 
on a.grupo_id = g.id;


select * from (select a.id, a.nombre as 'alumno',g.id as 'grupoId',  g.nombre as 'nombreGrupo'
				FROM alumnos a
				Right JOIN grupos g 
				on a.grupo_id = g.id
				UNION
				select a.id, a.nombre as 'alumno',g.id as 'grupoId', g.nombre as 'nombreGrupo'
				FROM alumnos a
				LEFT JOIN grupos g 
				on a.grupo_id = g.id
				) as universo
-- where -- is null
	;


