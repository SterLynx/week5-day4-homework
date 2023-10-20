-- Week 5 day 4 homework

-- Question 1:
create or replace procedure add_movie2(title varchar, description varchar, release_year integer, language_id integer, rental_duration integer, rental_rate numeric, length integer, replacement_cost numeric(5,2), rating mpaa_rating)
language plpgsql
as $add_movie2$
begin
	insert into film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating) 
	values(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
end
$add_movie2$;

-- Testing with the movie 'Inception'
select *
from film
where title = 'Inception';
call add_movie2('Inception', 
'A thief who steals corporate 
secrets through the use of dream-sharing 
technology is given the inverse task of 
planting an idea into the mind of a C.E.O., 
but his tragic past may doom the project and 
his team to disaster.', 2010, 1, 7, 2.99, 148, 10.00, 'PG-13');

-- Question 2:
select *
from category;

create or replace function get_films_in_category(film_category_id integer)
returns integer
language plpgsql
as $$
declare
    category_count integer;
begin
    select COUNT(*)
    into category_count
    from film_category
    where category_id = film_category_id;

    return category_count;
end;
$$;



-- Testing with category 1
select get_films_in_category(1);
