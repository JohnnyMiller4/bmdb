-- Select all movies
select * from movie;

-- Select all actors
select concat(a.firstName, ' ', a.lastName) 'Actor Name' from actor a;

-- Actors older than me
select count(*) 'Actors Older Than Me'
	from actor
    where birthDate < '1995-01-27';

-- list all actors for a particular movie
select * from actor a
	join cast c
    on c.actorID = a.id
    where c.movieID = 2;
    
-- select a movie by name
select name, year, rating, director
	from movie
	where name = 'Star Wars: A New Hope';

-- Select actor by movie
select *
	from actor a
	join cast c
		on c.actorID = a.id
	where c.movieID = (select id from movie where name = 'Star Wars: A New Hope');

-- Three table join, listing all films, actors, and their respective roles
select m.name 'Film', concat(a.firstName, " ", a.lastName) 'Actor', c.role 'Role'
	from cast c
	join movie m
	on m.id = movieID
	join actor a
	on a.id = actorID
    order by m.year
    ;

-- another way to join
select * from actor, cast
	where actor.id = cast.actorID;
    
-- example of a unique constraint violation
insert into movie (name, year, rating, director)
values ('Spider-Man: Homecoming', 2017, 'PG-13', 'Jon Watts');

-- example of a Foreign Key violation
insert into cast (movieID, actorID, role)
	values (99, 99, 'test');
    
-- Add actors
/*insert into customer (name, city, state, isCorpAcct, creditLimit)
values
	('Dummy3', 'Dummy', 'DY', 0, 5555.55),
	('Dummy4', 'Dummy', 'DY', 0, 5555.55),
    ('Dummy5', 'Dummy', 'DY', 0, 5555.55)*/
    
select * from actor;

-- all Roberts born before 1970
select * from actor
	where firstName = 'Robert'
    and birthdate < '1970-01-01';
    
-- all actors born before 1960 or after 1990
select * from actor
	where birthdate < '1960-01-01'
		or birthdate > '1989-12-31';
        
-- and/or example
select * from actor
	where firstName like 'R%'
		and (lastName = 'Downey Jr.'
			or lastname = 'Smith');
            
select * from actor
	where firstName like 'R%'
		and (lastName = 'Downey Jr.'
			or lastname = 'Hauer');