-- create and select database
drop database if exists bmdb;
create database bmdb;
use bmdb;

-- Create movie table
-- DROP TABLE IF EXISTS movie;
create table movie (
	id 				int 			not null primary key,
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

create table cast (
	id				int			not null primary key,
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

-- create a user and grant privileges to that user
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;