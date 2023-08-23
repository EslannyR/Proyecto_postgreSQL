/*Nos muestra que pasajero ha tomado al menos un viaje*/
SELECT *FROM passangers
JOIN travel ON (travel.id_passanger = passangers.id);

/*Nos muestra que pasajeros no han tomado un viaje*/
SELECT * FROM passangers
Left JOIN travel ON (travel.id_passanger = passangers.id)
WHERE travel.id IS NULL;

/*En este INNER JOIN nos va a traer todos los datos que coinciden en ambas tablas*/
SELECT * FROM router r
INNER JOIN trains tr ON tr.id = r.id_trains;

/*FUll OUTER JOIN nos trae todos los datos de ambas tabla (router y trains) sin importar si coinciden o no*/
SELECT * FROM router r
FULL OUTER JOIN trains tr ON tr.id = r.id_trains;

/*EN cambio este FULL OUTER JOIN nos muestra los datos que no coinciden con la tabla Router con la tabla Trains, y viceversa, los datos que no coincide de la tabla Trains con la tabla Router*/ 
SELECT * FROM router r
FULL OUTER JOIN trains tr ON tr.id = r.id_trains
WHERE r.id_trains IS NULL OR tr.id IS NULL;

/*Ahora usando LEFT JOIN nos va a traer todos los datos de la tabla Router y solo los datos de la tabla Trains que coincida con Router*/
SELECT * FROM router r
LEFT JOIN trains tr ON tr.id = r.id_trains;

/*En este caso usamos LEFT JOIN para que nos traiga los datos de Router que no coincida con la tabla Trains*/
SELECT * FROM router r
LEFT JOIN trains tr ON tr.id = r.id_trains
WHERE tr.id IS NULL;

/*Ahora usando RIGHT JOIN nos va a traer todos los datos de Trains y solo los datos de Routere que coincida con Trains*/
SELECT * FROM router r
RIGHT JOIN trains tr ON tr.id = r.id_trains;

/*Y si usamos RIGHT JOIN de la siguiente formar nos va a traer todos los datos de Trains que no coincida con Router*/
SELECT * FROM router r
RIGHT JOIN trains tr ON tr.id = r.id_trains
WHERE r.id_trains IS NULL;