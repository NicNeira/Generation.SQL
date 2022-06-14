use generationg1;

select *from customers c;


-- Obtener todas las ordenes por cliente
select c.customerNumber , o.orderNumber, c.customerName 
from customers c , orders o 
where c.customerNumber = o.customerNumber 
and c.customerNumber = 496
order by c.customerNumber desc ;

select * from customers c 
where c.customerNumber = 496;

select * from orders o 
where o.customerNumber = 496;

-- productos

select * from products p ;

select * from productlines pl ;

-- filtrar todos los productos de motorcycle con la descripcion del producto
select p.productName , pl.productLine , pl.textDescription 
from products p , productlines pl
where p.productLine  = pl.productLine
and pl.productLine = 'Motorcycles'  ;

-- Actividad del profe

select * from products p ;

select p.productName , p.productLine , p.quantityInStock  
from products p 
where p.productLine  = p.productLine
and p.productLine = 'Motorcycles'
order by p.quantityInStock desc ;

select p.productName , p.productLine , p.quantityInStock  
from products p
where p.productName  like '%ford%'
order by p.productLine asc  ; -- por defecto es ascendente




-- Ejercicios sqlzoo.net

/*cláusula WHERE para mostrar la población de 'Francia'. Tenga en 
cuenta que las cadenas (fragmentos de texto que son datos) 
deben estar entre 'comillas simples';*/

SELECT population FROM world
  WHERE name = 'France'

/*Comprobación de una lista La palabra IN nos permite comprobar si un 
elemento está en una lista. El ejemplo muestra el nombre y la población
 de los países 'Brasil', 'Rusia', 'India' y 'China'.*/

 SELECT name, population FROM world
  WHERE name IN ('Brazil', 'Russia', 'India', 'China');  

/* ¿Qué países no son demasiado pequeños ni demasiado grandes? 
BETWEEN permite comprobar el rango (el rango especificado incluye 
los valores límite). El siguiente ejemplo muestra países con un área 
de 250,000-300,000 km2.*/

SELECT name, area FROM world
  WHERE area BETWEEN 250000 AND 300000

/*Lee las notas sobre esta tabla. Observe el resultado de ejecutar 
este comando SQL para mostrar el nombre, continente y población de 
todos los países.*/

SELECT name, continent, population FROM world

/*Cómo usar WHERE para filtrar registros. Muestra el nombre de los
 países que tienen una población de al menos 200 millones. 200 millones
  es 200000000, son ocho ceros.*/

SELECT name FROM world
WHERE population > 200000000

/*Proporcione el namey el PIB per cápita para aquellos países con un 
populationmínimo de 200 millones.*/

select name, GDP/population from world
where population > 200000000

/*Muestra el namey populationen millones para los países de 
continent'América del Sur'. Divide la población por 1000000 para 
obtener la población en millones.*/

select name, population/1000000 from world
where continent = 'South America'

/*Muestre el namey populationpara Francia, Alemania, Italia*/
select name, population from world
where name in ('France','Germany','Italy')

/* Mostrar los países que tienen una nameque incluye la palabra 'Unidos'*/
select name from world
where name like '%United%'

/*Dos formas de ser grande: un país es grande si tiene una superficie 
de más de 3 millones de kilómetros cuadrados o si tiene una población 
de más de 250 millones. Muestre los países que son grandes por área o 
grandes por población. Mostrar nombre, población y área.*/
select name, population, area from world
where population > 250000000 or area > 3000000

/*OR exclusivo (XOR). Muestre los países que son grandes por área (más 
de 3 millones) o grandes por población (más de 250 millones), pero no 
ambos. Mostrar nombre, población y área.

- Australia tiene un área grande pero una población pequeña, debería 
incluirse .
- Indonesia tiene una gran población pero un área pequeña, debería 
incluirse .
- China tiene una gran población y una gran área, debe ser excluida .
- Reino Unido tiene una población pequeña y un área pequeña, debe ser 
excluido .*/

SELECT name, population, area
FROM   world
WHERE  ( area > 3000000
AND population < 250000000 )
OR ( area < 3000000
AND population > 250000000 );

/*Muestre el namey populationen millones y el PIB en miles de 
millones para los países de continent'América del Sur'. Use la 
función ROUND para mostrar los valores con dos decimales.

Para América del Sur, muestre la población en millones y el PIB 
en miles de millones, ambos con 2 decimales*/

select name, ROUND (population/1000000,2), ROUND(GDP/1000000000,2) from world
where continent = 'South America'

/*Muestre el namePIB per cápita de aquellos países con un PIB de 
al menos un billón (1000000000000; eso es 12 ceros). Redondea 
este valor al 1000 más cercano.

Muestre el PIB per cápita de los países de un billón de dólares
 con una aproximación de $1000.*/

 select name, ROUND (GDP/population,-3) from world
where GDP >1000000000000

/*Grecia tiene como capital Atenas.

Cada una de las cadenas 'Grecia' y 'Atenas' tiene 6 caracteres.

Muestra el nombre y la mayúscula donde el nombre y la mayúscula 
tienen el mismo número de caracteres.

Puede usar la función LONGITUD para encontrar la cantidad de 
caracteres en una cadena*/

SELECT name, capital FROM world
 WHERE LENGTH(name) = LENGTH(capital)

/*La capital de Suecia es Estocolmo. Ambas palabras comienzan 
con la letra 'S'.

Mostrar el nombre y la mayúscula donde coinciden las primeras 
letras de cada uno. No incluya países donde el nombre y la capital
 sean la misma palabra. Puede utilizar la función IZQUIERDA para 
 aislar el primer carácter. Puede utilizar <>como operador NO IGUAL */

 SELECT name, capital
FROM world
where LEFT(name,1) = LEFT(capital,1)
and name <> capital

/*Guinea Ecuatorial y República Dominicana tienen todas las 
vocales (aeiou) en el nombre. No cuentan porque tienen más de 
una palabra en el nombre.

Encuentra el país que tiene todas las vocales y sin espacios en 
su nombre.

Puede usar la frase name NOT LIKE '%a%'para excluir caracteres 
de sus resultados.
La consulta que se muestra no incluye países como Bahamas y 
Bielorrusia porque contienen al menos una 'a'*/

SELECT name 
from world
where name like '%a%'
and name like '%e%'
and name like '%i%'
and name like '%o%'
and name like '%u%'
and name NOT LIKE '% %'



-- Cambie la consulta que se muestra para que muestre los premios Nobel 
-- de 1950.

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- Muestra quién ganó el premio de literatura de 1962.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- Muestra el año y el tema que ganó el premio 'Albert Einstein'.
SELECT yr, subject
 from nobel
WHERE winner = 'Albert Einstein'

-- Dé el nombre de los ganadores de la 'paz' desde el año 2000, incluido el 2000.
SELECT winner From nobel
where subject = 'peace'
and yr >= 2000