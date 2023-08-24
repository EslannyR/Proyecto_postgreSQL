/*Creación del PL con codigo*/

DO $$
DECLARE
    rec record; -- Declara una variable "rec" del tipo "record" para almacenar una fila de la tabla.
    contador integer := 0; -- Inicializa una variable "contador" con el valor 0.
BEGIN
    FOR rec IN SELECT * FROM passangers LOOP -- Inicia un bucle FOR para iterar a través de las filas de la tabla "passangers".
        RAISE NOTICE 'UN PASAJERO SE LLAMA %', rec.name; -- Genera una notificación con el nombre del pasajero actual.
        contador := contador + 1; -- Incrementa el contador en 1.
    END LOOP; -- Finaliza el bucle FOR.
    RAISE NOTICE 'El conteo es %', contador; -- Genera una notificación con el valor final del contador.
END
$$
LANGUAGE PLPGSQL; -- Define el lenguaje como PL/pgSQL para el bloque DO.

/*esta es la forma de convertir el PL en una función para poder consultarla mas facil en el futuro*/
CREATE OR REPLACE FUNCTION importPL()
	RETURNS integer
AS $$
DECLARE
	rec record;
	contador integer := 0;
BEGIN
	FOR rec IN SELECT * FROM passangers LOOP
		RAISE NOTICE 'UN PASAJERO SE LLAMA %', rec.name;
		contador := contador + 1;
	END LOOP;
	RAISE NOTICE 'El conteo ess %', contador;
	RETURN contador;
END
$$
LANGUAGE PLPGSQL

/*Consulta de la funcion que contiene el PL anterior*/
SELECT importPL();


/*Creación una PL usando funciones de PgAdmin y asi queda el codigo:*/
CREATE OR REPLACE FUNCTION public."ImportantPL"()
    RETURNS integer
    LANGUAGE 'plpgsql'

AS $BODY$
DECLARE
	rec record;
	contador integer := 0;
BEGIN
	FOR rec IN SELECT * FROM passangers LOOP
		RAISE NOTICE 'UN PASAJERO SE LLAMA %', rec.name;
		contador := contador + 1;
	END LOOP;
	RAISE NOTICE 'El conteo ess %', contador;
	RETURN contador;
END
$BODY$;

ALTER FUNCTION public."ImportantPL"()
    OWNER TO postgres;

-- Asi se hace el llamado:
SELECT public."ImportantPL"(); --como el nombre tiene mayusculas por eso lo pone entre comillas para respetar las mayusculas