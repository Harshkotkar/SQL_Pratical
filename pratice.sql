create table student(id integer,name varchar(20),marks integer,primary key(id));
insert into student values(01,"jon",81);
insert into student values(02,"scarlet",73);
insert into student values(03,"anni",70);
insert into student values(04,"ben",89);
insert into student values(05,"ben",82);
select * from student;
select name ,id from student where marks>75 order by left(name,3)asc,id asc;
update student set name="ben" where id=4;
select distinct name from student;
delete s1 from student as s1
inner join student as s2
where s1.name<s2.name and s1.id=s2.id;
select * from student;
select count(name) from student;
