/*Usamos COALESCE() para seleccionar la columna name y si el valor es nulo, en su lugar mostrar "No Aplica" y al poner AS name es para que no se cambie el nombre del encabezado de la columna name*/
SELECT id, COALESCE(name, 'No Aplica')AS name, address, date_birth
	FROM public.passangers WHERE id = 1;

/*También esta NULLIF que compara dos valores y devuelve NULL si los valores son iguales, de lo contrario, devuelve el primer valor. En resumen, su función es proporcionar una forma de manejar casos donde dos valores sean iguales y deseamos que se conviertan en NULL. */
/*Este se usa en casos muy especificos*/
SELECT NULLIF (0,0);

/*En el caso de GREATEST te permite comparar un arreglo de valores y te retorna el mayor*/
SELECT GREATEST (0,1,2,4,1,7,2,4);

/*En el caso de LEAST te permite comparar un arreglo de valores y te retorna el menor*/
SELECT LEAST (0,1,2,4,1,7,2,4);

/*Ahora con CASE de la siguiente forma nos ayuda mostrar datos bajo una condición en una columna nueva, en este caso lo usamos para saber que pasajeros son menores o mayores de edad*/
SELECT id, name, address, date_birth,
CASE
WHEN date_birth > '2005-01-01' THEN
'Menor de edad'
ELSE
'Mayor de edad'
END AS Status /*Asi podemos ponerle un nombre diferente a la columna CASE*/
	FROM public.passangers;


/*En esta ocación hacemos una consulta donde nos generara dos tablas adicionales,
1er=> que nos devuelva la iniciales de los nombres con S, Q y L, y las que no corresponde a estos iniciales sobre marcar con guion corto.
2da=> Nos diga quienes son menores y mayores de edad.*/
SELECT id, name,
CASE /*mezclamos el case con ilike*/
WHEN name ILIKE 'O%' THEN 'S'
WHEN name ILIKE 'P%' THEN 'Q'
WHEN name ILIKE 'P%' THEN 'L'
ELSE '-'
END As Iniciales,
address, date_birth,
CASE
WHEN DATE_PART('year', CURRENT_DATE)-DATE_PART('year', date_birth) >= 18 /*hacemos un case similar al anterior query pero usando formulas que es lo ideal para la precisión de la información requerida*/
THEN 'Mayor de edad'
ELSE 'Menor de edad'
END AS Status
FROM passangers
ORDER BY iniciales DESC; /*Y hacemos un Order By para que me muestre las iniciales con guion en la parte inferior de la tabla*/
