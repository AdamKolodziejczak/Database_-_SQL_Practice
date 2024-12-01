--Task 1
--1 a)
SELECT first_name, surname
FROM public."Director"
WHERE "id_BirthLocation" IN (
	SELECT id 
	FROM public."BirthLocation"
	WHERE country = 'Canada');

--1 b)
SELECT title
FROM public."Movie"
WHERE id IN (
	SELECT "id_Movie"
	FROM public."Director"
	WHERE surname = 'Lynch' AND first_name = 'David'); 
--Note There is no David Lynch in this Database,
--Same query but for Christopher Nolan
SELECT title
FROM public."Movie"
WHERE id IN (
	SELECT "id_Movie"
	FROM public."Director"
	WHERE surname = 'Nolan' AND first_name = 'Christopher');

--1 c)
SELECT first_name, surname, budget * 1.40 AS CAD, budget * 151.65 AS JPY, budget * 113.115 AS RUB, budget * 0.95 AS EUR, budget*0.88 AS CHF 
FROM public."Actor" actor
INNER JOIN public."MovieActor" movie_actor ON movie_actor."id_Actor" = actor.id
INNER JOIN public."Movie" movie ON movie_actor."id_Movie" = movie.id
WHERE budget > 1000000;

--1 d)
SELECT first_name, surname
FROM public."Director"
WHERE surname LIKE 'A%' OR surname LIKE 'D%';
--Database doesnt have directo with Surname starting with A or D
-- Try same querry but with C and N
SELECT first_name, surname
FROM public."Director"
WHERE surname LIKE 'C%' OR surname LIKE 'N%';

--1 e)
SELECT title, first_name, surname
FROM public."Movie" movie
INNER JOIN public."MovieGenre" movie_genre ON movie.id = movie_genre."id_Movie"
INNER JOIN public."Genre" genre ON movie_genre."id_Genre"=genre.id
INNER JOIN public."MovieActor" movie_actor ON movie_actor."id_Movie" = movie.id
INNER JOIN public."Actor" actor ON movie_actor."id_Actor" = actor.id
WHERE type = 'Comedy' AND (EXTRACT(YEAR FROM CURRENT_DATE) - year_of_birth) < 40;  
-- Since their is no Actor younger then 40 in a comedy no result
--Trying with younger then 60 belower
SELECT DISTINCT title, first_name, surname
FROM public."Movie" movie
INNER JOIN public."MovieGenre" movie_genre ON movie.id = movie_genre."id_Movie"
INNER JOIN public."Genre" genre ON movie_genre."id_Genre"=genre.id
INNER JOIN public."MovieActor" movie_actor ON movie_actor."id_Movie" = movie.id
INNER JOIN public."Actor" actor ON movie_actor."id_Actor" = actor.id
WHERE type = 'Comedy' AND (EXTRACT(YEAR FROM CURRENT_DATE) - year_of_birth) < 60; 

--1 f)
SELECT first.surname, second.surname
FROM public."Actor" first, public."Actor" second
WHERE first.eye_color = 'blue' AND second.eye_color = 'blue' AND first.surname < second.surname;


--Task 2
--1 a)
SELECT AVG(EXTRACT(YEAR FROM CURRENT_DATE) - year_of_birth)
FROM public."Actor";

--1 b)
SELECT COUNT(DISTINCT country)
FROM public."Actor" actor
INNER JOIN public."MovieActor" movie_actor ON movie_actor."id_Actor" = actor.id
INNER JOIN public."Movie" movie ON movie_actor."id_Movie" = movie.id
INNER JOIN public."BirthLocation" birth_location ON actor."id_BirthLocation" = birth_location.id
WHERE title = 'Beautiful Mind';
--Since no movie of beautiful mind try Dune
SELECT COUNT(DISTINCT country)
FROM public."Actor" actor
INNER JOIN public."MovieActor" movie_actor ON movie_actor."id_Actor" = actor.id
INNER JOIN public."Movie" movie ON movie_actor."id_Movie" = movie.id
INNER JOIN public."BirthLocation" birth_location ON actor."id_BirthLocation" = birth_location.id
WHERE title = 'Titanic';
--Sine their is only two actors from Titanic from two countries

--1 c)
SELECT COUNT(eye_color) AS Green_eye_Actors
FROM public."Actor"
WHERE eye_color = 'Green';
-- Since there is no one with green eye color trying blue now:
SELECT COUNT(eye_color) AS Blue_eye_Actors
FROM public."Actor"
WHERE eye_color = 'blue';

--1 d) 
SELECT COUNT(title)
FROM public."Movie" movie
INNER JOIN public."MovieActor" movie_actor ON movie_actor."id_Movie" = movie.id
INNER JOIN public."Actor" actor ON movie_actor."id_Actor" = actor.id
WHERE first_name = 'Brad' AND surname = 'Pitt';
-- Good Practice to count the movies instead of the id_Movie
--No Brad Pitt in above so trying Chirstian Bale below
SELECT COUNT(title)
FROM public."Movie" movie
INNER JOIN public."MovieActor" movie_actor ON movie_actor."id_Movie" = movie.id
INNER JOIN public."Actor" actor ON movie_actor."id_Actor" = actor.id
WHERE first_name = 'Chirstian' AND surname = 'Bale';

--1 e)
SELECT type, MIN(Budget), AVG(Budget), MAX(Budget)
FROM public."Movie" movie
INNER JOIN public."MovieGenre" movie_genre ON movie.id = movie_genre."id_Movie"
INNER JOIN public."Genre" genre ON movie_genre."id_Genre" = genre.id
GROUP BY type;
--Note that Some Genres have the same min,max and avg as their is only one movie with that genre

--1 f)
SELECT AVG(rating) AS Average_Rating
FROM public."Movie" movie
WHERE movie.id IN (
	SELECT director."id_Movie"
	FROM public."Director" director
	INNER JOIN public."BirthLocation" birth_location ON director."id_BirthLocation" = birth_location.id
	WHERE birth_location.city = 'Toronto'
) OR  movie.id IN (
	SELECT movie_actor."id_Movie"
	FROM public."MovieActor" movie_actor
	INNER JOIN public."Actor" actor ON actor.id = movie_actor."id_Actor"
	WHERE actor.eye_color = 'blue'
);

--1 g) 
SELECT title
FROM public."Movie" movie
INNER JOIN public."MovieActor" movie_actor ON movie.id = movie_actor."id_Movie"
INNER JOIN public."Actor" actor ON actor.id = movie_actor."id_Actor"
INNER JOIN public."BirthLocation" birth_location ON birth_location.id = actor."id_BirthLocation"
GROUP BY movie.title
HAVING COUNT(DISTINCT birth_location.country) >= 2;
--Database only has two actors in titanic from two different countries

--1 h)
SELECT title, COUNT(award_id) AS Awards_Total
FROM public."Movie" movie
LEFT OUTER JOIN public."Award" award ON movie.id = award."id_Movie"
GROUP BY title
ORDER BY COUNT(award_id);
--Each movie only has one award in the database

