create table table1 (
  id int,
  age int,
  gender varchar(10)
);

create table table2 (
  id int,
  age int,
  gender varchar(10)
);

insert into table1(id, age, gender) values 
(1,23, "F"),
(2,24, "M"),
(3,25, "F"),
(4,26, "M"),
(5,27, "M");

insert into table2(id, age, gender) values 
(1,23, "F"),
(2,29, "M"),
(3,25, "F"),
(4,28, "M"),
(5,27, "M");

SELECT *
FROM table1 t1
LEFT JOIN table2 t2
  ON t1.id = t2.id
WHERE
    NOT (t1.id <=> t2.id)
 OR NOT (t1.age <=> t2.age)
 OR NOT (t1.gender <=> t2.gender)

UNION

SELECT *
FROM table1 t1
RIGHT JOIN table2 t2
  ON t1.id = t2.id
WHERE
    NOT (t1.id <=> t2.id)
 OR NOT (t1.age <=> t2.age)
 OR NOT (t1.gender <=> t2.gender);
