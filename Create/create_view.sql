/*Creación de Vista Volatil*/

CREATE VIEW public.status_view
 AS
SELECT id, name, address, date_birth,
    CASE
        WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', date_birth) >= 18
        THEN 'Mayor de edad'
        ELSE 'Menor de edad'
    END AS Status
FROM passangers
ORDER BY status DESC;
;

/*Consulta de las vistas*/

SELECT * FROM status_view;

/* Creación de Vista Materializada*/

ALTER TABLE public.status_view
    OWNER TO postgres;


CREATE MATERIALIZED VIEW public.after_april_view
AS
SELECT * FROM travel WHERE travel_start > '2023-04-01'
WITH NO DATA;

ALTER TABLE IF EXISTS public.after_april_view
    OWNER TO postgres;


/*Consulta y carga de la vista*/

REFRESH MATERIALIZED VIEW after_april_view;
SELECT * FROM after_april_view;
