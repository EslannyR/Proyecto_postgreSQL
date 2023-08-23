CREATE TABLE public.passangers
(
    id serial NOT NULL,
    name character varying(100) NOT NULL,
    address character varying,
    date_birth date,
    CONSTRAINT passangers_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.passangers
    OWNER to postgres;

CREATE TABLE public.stations
(
    id serial NOT NULL,
    name character varying(150) NOT NULL,
    address character varying(150) NOT NULL,
    CONSTRAINT stations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.stations
    OWNER to postgres;

CREATE TABLE public.trains
(
    id serial NOT NULL,
    model character varying(150) NOT NULL,
    capacity integer NOT NULL,
    CONSTRAINT trains_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.trains
    OWNER to postgres;

CREATE TABLE public.router
(
    id serial NOT NULL,
    id_stations integer NOT NULL,
    id_trains integer NOT NULL,
    name character varying(150) NOT NULL,
    CONSTRAINT router_id_stations_foreigh FOREIGN KEY (id_stations)
        REFERENCES public.stations (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT router_id_trains_foreigh FOREIGN KEY (id_trains)
        REFERENCES public.trains (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.router
    OWNER to postgres;

CREATE TABLE public.travel
(
    id serial NOT NULL,
    id_passanger integer NOT NULL,
    id_router integer NOT NULL,
    start date,
    "end" date,
    CONSTRAINT travel_pkey PRIMARY KEY (id_passanger),
    CONSTRAINT travel_id_passanger_foreigh FOREIGN KEY (id_passanger)
        REFERENCES public.passangers (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT travel_id_router_foreigh FOREIGN KEY (id_router)
        REFERENCES public.router (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.travel
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.travel
(
    id integer NOT NULL DEFAULT nextval('travel_id_seq'::regclass),
    id_passanger integer NOT NULL,
    id_router integer NOT NULL,
    start date,
    "end" date,
    CONSTRAINT travel_pkey PRIMARY KEY (id_passanger),
    CONSTRAINT travel_id_passanger_foreigh FOREIGN KEY (id_passanger)
        REFERENCES public.passangers (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT travel_id_router_foreigh FOREIGN KEY (id_router)
        REFERENCES public.router (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.travel
    OWNER to postgres;