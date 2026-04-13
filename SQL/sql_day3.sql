CREATE DATABASE studentdb;

CREATE TABLE student(
std_id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE,
password VARCHAR(255) NOT NULL
);


# this is the apporipirate  syntax because you don`t need to remember the coloumn name and you can just miss the values as well if you dont want to insert data 
INSERT INTO studentdb.student (std_id,name,email,password)
VALUES(NULL, "Ashish","basnetashish@gmail.com", "1234");


# imp and benefit 
insert into student(name,password)
values("Ashish ","234");


# multiple rows can also be passed 

insert into student
values(null,"Manish","manish@gmail.com","543"),
(null,"anish","anish@gmail.com","43"),
(null,"sanish","sanish@gmail.com","3"),
(null,"nish","nish@gmail.com","5"),
(null,"Man","man@gmail.com","53");