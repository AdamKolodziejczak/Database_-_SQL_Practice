-- BirthLocation table
DROP TABLE IF EXISTS public."BirthLocation" CASCADE;
CREATE TABLE public."BirthLocation" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    country VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    CONSTRAINT "BirthLocation_pk" PRIMARY KEY (id)
);
ALTER TABLE public."BirthLocation" OWNER TO postgres;

-- Movie table
DROP TABLE IF EXISTS public."Movie" CASCADE;
CREATE TABLE public."Movie" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    title VARCHAR NOT NULL,
    release_time TIME NOT NULL,
    date DATE NOT NULL,
    rating smallint NOT NULL,
    budget float NOT NULL,
    gross float NOT NULL,
    CONSTRAINT "Movie_pk" PRIMARY KEY (id)
);
ALTER TABLE public."Movie" OWNER TO postgres;

-- University table
DROP TABLE IF EXISTS public."University" CASCADE;
CREATE TABLE public."University" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR NOT NULL,
    is_private boolean NOT NULL,
    color VARCHAR NOT NULL,
    CONSTRAINT "University_pk" PRIMARY KEY (id)
);
ALTER TABLE public."University" OWNER TO postgres;

-- Director table
DROP TABLE IF EXISTS public."Director" CASCADE;
CREATE TABLE public."Director" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR NOT NULL,
    surname VARCHAR NOT NULL,
    year_of_birth smallint NOT NULL,
    "id_BirthLocation" smallint NOT NULL,
    "id_Movie" smallint,
    "id_University" smallint,
    CONSTRAINT "Director_pk" PRIMARY KEY (id),
    CONSTRAINT "Director_BirthLocation_fk" FOREIGN KEY ("id_BirthLocation") 
        REFERENCES public."BirthLocation"(id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Director_Movie_fk" FOREIGN KEY ("id_Movie") 
        REFERENCES public."Movie"(id) MATCH SIMPLE ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Director_University_fk" FOREIGN KEY ("id_University") 
        REFERENCES public."University"(id) MATCH SIMPLE ON DELETE SET NULL ON UPDATE CASCADE
);
ALTER TABLE public."Director" OWNER TO postgres;

