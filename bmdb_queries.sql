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
	where c.movieID = (select id from movie where name = 'Spider-Man: Homecoming');

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