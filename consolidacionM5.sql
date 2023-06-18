-- Consolidacion M5.
-- 1.- Insertar, modificar y eliminar un Customer, Staff y Actor.

select * from customer;

insert into customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, 
					  last_update, active) values(?);

update customer set <columna1, columna2, ...> = <value> where <condicion>;

delete from <tabla> where <condicion>;

-- 2.- Listar todas las “rental” con los datos del “customer” dado un año y mes.

select rental.*, customer.* from rental join customer on rental.customer_id = customer.customer_id
where extract(month from rental.rental_date) = '05' and extract(year from rental.rental_date) = '2005';

-- 3.- Listar Número (payment_id), Fecha (payment_date) y Total (amount) de todas las “payment”.

select payment_id as Numero, payment_date as Fecha, sum(amount) as Total from payment group by payment_id, payment_date;

SELECT count(payment_id) as numero, TO_CHAR (payment_date, 'yyyy-mm-dd') as fecha, sum(amount) as total
FROM payment
GROUP BY fecha;

-- 4.- Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.

select * from film where film.release_year = '2006' and film.rental_rate > 4;

-- 5.- Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas,
-- si éstas pueden ser nulas, y su tipo de dato correspondiente.

SELECT
t1.TABLE_NAME AS tabla_nombre,
t1.COLUMN_NAME AS columna_nombre,
t1.COLUMN_DEFAULT AS columna_defecto,
t1.IS_NULLABLE AS columna_nulo,
t1.DATA_TYPE AS columna_tipo_dato,
COALESCE(t1.NUMERIC_PRECISION,
t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
PG_CATALOG.COL_DESCRIPTION(t2.OID,
t1.DTD_IDENTIFIER::int) AS columna_descripcion,
t1.DOMAIN_NAME AS columna_dominio
FROM
INFORMATION_SCHEMA.COLUMNS t1
INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
t1.TABLE_SCHEMA = 'public'
ORDER BY
t1.TABLE_NAME;





















































