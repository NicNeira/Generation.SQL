-- Inner Join nos entrega la interseccion donde se relaciona las 2 tablas 
select c.customerNumber , o.orderNumber, c.customerName 
from customers c , orders o 
where c.customerNumber = o.customerNumber 
and c.customerNumber = 496
order by c.customerNumber desc

select c.customerNumber , o.customerNumber, c.customerName    -- Traer todo ---> Elegimos las tablas que utlizaremos
from  customers c -- Tabla A Desde esta tabla unida 
inner join orders o  -- Tabla B a esta tabla
on c.customerNumber = o.customerNumber-- Se cumpla esta condicion
