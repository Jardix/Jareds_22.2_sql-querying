-- Comments in SQL Start with dash-dash --
-- Yes, I copied this verbatim after ensuring that I was, in fact, in the right terminal, running the database, had correctly accessed SQL, and that the database had correctly seeded. It is a copy and paste for the sake of testing. But it worked, so I am moving on. 

-- 1.) Add a product to the table with the name of "chair", price of 44.00, and can_be_returned of false.

INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('chair', 44.00, 'f');

-- Copy and pasting their question as-is, and then my answer below. 
-- 2.) Add a product to the table with the name of “stool”, price of 25.99, and can_be_returned of true.

INSERT INTO products
(name, price, can_Be_returned)
VALUES
('stool', 25.99, 't');

-- 3.) Add a product to the table with the name of “table”, price of 124.00, and can_be_returned of false.

INSERT INTO products
(name, price, can_Be_returned)
VALUES
('table', 124.00, 'f');

-- 4.) Display all of the rows and columns in the table.

SELECT * FROM products;

id | name  | price | can_be_returned
----+-------+-------+-----------------
 1 | chair |    44 | f
 2 | stool | 25.99 | t
 3 | table |   124 | f


-- 5.) Display all of the names of the products.

-- Why use DISTINCT? Because on SQLZOO, where half of the exercises took place, it wouldn't work without using DISTINCT. Oddly enough, using it works just fine, so I assume it's a matter of specificity. 

SELECT DISTINCT(name)
FROM products;

 name
-------
chair
stool
table

-- 6.) Display all of the names and prices of the products.

SELECT name, price
FROM products;

 name  | price
-------+-------
 chair |    44
 stool | 25.99
 table |   124

-- 7.) Add a new product - make up whatever you would like!

INSERT INTO products VALUES(4, 'Manual on SQL', 0.01, 't');

 id |     name      | price | can_be_returned
----+---------------+-------+-----------------
  1 | chair         |    44 | f
  2 | stool         | 25.99 | t
  3 | table         |   124 | f
  4 | Manual on SQL |  0.01 | t

-- 8.) Display only the products that can_be_returned.

SELECT *
FROM products
WHERE can_be_returned='t';

 id |     name      | price | can_be_returned
----+---------------+-------+-----------------
  2 | stool         | 25.99 | t
  4 | Manual on SQL |  0.01 | t

-- 9.) Display only the products that have a price less than 44.00.

SELECT *
FROM products
WHERE price <= 44.00;

 id |     name      | price | can_be_returned
----+---------------+-------+-----------------
  1 | chair         |    44 | f
  2 | stool         | 25.99 | t
  4 | Manual on SQL |  0.01 | t

-- 10.) Display only the products that have a price in between 22.50 and 99.99.

SELECT * FROM products
WHERE price BETWEEN 22.50 AND 99.99;

 id | name  | price | can_be_returned
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | t

-- 11.) There’s a sale going on: Everything is $20 off! Update the database accordingly.

UPDATE products
SET price = 20.01
WHERE id = 4;

 id |     name      | price | can_be_returned
----+---------------+-------+-----------------
  1 | chair         |    44 | f
  2 | stool         | 25.99 | t
  3 | table         |   124 | f
  4 | Manual on SQL | 20.01 | t

UPDATE products
SET price = price - 20;

 id |     name      |        price         | can_be_returned
----+---------------+----------------------+-----------------
  1 | chair         |                   24 | f
  2 | stool         |    5.989999999999998 | t
  3 | table         |                  104 | f
  4 | Manual on SQL | 0.010000000000001563 | t

-- Odd decimal usage, but that's the solution's method too. 

-- 12.) Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.

DELETE FROM products WHERE price < 25;

 id | name  | price | can_be_returned
----+-------+-------+-----------------
  3 | table |   104 | f

-- 13.) And now the sale is over. For the remaining products, increase their price by $20.

UPDATE products
SET price = price + 20;

 id | name  | price | can_be_returned
----+-------+-------+-----------------
  3 | table |   124 | f

-- 14.) There is a new company policy: everything is returnable. Update the database accordingly.

UPDATE products
SET can_be_returned = 't';

 id | name  | price | can_be_returned
----+-------+-------+-----------------
  3 | table |   124 | t