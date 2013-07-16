--$ Add randomness

create table randomness (
  id integer primary key autoincrement, 
  name text,
  surname text,
  weight float,
  is_superhero boolean
);
