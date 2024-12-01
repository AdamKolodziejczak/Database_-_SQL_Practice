--Clear all rows from all table to avoid re-run inserts (start Id at 1)
TRUNCATE TABLE public."Category" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."Award" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."ShowTime" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."Ticket" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."Cinema" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."MovieGenre" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."Genre" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."MovieActor" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."Actor" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."Director" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."Department" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."University" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."ShowTime" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."Movie" RESTART IDENTITY CASCADE;
TRUNCATE TABLE public."BirthLocation" RESTART IDENTITY CASCADE;

SELECT COUNT(*) FROM public."University"; --checking if rows are cleared

INSERT INTO public."BirthLocation" (country, city, state)
VALUES 
('USA', 'Denver', 'Colorado'),
('USA', 'Detroit', 'Michigan'),
('UK', 'London', 'England'),
('USA', 'New York City', 'New York'),
('UK', 'Haverfordwest', 'Wales'),
('USA', 'Los Angeles', 'California'),
('Canada', 'Kapuskasing', 'Ontario'),
('Canada', 'Gentilly', 'Quebec'),
('USA','Irvine','California'),
('Australia', 'Brisbane', 'Queensland');

SELECT * FROM public."BirthLocation";

INSERT INTO public."University" (name, is_private, color)
VALUES
('Temple University', false, 'cherry'),
('Hofstra University', true, 'blue'),
('University College London', false, 'purple'),
('Fullerton College', false, 'blue'),
('Universite du Quebec a Montreal', false, 'white');

SELECT * FROM public."University";

INSERT INTO public."Department" ("id_University", name)
VALUES 
(1, 'English'),
(2, 'Theatre Arts'),
(3, 'English Literature'),
(4, 'Physics'),
(5, 'Cinema');

SELECT * FROM public."Department";

INSERT INTO public."Movie" (title, release_time, date, rating, budget, gross)
VALUES 
('Step Brothers', '14:00:00', '2008-07-25', 7, 65000000, 128110667),
('The Godfather', '15:00:00', '1972-03-24', 9, 6000000, 246120974),
('The Dark Knight', '18:00:00', '2008-07-18', 9, 185000000, 1009053678),
('Titanic', '20:15:00', '1997-12-19', 7, 200000000, 2187463944),
('Dune', '18:00:00', '2021-10-22', 8, 165000000, 407673628);

SELECT * FROM public."Movie";

INSERT INTO public."Director" (first_name, surname, year_of_birth, "id_BirthLocation", "id_Movie", "id_University")
VALUES 
('Adam', 'McKay', 1959, 1, 1, 1),
('Francis', 'Coppola', 1939, 2, 2, 2),
('Christopher', 'Nolan', 1970, 3, 3, 3),
('James', 'Cameron', 1954,7,4,4),
('Denis','Villeneuve',1967,8,5,5);

SELECT * FROM public."Director";

INSERT INTO public."Actor" (first_name, surname, year_of_birth, "id_BirthLocation", eye_color)
VALUES 
('Will', 'Ferrell', 1967, 9, 'blue'),
('Al', 'Pacino', 1940, 4, 'brown'),
('Chirstian', 'Bale', 1974, 5, 'brown'),
('Leonardo', 'DiCaprio', 1974, 6, 'blue'),
('Timothee', 'Chalamet', 1995,4, 'brown'),
('Jonathan', 'Hude',1948,10,'brown');

SELECT * FROM public."Actor";

INSERT INTO public."MovieActor" ("id_Movie", "id_Actor")
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(4,6);

SELECT * FROM public."MovieActor";

INSERT INTO public."Genre" (type)
VALUES 
('Comedy'),
('Crime'),
('Action'),
('Romance'),
('Sci-Fi'),
('Drama');

SELECT * FROM public."Genre";

INSERT INTO public."MovieGenre" ("id_Movie", "id_Genre")
VALUES 
(1,1), 
(2,2),
(2,6),
(3,2),
(3,3),
(3,6),
(4,4),
(4,6),
(5,5),
(5,3),
(5,6);

SELECT * FROM public."MovieGenre";

INSERT INTO public."Cinema" (cinema_name, location, type)
VALUES 
('Cineplex', 'Toronto', 'IMAX'),
('Landmark', 'Whibty', '3D'),
('Cineplex', 'Oshawa', 'IMAX'),
('Cineplex', 'Erin Mills', 'IMAX'),
('Landmark', 'Windsor', '3D');

SELECT * FROM public."Cinema";

INSERT INTO public."Ticket" (price, "id_Cinema")
VALUES 
(10.00, 1),
(12.50, 2),
(15.00, 3),
(17.50, 4),
(20.00, 5);

SELECT * FROM public."Ticket";

INSERT INTO public."ShowTime" (show_name, show_time, show_duration, "id_Cinema_Ticket", "id_Movie")
VALUES 
('Step Brothers Screening', '15:00:00', 98, 1, 1),
('The Godfather Screening', '16:30:00', 175, 2, 2),
('Titanic Screening', '18:00:00', 160, 3, 3),
('The Dark Night Screening', '19:30:00', 152, 4, 4),
('Dune:Part One Screening', '22:00:00', 155, 5, 5);

SELECT * FROM public."ShowTime";

INSERT INTO public."Award" (award_name, "id_Movie")
VALUES 
('Best Comedy Poster', 1),
('Best Motion Picture', 2),
('Best Action', 3),
('Best Classic Film', 4),
('Best Actor', 5);

SELECT * FROM public."Award";

INSERT INTO public."Category" (category_name, "award_id_Award", "id_Movie_Award")
VALUES 
('Comedy Awards', 1, 1),
('Drama Awards', 2, 2),
('Action Awards', 3, 3),
('DVD Awards', 4, 4),
('Actor', 5, 5);