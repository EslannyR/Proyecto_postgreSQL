INSERT INTO public.passangers(
	name, address, date_birth)
	VALUES (
		'Frasier Sulland', '26866 Talisman Hill', '1999-02-16',
		'Donelle Bachmann', '854 Cherokee Junction', '1997-04-14',
		'Darnell Tivenan', '27828 Hagan Avenue', '1997-02-13',
		'Frances Clancy', '81158 5th Drive', '1995-01-07',
		'Madalyn Bridywater', '58430 Blackbird Avenue', '1999-03-04',
		'Malia Osinin', '0 Russell Way', '1997-10-17',
		'Hollyanne Walkinshaw', '94 Nancy Junction', '1997-05-29',
		'Daffy Kettlesting', '37542 South Plaza', '1998-02-15',
		'Malva Beaglehole', '04 Ohio Park', '1995-10-14',
		'Fabio Adriani', '878 Golf Course Circle', '1998-09-30');

INSERT INTO public.stations(name, address)
	VALUES ('Baquedano', 'Av. Libertador Bernardo O''Higgins 334'),
    ('Los Leones', 'Av. Providencia 628'),
    ('Universidad de Chile', 'Av. Libertador Bernardo O''Higgins 1050'),
    ('La Moneda', 'Av. Libertador Bernardo O''Higgins 1875'),
    ('Santa Lucía', 'Av. Libertador Bernardo O''Higgins 464'),
    ('Manuel Montt', 'Av. Providencia 2059'),
    ('Ñuñoa', 'Av. Irarrázaval 5100'),
    ('Franklin', 'Av. Matucana 422'),
    ('Pudahuel', 'Av. San Pablo 8770'),
    ('Plaza Egaña', 'Av. Larraín 5862');

INSERT INTO public.trains(model, capacity)
	VALUES ('MetroTrain 1000', 200),
    ('ExpressRail 200', 150),
    ('CityTransit 300', 180),
    ('RapidExpress 400', 220),
    ('UrbanShuttle 500', 120);

INSERT INTO public.router(id_stations, id_trains, name)
	VALUES (1, 1, 'Línea 1: Baquedano a Los Leones'),
    	(2, 2, 'Línea 2: Los Leones a Universidad de Chile'),
    	(3, 3, 'Línea 3: Universidad de Chile a La Moneda'),
    	(4, 4, 'Línea 4: La Moneda a Santa Lucía'),
    	(5, 5, 'Línea 5: Santa Lucía a Manuel Montt');

