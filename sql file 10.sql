use jdbc;
select * from emp;
insert into emp values
(2,'spiderman','strength',20000),
(3,'captain america','strength',250000),
(4,'iron man','intelegence',320000),
(5,'thor','thunder',300000);

select name from emp order by salary desc 
limit 2;

select * from emp where salary>200000;
