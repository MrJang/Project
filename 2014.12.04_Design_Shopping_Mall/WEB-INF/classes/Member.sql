use inno;
drop table Member;
create table Member(
	id varchar(20) primary key,
	name varchar(20) not null,
	password varchar(30) not null,
	address varchar(40)not null,
	phone varchar(25) not null,
	email varchar(30) not null,
	birthYear int not null,
	gender varchar(2) not null,
	authority varchar(5) not null
);