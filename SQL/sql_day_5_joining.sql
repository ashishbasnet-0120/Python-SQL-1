
-- joins 
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount INT
);

-- Customers
INSERT INTO customers VALUES
(1, 'Ashish'),
(2, 'Ravi'),
(3, 'Sita'),
(4, 'Gita');

-- Orders
INSERT INTO orders VALUES
(101, 1, '2024-01-10'),
(102, 2, '2024-01-11'),
(103, 1, '2024-01-12'),
(104, 5, '2024-01-13'); -- Notice: customer_id 5 does NOT exist

-- Payments
INSERT INTO payments VALUES
(1001, 101, 500),
(1002, 102, 1000),
(1003, 105, 700);

select *
from payments;

select *
from orders;

select *
from customers;



-- cross join

select *
from customers as t1
cross join orders as t2;


-- inner join
-- For each row of table1, SQL checks ALL rows of table2 and matches based on the condition

select *
from customers as t1
inner join orders as t2
on t1.customer_id=t2.customer_id;

-- “Take one row from customers → compare with EVERY row in orders → keep all matches”


-- left join 
select *
from customers as t1
left join orders as t2
on t1.customer_id =t2.customer_id;

-- right join
select *
from customers as t1
right join orders as t2
on t1.customer_id=t2.customer_id;


-- sql set operations 
/* Conditions
Same number of columns
Same column order (position matters)
Compatible data types
Column names come from first query
ORDER BY only at the end*/
-- union
 select *
 from payments
 union
 select *
 from orders;
 
 
 -- union all
 select *
 from payments
 union all
 select *
 from orders;
 
 select *
from customers as t1
left join orders as t2
on t1.customer_id =t2.customer_id
union
select *
from customers as t1
right join orders as t2
on t1.customer_id=t2.customer_id;

 
-- self join 
create table self_join(
user_id integer primary key,
name varchar(255) not null,
age integer not null,
emrgency_contact integer);

insert into self_join values(1,"Ashish",34,11),
(2,"Manish",32,1),
(3,"Suman",23,1),
(4,"Suraj",34,31),
(8,"Sita",31,3),
(11,"Gita",29,8);

select*
from self_join;

-- self join
select *
from self_join as t1
inner  join self_join as t2
on t1.emrgency_contact = t2.user_id;




-- joining with multiple columns 
CREATE TABLE items(
    order_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT
);

INSERT INTO items (order_id, product_id, customer_id) VALUES
(1, 101, 10),
(2, 101, 20);

CREATE TABLE product_prices (
    product_id INT,
    customer_id INT,
    price INT
);

INSERT INTO product_prices (product_id, customer_id, price) VALUES
(101, 10, 500),
(101, 20, 600);

select *
from items;

select *
from product_prices;



-- performing this join can cause duplication of data 
select *
from items as t1
join product_prices as t2
on t1.product_id=t2.product_id;

-- instead joining through multiple columns


/*
Use multiple columns in JOIN when:

Composite key exists (data identified by more than 1 column)
Single column causes duplicate or wrong matches
*/

select *
from items as t1
join product_prices as t2
on t1.product_id=t2.product_id and t1.customer_id=t2.customer_id;


-- joinig multiple tables 


select *
from customers as t1 
join orders as t2
on t1.customer_id=t2.customer_id
join payments as t3
on t2.order_id=t3.order_id; 
