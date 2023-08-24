CREATE TABLE public.count_passanger
(
    id serial,
    total integer,
    "time" time with time zone,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.count_passanger
    OWNER to postgres;