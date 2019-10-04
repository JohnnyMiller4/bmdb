-- create and select database
drop database if exists bmdb;
create database bmdb;
use bmdb;

-- Create movie table
-- DROP TABLE IF EXISTS movie;
create table movie (
	id 				int 			not null primary key auto_increment,
	name 			varchar(100) 	not null unique,
	rating 			varchar(5) 		not null,
	year 			int 			not null,
	director 		varchar(50) 	not null,
    
    CONSTRAINT unq_movie unique (name)
);

-- Add movies
Insert into movie (id, name, rating, year, director)
values (1, 'Star Wars: A New Hope', 'PG', '1977', 'George Lucas');
Insert into movie (id, name, rating, year, director)
values (2, 'Spider-Man: Homecoming', 'PG-13', '2017', 'Jon Watts');
Insert into movie (id, name, rating, year, director)
values (3, 'Avengers: Endgame', 'PG-13', '2019', 'The Russo Brothers');
Insert into movie (id, name, rating, year, director)
values (4, 'Star Wars: The Empire Strikes Back', 'PG', '1980', 'Irvin Kershner');
Insert into movie (id, name, rating, year, director)
values (5, 'Star Wars: Return of the Jedi', 'PG', '1983', 'Richard Marquand');
Insert into movie (id, name, rating, year, director)
values (6, 'Star Wars: The Force Awakens', 'PG-13', '2015', 'J.J. Abrams');
Insert into movie (id, name, rating, year, director)
values (7, 'Star Wars: The Last Jedi', 'PG-13', '2017', 'Rian Johnson');
Insert into movie (id, name, rating, year, director)
values (8, 'Star Wars: The Rise of Skywalker', 'PG-13', '2019', 'J.J. Abrams');
Insert into movie (id, name, rating, year, director)
values (9, 'Blade Runner', 'R', '1982', 'Ridley Scott');
Insert into movie (id, name, rating, year, director)
values (10, 'Blade Runner 2049', 'R', '2017', 'Denis Villeneuve');

create table actor (
	id				int				not null primary key,
    firstName		varchar(25)		not null,
    lastName		varchar(25)		not null,
    gender			varchar(6)		not null,
    birthdate		date			not null,
    
    CONSTRAINT unq_actor unique (firstName, lastName, birthdate)
);

Insert into actor (id, firstName, lastName, gender, birthdate)
values (1, 'Tom', 'Holland', 'Male', '1996-06-01');
Insert into actor (id, firstName, lastName, gender, birthdate)
values (2, 'Robert', 'Downey Jr.', 'Male', '1965-04-04');
Insert into actor (id, firstName, lastName, gender, birthdate)
values (3, 'Mark', 'Hamill', 'Male', '1951-09-25');
Insert into actor (id, firstName, lastName, gender, birthdate)
values (4, 'Harrisosn', 'Ford', 'Male', '1942-07-13');
Insert into actor (id, firstName, lastName, gender, birthdate)
values (5, 'Carrie', 'Fisher', 'Female', '1956-10-21');
Insert into actor (id, firstName, lastName, gender, birthdate)
values (6, 'Daisy', 'Ridley', 'Female', '1992-04-10');
Insert into actor (id, firstName, lastName, gender, birthdate)
values (7, 'Adam', 'Driver', 'Male', '1983-11-19');
Insert into actor (id, firstName, lastName, gender, birthdate)
values (8, 'Chris', 'Evans', 'Male', '1981-06-13');
Insert into actor (id, firstName, lastName, gender, birthdate)
values (9, 'Rutger', 'Hauer', 'Male', '1944-01-23');
Insert into actor (id, firstName, lastName, gender, birthdate)
values (10, 'Ryan', 'Gosling', 'Male', '1980-11-12');

create table cast (
	id				int			not null primary key auto_increment,
    movieID			int			not null,
    actorID			int			not null,
    role			varchar(30)	not null,
    FOREIGN KEY (movieID) references movie(id),
    FOREIGN KEY (actorID) references actor(id),
    -- business rule - combo of actor+movie must be unique
    CONSTRAINT act_mov unique (actorID, movieID)
);

Insert into cast (id, movieID, actorID, role)
values (1, 1, 3, 'Luke Skywalker');
Insert into cast (id, movieID, actorID, role)
values (2, 2, 1, 'Peter Parker/Spider-Man');
Insert into cast (id, movieID, actorID, role)
values (3, 3, 1, 'Peter Parker/Spider-Man');
Insert into cast (id, movieID, actorID, role)
values (4, 2, 2, 'Tony Stark/Iron Man');
Insert into cast (id, movieID, actorID, role)
values (5, 3, 2, 'Tony Stark/Iron Man');
Insert into cast (id, movieID, actorID, role)
values (6, 4, 3, 'Luke Skywalker');
Insert into cast (id, movieID, actorID, role)
values (7, 5, 3, 'Luke Skywalker');
Insert into cast (id, movieID, actorID, role)
values (8, 6, 3, 'Luke Skywalker');
Insert into cast (id, movieID, actorID, role)
values (9, 7, 3, 'Luke Skywalker');
Insert into cast (id, movieID, actorID, role)
values (10, 8, 3, 'Luke Skywalker');
Insert into cast (id, movieID, actorID, role)
values (11, 1, 4, 'Han Solo');
Insert into cast (id, movieID, actorID, role)
values (12, 4, 4, 'Han Solo');
Insert into cast (id, movieID, actorID, role)
values (13, 5, 4, 'Han Solo');
Insert into cast (id, movieID, actorID, role)
values (14, 6, 4, 'Han Solo');
Insert into cast (id, movieID, actorID, role)
values (15, 9, 4, 'Rick Deckard');
Insert into cast (id, movieID, actorID, role)
values (16, 10, 4, 'Rick Deckard');
Insert into cast (id, movieID, actorID, role)
values (17, 1, 5, 'Leia Organa');
Insert into cast (id, movieID, actorID, role)
values (18, 4, 5, 'Leia Organa');
Insert into cast (id, movieID, actorID, role)
values (19, 5, 5, 'Leia Organa');
Insert into cast (id, movieID, actorID, role)
values (20, 6, 5, 'Leia Organa');
Insert into cast (id, movieID, actorID, role)
values (21, 7, 5, 'Leia Organa');
Insert into cast (id, movieID, actorID, role)
values (22, 8, 5, 'Leia Organa');
Insert into cast (id, movieID, actorID, role)
values (23, 6, 6, 'Rey');
Insert into cast (id, movieID, actorID, role)
values (24, 7, 6, 'Rey');
Insert into cast (id, movieID, actorID, role)
values (25, 8, 6, 'Rey');
Insert into cast (id, movieID, actorID, role)
values (26, 6, 7, 'Kylo Ren/Ben Solo');
Insert into cast (id, movieID, actorID, role)
values (27, 7, 7, 'Kylo Ren/Ben Solo');
Insert into cast (id, movieID, actorID, role)
values (28, 8, 7, 'Kylo Ren/Ben Solo');
Insert into cast (id, movieID, actorID, role)
values (29, 3, 8, 'Captain America/Steve Rogers');
Insert into cast (id, movieID, actorID, role)
values (30, 9, 9, 'Roy Batty');
Insert into cast (id, movieID, actorID, role)
values (31, 10, 10, 'K');

-- create a user and grant privileges to that user
DROP USER IF EXISTS bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;
-- you don't want the user to log-in under the root. User creation is for those who use the Java application