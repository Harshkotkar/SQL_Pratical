use blinkitdb;
select * from customers ;
select * from customers where City='Mumbai' or City='Pune' order by Name desc;
select * from customers where not  (City='Mumbai' or City='Pune');
select * from customers where Name like 'a%'; -- will show the name start with a
select * from customers where Name like '%y';   -- will show the name end with y
select * from customers where Name like '%e%';   -- will show the name where "e" arise any where 
select * ,quantity * priceperunit as total_amount from order_details; -- create a new colume total amount where quantity * priceperunit is stored
select avg(quantity * priceperunit )as avg_order from order_details;  
select * from order_details where ProductName="Maggi Noodles";
select ProductName,sum(Quantity) as total_quantity from order_details
 group by ProductName order by total_quantity asc;
 select city,count(customers.CustomerID) as total_customers from customers group by City;