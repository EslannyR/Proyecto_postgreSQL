BEGIN; -- Inicia una transacción.

INSERT INTO public.trains (
    model, capacity) -- Inserta datos en la tabla "trains" en las columnas "model" y "capacity".
VALUES (
    'Modelo trans', 231); -- Inserta el valor 'Modelo trans' en la columna "model" y el valor 231 en la columna "capacity".

INSERT INTO public.stations (
    id, name, address) -- Inserta datos en la tabla "stations" en las columnas "id", "name" y "address".
VALUES (
    100, 'Estación Trans', 'direccion de trans 100'); -- Inserta el valor 100 en la columna "id", 'Estación Trans' en la columna "name" y 'direccion de trans 100' en la columna "address".

COMMIT; -- Confirma la transacción, aplicando los cambios realizados en las tablas "trains" y "stations".

/* En este caso supongamos que la inserción de stations con id = 100 ya existe,
esto provoca una alerta y hace que la transicción no se completará,
por lo que no se guardara datos a ninguna tabla pese a que la inserción de trains este bien.*/
