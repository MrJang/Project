


create table boardmember(
 id int auto_increment primary key,
 name varchar(30) not null,
 password varchar(30) not null,
 address varchar(50) not null,
 email varchar(30) not null,
 phone varchar(20) not null,
 gender varchar(5) not null,
 birthYear int not null);