create table accounts(
  id char(20) primary key,
  salt varchar(40),
  hashed varcher(40),
  algo char(5)
);