-- Actor table
DROP TABLE IF EXISTS public."Actor" CASCADE;
CREATE TABLE public."Actor" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR NOT NULL,
    surname VARCHAR NOT NULL,
    year_of_birth smallint NOT NULL,
    "id_BirthLocation" smallint NOT NULL,
	eye_color VARCHAR(20),
    CONSTRAINT "Actor_pk" PRIMARY KEY (id),
    CONSTRAINT "Actor_BirthLocation_fk" FOREIGN KEY ("id_BirthLocation") 
        REFERENCES public."BirthLocation"(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE public."Actor" OWNER TO postgres;

-- Department table
DROP TABLE IF EXISTS public."Department" CASCADE;
CREATE TABLE public."Department" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "id_University" smallint NOT NULL UNIQUE, -- Unique constraint ensures one-to-one relationship
    name VARCHAR NOT NULL,
    CONSTRAINT "Department_pk" PRIMARY KEY (id),
    CONSTRAINT "Department_University_fk" FOREIGN KEY ("id_University") 
        REFERENCES public."University"(id) MATCH SIMPLE ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE public."Department" OWNER TO postgres;

-- Remaining tables and constraints can be added similarly...

-- MovieActor table
DROP TABLE IF EXISTS public."MovieActor" CASCADE;
CREATE TABLE public."MovieActor" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "id_Movie" smallint NOT NULL,
    "id_Actor" smallint NOT NULL,
    CONSTRAINT "MovieActor_pk" PRIMARY KEY (id),
    CONSTRAINT "MovieActor_Movie_fk" FOREIGN KEY ("id_Movie") 
        REFERENCES public."Movie"(id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "MovieActor_Actor_fk" FOREIGN KEY ("id_Actor") 
        REFERENCES public."Actor"(id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
ALTER TABLE public."MovieActor" OWNER TO postgres;

-- Genre table
DROP TABLE IF EXISTS public."Genre" CASCADE;
CREATE TABLE public."Genre" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    type VARCHAR NOT NULL,
    CONSTRAINT "Genre_pk" PRIMARY KEY (id)
);
ALTER TABLE public."Genre" OWNER TO postgres;

-- MovieGenre table
DROP TABLE IF EXISTS public."MovieGenre" CASCADE;
CREATE TABLE public."MovieGenre" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "id_Movie" smallint NOT NULL,
    "id_Genre" smallint NOT NULL,
    CONSTRAINT "MovieGenre_pk" PRIMARY KEY (id),
    CONSTRAINT "MovieGenre_Movie_fk" FOREIGN KEY ("id_Movie") 
        REFERENCES public."Movie"(id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "MovieGenre_Genre_fk" FOREIGN KEY ("id_Genre") 
        REFERENCES public."Genre"(id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
ALTER TABLE public."MovieGenre" OWNER TO postgres;

-- Cinema table
DROP TABLE IF EXISTS public."Cinema" CASCADE;
CREATE TABLE public."Cinema" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    cinema_name VARCHAR NOT NULL,
    location VARCHAR NOT NULL,
    type VARCHAR NOT NULL,
    CONSTRAINT "Cinema_pk" PRIMARY KEY (id)
);
ALTER TABLE public."Cinema" OWNER TO postgres;

-- Ticket table
DROP TABLE IF EXISTS public."Ticket" CASCADE;
CREATE TABLE public."Ticket" (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    price float8 NOT NULL,
    "id_Cinema" smallint NOT NULL,
    CONSTRAINT "Ticket_pk" PRIMARY KEY (id),
    CONSTRAINT "Ticket_Cinema_fk" FOREIGN KEY ("id_Cinema") 
        REFERENCES public."Cinema"(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE public."Ticket" OWNER TO postgres;

-- ShowTime table
DROP TABLE IF EXISTS public."ShowTime" CASCADE;
CREATE TABLE public."ShowTime" (
    show_id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    show_name VARCHAR NOT NULL,
    show_time TIME NOT NULL,
    show_duration smallint,
    "id_Cinema_Ticket" smallint NOT NULL,
    "id_Movie" smallint NOT NULL,
    CONSTRAINT "ShowTime_pk" PRIMARY KEY (show_id),
    CONSTRAINT "ShowTime_Ticket_fk" FOREIGN KEY ("id_Cinema_Ticket") 
        REFERENCES public."Ticket"(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "ShowTime_Movie_fk" FOREIGN KEY ("id_Movie") 
        REFERENCES public."Movie"(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE public."ShowTime" OWNER TO postgres;

-- Award table
DROP TABLE IF EXISTS public."Award" CASCADE;
CREATE TABLE public."Award" (
    award_id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    award_name VARCHAR NOT NULL,
    "id_Movie" smallint NOT NULL,
    CONSTRAINT "Award_pk" PRIMARY KEY (award_id),
    CONSTRAINT "Award_Movie_fk" FOREIGN KEY ("id_Movie") 
        REFERENCES public."Movie"(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE public."Award" OWNER TO postgres;

-- Category table
DROP TABLE IF EXISTS public."Category" CASCADE;
CREATE TABLE public."Category" (
    category_id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    category_name VARCHAR NOT NULL,
    "award_id_Award" smallint NOT NULL,
    "id_Movie_Award" smallint NOT NULL,
    CONSTRAINT "Category_pk" PRIMARY KEY (category_id),
    CONSTRAINT "Category_Award_fk" FOREIGN KEY ("award_id_Award") 
        REFERENCES public."Award"(award_id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE public."Category" OWNER TO postgres;

INSERT INTO public."Movie"(title, release_time, date, rating, budget, gross) VALUES
('Inception', '02:00:00', '2010-07-16', 9, 160000000, 836800000),
('Interstellar', '01:00:00', '2014-11-07', 9, 165000000, 730000000),
('Parasite', '02:00:00', '2019-05-30', 9, 11400000, 263000000),
('Dune', '02:30:00', '2021-10-22', 8, 165000000, 435000000),
('10 Things I Hate About You', '03:00:00', '1999-03-31', 7, 53700000, 60413950);

INSERT INTO public."BirthLocation" (id, country, city, state) VALUES
(1,'England', 'London', 'London'),
(2,'South Korea', 'Bongdeokdong', 'Daegu'),
(3,'Canada', 'Becancour', 'Quebec'),
(4,'U.S.', 'New York', 'New York');


INSERT INTO public."Director" (first_name, surname, year_of_birth, "id_BirthLocation", "id_Movie", "id_University") VALUES
('Christopher', 'Nolan', 1970, 1, 1, 1),
('Bong', 'Joon-ho', 1967, 2, 2, 2),
('Denis', 'Villeneuve', 1963, 3, 5, NULL),
('Martin', 'Scorsese', 1942, 4, NULL, 4);



SELECT first_name, surname
FROM public."Director"
WHERE "id_BirthLocation" IN (
	SELECT id 
	FROM public."BirthLocation"  
	WHERE country='Canada' );

SELECT title
FROM public."Movie"
WHERE id IN (
	SELECT "id_Movie" 
	FROM public."Director" 
	WHERE first_name='David' AND surname = 'Lynch')



SELECT first_name, surname, budget AS USD, budget*1.3 AS CAD, budget*150 AS JPY, budget*100 AS RUB, budget*0.9 AS EUR, budget*0.95 AS CHF
FROM public."Actor" a
JOIN public."MovieActor" ma ON a.id = ma."id_Actor"
JOIN public."Movie" m ON ma."id_Movie" = m.id
WHERE budget > 1000000000



SELECT first_name, surname
FROM public."Director"
WHERE surname LIKE 'A%' OR surname LIKE 'D%'



SELECT title
FROM public."Movie"
WHERE id in (
	SELECT "id_Movie"
	FROM public."MovieGenre"
	WHERE "id_Genre" in(
		SELECT id
		FROM public."Genre"
		WHERE type = 'comedy'
		)
	) AND id in (
		SELECT "id_Movie"
		FROM public."MovieActor"
		WHERE "id_Actor" in(
			SELECT id
			FROM public."Actor"
			WHERE (2024-year_of_birth)<40 
		)
	);

SELECT m.title
FROM public."Movie" m
JOIN public."Genre" g ON m.id = g.id
JOIN public."Actor" a ON (SELECT "id_Actor" FROM public."MovieActor" WHERE m.id = "id_Movie")  = a.id
WHERE g.type='comedy' AND (2024-year_of_birth)<40;


SELECT A.surname, B.suname
FROM public."Actor" A, public."Actor" B
WHERE A.eye_color=B.eye_color AND A.surname< B.surname;









SELECT avg(2024-year_of_birth)
FROM public."Actor"

SELECT count(DISTINCT country) as Countries_Total
FROM public."BirthLocation" 
WHERE id IN(
	SELECT "id_BirthLocation"
	FROM public."Actor"
	WHERE id in (
		SELECT "id_Actor"
		FROM public."MovieActor"
		WHERE "id_Movie" in (
			SELECT id
			FROM public."Movie"
			WHERE title = 'Beautiful Mind'
		)
	)
);

SELECT COUNT(eye_color) AS Total_Eye_Color
FROM public."Actor"
WHERE eye_color='green';

SELECT COUNT(title) as Number_of_Pitt_Movies
FROM public."Movie"
WHERE id IN (
	SELECT "id_Movie"
	FROM public."MovieActor"
	WHERE "id_Actor" IN (
		SELECT id
		FROM public."Actor"
		WHERE first_name='Brad' and surname='Pitt'
	)
);

SELECT type, MIN(budget), AVG(budget),MAX(budget)
FROM public."Movie" M, public."Genre" G, public."MovieGenre" MG
WHERE G.id = MG."id_Movie" AND M.id = MG."id_Genre"
GROUP BY type


SELECT title, AVG(rating) 
FROM public."Mobie"
WHERE
GROUP BY title
HAVING
