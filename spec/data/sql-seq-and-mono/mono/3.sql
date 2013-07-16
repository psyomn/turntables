--$ the other files should be ignored, and this should be the only one that is
--$ executed

create table accounts (
  id integer primary key autoincrement,
  balance float, 
  name text
);

create table users (
  id integer primary key autoincrement, 
  name text,
  email text,
  bio text
);

create table randomness (
  id integer primary key autoincrement, 
  name text,
  surname text,
  weight float,
  is_superhero boolean
);

