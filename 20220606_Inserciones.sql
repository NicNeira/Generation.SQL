-- Para ejecutar un script demo estar en la ruta donde se encuentra este. fuera de mysql

-- para usar la base de datos generationg1
use generationg1; 

-- insertar datos para cursos
insert into cursos (nombre, descripcion) values ('beta', 'los mas inteligentes'),('alfa', 'los mas aplicados'),('gamma', 'los mas astutos');
insert into registros (codigo_registro, rut) values ('zb202201', '12313-3'),('ka202202', '44444-2'),('td202203', '22222-2');

insert into direcciones (nombre, numero, ciudad) values 
('prat', '123','Arica'),
('bulnes', '444','Punta Arenas'),
('arana', '756','concepcion');

insert into alumnos (nombre, apellido, edad, curso_id, direccion_id, registro_id) values 
('zoe', 'palma','3','1','3','1'),
('ayun', 'palma','3','1','3','2'),
('tom', 'loren','5','3','1','3');