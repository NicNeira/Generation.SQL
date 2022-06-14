
use generationg1;

CREATE TABLE registros(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    codigo_registro varchar(50) NOT NULL,
    rut varchar(50) NOT NULL
);

CREATE TABLE cursos(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre varchar(30) NOT NULL,
    descripcion varchar(100)
);

CREATE TABLE direcciones(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre varchar(30) NOT NULL,
    numero int not null,
    region_id int,
    ciudad_id int,
    pais_id int
);

CREATE TABLE alumnos(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    edad int,
    curso_id int,
    direccion_id int,
    registro_id int
);

-- FOREING KEY
ALTER TABLE alumnos
ADD CONSTRAINT FK_direccion_id -- asignar nombre a la relacion
FOREIGN KEY (direccion_id) REFERENCES direcciones(id),
ADD CONSTRAINT FK_curso_id -- asignar nombre a la relacion
FOREIGN KEY (curso_id) REFERENCES cursos(id),
ADD CONSTRAINT FK_registro_id -- asignar nombre a la relacion
FOREIGN KEY (registro_id) REFERENCES registros(id)
;


CREATE TABLE regiones(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    numero_romano varchar(50) NOT NULL
    );

CREATE TABLE paises(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre varchar(50) not null
);

CREATE TABLE ciudades(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
   	nombre varchar(50) not null
);

-- FOREING KEY
ALTER TABLE direcciones
ADD CONSTRAINT FK_regiones_id -- asignar nombre a la relacion
FOREIGN KEY (region_id) REFERENCES regiones(id),
ADD CONSTRAINT FK_paises_id -- asignar nombre a la relacion
FOREIGN KEY (pais_id) REFERENCES paises(id),
ADD CONSTRAINT FK_ciudades_id -- asignar nombre a la relacion
FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
;