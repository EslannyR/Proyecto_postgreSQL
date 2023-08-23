/*Es insertar un nuevo dato en un id ya existente, es actualizar de cierto modo*/
INSERT INTO public.stations(
	id, name, address)
	VALUES (1, 'Santa Ana', 'Catedral 1550' )
	ON CONFLICT(id) DO UPDATE SET name = 'Santa Ana', address= 'Catedral 1550';

/*con Returning nos sirve para agregar un nuevo dato y una vez que lo hace retornarme los datos agregados, asi nos saltamos el paso de hacer un select para saber como quedaron los nuevos datos agregador*/
INSERT INTO public.stations(
	name, address)
	VALUES ('Santa Elena', 'Catedral 1880' )
	RETURNING *;

/*con ilike en esta query esta haciendo que nos muestre todos los nombres de la tabla pasajero que comience con o, OJO: existe ILIKE y LIKE, donde ILIKE no discrimina entre mayúsculas y minúsculas y LIKE si discrimina*/
SELECT name
FROM public.passangers
WHERE name ILIKE 'o%';

/*¿Que modelos esta nulo en la tabla de TRAINS? Aqui es cuando usamos IS/IS NOT*/
SELECT *
FROM public.trains
WHERE model IS NULL;