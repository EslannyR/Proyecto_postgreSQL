-- Creamos otra base de datos
CREATE DATABASE remota
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Chile.1252'
    LC_CTYPE = 'Spanish_Chile.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

--Creamos la tabla Vip de la BD remota
CREATE TABLE IF NOT EXISTS public.vip
(
    id integer NOT NULL DEFAULT nextval('vip_id_seq'::regclass),
    date date
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.vip
    OWNER to postgres;

GRANT ALL ON TABLE public.vip TO postgres;

GRANT ALL ON TABLE public.vip TO user_consulta;

--Activamos la extensión de dblink
CREATE EXTENSION dblink;

--Si no lo hiciste en la creación de la tabla Vip, te recuerdo darle todos los derechos al rol user_consulta de la siguiente forma:
GRANT ALL ON TABLE public.vip TO user_consulta;

--Y ya podemos hacer uso de dblink entre nuestras bases de datos remota y transportation. Obsercación, esta query la realice en estando dentro de mi BD transportation.

SELECT * FROM passangers -- Selecciona todas las columnas de la tabla "passangers".
JOIN -- Inicia una operación de JOIN (unión).
dblink ('dbname=remota 
		port=5432 
		host=127.0.0.1 
		user=user_consulta 
		password=etc123', -- Establece los parámetros de conexión a una base de datos remota usando dblink.
	   'SELECT id, date FROM vip') -- Ejecuta una consulta en la base de datos remota para seleccionar las columnas "id" y "date" de la tabla "vip".
	   AS datos_remotos (id integer, date date) -- Asigna los resultados de la consulta remota a una tabla llamada "datos_remotos" con las columnas "id" e "date" de tipos integer y date respectivamente.
USING (id); -- Realiza el JOIN utilizando la columna "id" para unir los resultados locales y remotos.
