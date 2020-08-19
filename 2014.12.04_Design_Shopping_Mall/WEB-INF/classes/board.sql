use inno;
drop table board;
CREATE TABLE board (
	writer VARCHAR(20) NULL DEFAULT NULL,
	subject VARCHAR(50) NULL DEFAULT NULL,
	content TEXT NULL DEFAULT NULL,
	ip VARCHAR(20)	 NULL DEFAULT NULL,
	recommend VARCHAR(100) NULL DEFAULT NULL,
	filename VARCHAR(50) NULL DEFAULT NULL,
	num INT(20) NOT NULL AUTO_INCREMENT,
	pageNum INT(20) NOT NULL AUTO_INCREMENT,
	readcount INT(11) NULL DEFAULT '0',
	reg_date DATETIME NOT NULL,
	uploadFile MultipartFile NULL DEFAULT NULL
	PRIMARY KEY (num)
)



CREATE TABLE board (
	writer VARCHAR2(20) NULL ,
	subject VARCHAR2(50) NULL ,
	content long NULL ,
	ip VARCHAR2(20) NULL ,
	recommend VARCHAR2(100) NULL ,
	filename VARCHAR2(50) NULL ,
	num Number(20) NOT NULL primary key,
	pageNum Number(20) NOT NULL,
	readcount Number(11) NULL ,
	reg_date DATE NOT NULL,
	uploadFile BFILE NULL
)