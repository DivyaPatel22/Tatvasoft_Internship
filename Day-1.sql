--Creating table name customer
CREATE TABLE customer (
   customer_id SERIAL PRIMARY KEY, -- Auto-incrementing ID
   first_name VARCHAR(100) NOT NULL, -- Customer's first name
   last_name VARCHAR(100) NOT NULL, -- Customer's last name
   email VARCHAR(255) UNIQUE NOT NULL, -- Unique email
   created_date TIMESTAMPTZ NOT NULL DEFAULT NOW(), -- Record creation timestamp
   updated_date TIMESTAMPTZ -- Optional update timestamp
);

--slecting all 
SELECT * FROM customer;

--droping/deleting tabel
Drop TABLE IF EXISTS orders ;

-- how to add new column : 
ALTER TABLE customer ADD COLUMN age INTEGER  ;

--IF YOU WANT TO delete that column use DROP COLUMN insted of add column

--to rename column use RENAME COLUMN :
ALTER TABLE customer RENAME COLUMN customer_id to id;
ALTER TABLE customer RENAME COLUMN id to customer_id;

--HOW to rename table :
ALTER TABLE customer RENAME TO people ;

-- how to insert element into it :
INSERT INTO people(first_name, last_name, email, created_date, updated_date, age)
VALUES ('Chhota', 'Bheem', 'chhota.bheem@tatvasoft.com', NOW(), NULL, 15);

--how to insert multiple iteams at once :
INSERT INTO people (first_name, last_name, email, created_date, updated_date, age) VALUES
  ('John', 'Don', 'johndon@example.com', NOW(), NULL, 20),
  ('Tom', 'Smith', 'Tomsmith@example.com', NOW(), NULL, 26),
  ('BMW', 'Johnson', 'bjohnson@example.com', NOW(), NULL, 18);

--selecting one column only :
Select first_name from people ;

--selecting multiple column only :
Select first_name , last_name from people;

--selecting all table :
Select * from people ;

--how to use Order by :
SELECT first_name, last_name FROM people ORDER BY first_name DESC;
SELECT email FROM people ORDER BY email ASC;
SELECT customer_id, first_name, last_name FROM people ORDER BY first_name ASC, last_name DESC;

--how to use where clause :
SELECT last_name, first_name FROM people WHERE customer_id = 2 ;
SELECT customer_id, first_name, email  FROM people WHERE first_name = 'chhota' AND last_name = 'bheem';
SELECT customer_id, first_name, last_name FROM people WHERE first_name IN ('BMW');
SELECT first_name, last_name FROM people WHERE first_name LIKE '%To%'; -- LIKE (case-sensitive)
SELECT first_name, last_name FROM people WHERE first_name ILIKE '%ho%'; -- ILIKE (case-insensitive) 

--creating a new table :
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES people(customer_id),
    order_number VARCHAR(50) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);
--adding values to it :
INSERT INTO orders (order_id ,customer_id, order_number, order_amount) VALUES
  (1,1, 'ORD001', 50.00),
  (2,2, 'ORD002', 35.75),
  (3,3, 'ORD003', 100.00),
  (4,4, 'ORD004', 30.25);

--how to use join :
SELECT * FROM orders AS o INNER JOIN people AS p ON o.customer_id = p.customer_id;
SELECT * FROM people INNER JOIN orders on orders.customer_id = people.customer_id;
SELECT * FROM people AS p LEFT JOIN orders AS o ON p.customer_id = o.customer_id;
SELECT * FROM orders AS o RIGHT JOIN people AS p ON o.customer_id = p.customer_id;

--group by :
SELECT c.customer_id, c.first_name, c.last_name, c.email, COUNT(o.order_id) AS NoOrders, SUM(o.order_amount) AS Total
FROM people AS c INNER JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;  
SELECT p.customer_id,p.first_name,p.last_name,COUNT(o.order_id)AS num FROM people AS p 
Inner join orders AS o on o.customer_id=p.customer_id 
Group BY p.customer_id;
SELECT o.order_id, o.order_number,SUM(o.order_amount) AS total from orders as o 
Inner join people as p on p.customer_id=o.customer_id 
GROUP BY o.order_id;


--use of group by with having :
SELECT c.customer_id, c.first_name, c.last_name, c.email,COUNT(o.order_id) AS No_Orders,SUM(o.order_amount) AS TotalFROM customer AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1;
SELECT p.customer_id,p.first_name,p.last_name,COUNT(o.order_id)AS num, SUM(o.order_amount) AS total FROM people AS p 
Inner join orders AS o on o.customer_id=p.customer_id 
Group BY p.customer_id HAVING SUM(o.order_amount) >= 50;

--subqueries examples :
SELECT * FROM orders WHERE customer_id IN (
  SELECT customer_id FROM people WHERE age = 15
);

select p.first_name ,p.last_name,p.age from people as p where customer_id =(
SELECT order_id from orders where order_id > 3
);

--update the value of table
UPDATE people
SET first_name = 'bhola', last_name = 'maharaj', email = 'bhola.maharaj@tatvasoft.com'
WHERE customer_id = 4;

UPDATE people
SET age = 30 WHERE customer_id = 2 ;

select * from people ;


