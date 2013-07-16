--$ Add users to the system
create table users (
  id integer primary key autoincrement, 
  name text,
  email text,
  bio text
);
