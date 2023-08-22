 ----SELECT---
SELECT product_id, product_name, unit_price FROM products;
SELECT city, country FROM employees;
SELECT order_id, shipped_date, order_date FROM orders;

 ---SELECT + GENERATE NEW COLUMN--
SELECT product_id, product_name, unit_price * units_in_stock
FROM products;

----DISTINCT---
SELECT DISTINCT city, country FROM employees;

----COUNT---
SELECT COUNT (country)  FROM employees;
SELECT COUNT (*)  FROM customers;
SELECT COUNT (*) FROM products WHERE unit_price > 40;

----WHERE----
SELECT * FROM customers WHERE city != 'Berlin';
SELECT company_name, contact_name, phone, country  FROM customers WHERE country = 'USA';
SELECT order_id, order_date  FROM orders WHERE order_date >= '1998-03-01';
SELECT order_id, order_date FROM orders WHERE order_date >= '01-03-1998';

----AND, OR----
SELECT product_id, unit_price FROM products WHERE unit_price > 25 AND unit_price < 40;
SELECT product_id, unit_price, units_in_stock FROM products WHERE unit_price > 25 AND units_in_stock > 40;
SELECT * FROM customers;
SELECT customer_id, city FROM customers WHERE city = 'Berlin' OR city = 'London' OR city = 'Madrid';
SELECT order_id, shipped_date, freight  FROM orders
WHERE shipped_date > '1998-04-30' AND (freight < 75 OR freight >150);
SELECT order_id, freight FROM orders WHERE freight >= 31.5 AND freight <= 32.5;

----BETWEEN----
SELECT order_id, freight FROM orders WHERE freight BETWEEN 31.5 AND 32.5;
SELECT order_id, order_date FROM orders
WHERE order_date BETWEEN '03-03-1998' AND '05-03-1998';

---IN, NOT IN  -----
SELECT customer_id, country FROM customers
WHERE country = 'Mexico' OR country = 'Germany' OR country = 'USA' OR country = 'Canada';
SELECT customer_id, country FROM customers
WHERE country IN ('Mexico', 'Germany', 'USA', 'Canada');
SELECT customer_id, country FROM customers
WHERE country NOT IN ('Mexico', 'Germany', 'USA', 'Canada');

---ORDER BY -----
SELECT DISTINCT country FROM customers
SELECT DISTINCT country FROM customers ORDER BY country
SELECT DISTINCT country FROM customers ORDER BY country DESC
SELECT DISTINCT country, city FROM customers ORDER BY country, city DESC
SELECT DISTINCT country, city FROM customers ORDER BY country DESC, city ASC

--- MIN, MAX, AVG -----
    --- MIN -----
SELECT ship_city, order_date FROM orders
WHERE ship_city = 'London'
ORDER BY order_date;

SELECT MIN(order_date) FROM orders WHERE ship_city = 'London';
    --- MAX -----
SELECT ship_city, order_date FROM orders
WHERE ship_city = 'London'
ORDER BY order_date DESC;

SELECT MAX(order_date) FROM orders WHERE ship_city = 'London';
    --- AVG -----
SELECT AVG(unit_price) FROM products WHERE discontinued != 1;

--Найдем среднее значение дней, уходящих на доставку с даты формирования заказа в USA
SELECT AVG(shipped_date - order_date) FROM orders WHERE ship_country = 'USA';

    --- SUM -----
 --Найдем стоимость всех находящихся в продаже товаров, имеющихся на складе
SELECT SUM(unit_price * units_in_stock) FROM products WHERE discontinued != 1;

     ---- LIKE -----
  --найдем строки, где first_name заканчивается на 'n'
SELECT last_name, first_name FROM employees WHERE first_name LIKE '%n';
  --найдем строки, где last_name начинается на 'B'
SELECT last_name, first_name FROM employees WHERE last_name LIKE 'B%';
  --найдем строки, где last_name начинается на 'Buch'
SELECT last_name, first_name FROM employees WHERE last_name LIKE 'Buch%';
  --найдем строки, где last_name начинается на '_uch'
SELECT last_name, first_name FROM employees WHERE last_name LIKE '_uch%';

select order_id, ship_country from orders where ship_country like 'U%';

      ---- LIMIT -----
SELECT product_name, unit_price FROM products LIMIT 5;

SELECT product_name, unit_price FROM products
WHERE discontinued != 1
ORDER BY unit_price DESC
LIMIT 5;

select order_id, customer_id, freight, ship_country from orders
where ship_country like 'N%' order by freight desc limit 5;

     ----- CHECK ON NULL ----
SELECT ship_city, ship_region, ship_country FROM orders;

SELECT ship_city, ship_region, ship_country FROM orders
WHERE ship_region IS NULL;

SELECT ship_city, ship_region, ship_country FROM orders
WHERE ship_region IS NOT NULL;

select first_name, last_name, home_phone, region from employees where region is null;

select count(*) from customers where region is not null;

 ----- GROUP BY ----
SELECT ship_country, COUNT(*) FROM orders
WHERE freight > 50
GROUP BY ship_country
ORDER BY COUNT(*) DESC;

SELECT category_id, SUM(units_in_stock) FROM products
GROUP BY category_id
ORDER BY SUM(units_in_stock) DESC
LIMIT 5;

select country, count(*) from suppliers
group by country
order by count(*) desc;

select ship_country, count(customer_id) from orders
where ship_region is not null
group by ship_country
order by count(customer_id) desc;
 ----- HAVING ----
SELECT category_id, SUM(unit_price * units_in_stock) FROM products
WHERE discontinued != 1
GROUP BY category_id
HAVING SUM(unit_price * units_in_stock) > 5000
ORDER BY SUM(unit_price * units_in_stock)

select ship_country, sum(freight) from orders
where ship_region is not null
group by ship_country
having sum(freight) > 2750
order by sum(freight) desc

 ----- UNION, INTERSECT, EXCEPT ----
    -- UNION--
SELECT country FROM customers
UNION
SELECT country FROM employees

SELECT country FROM customers
union
SELECT country FROM suppliers
order by country

   --INTERSECT--
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers;

SELECT country FROM suppliers
INTERSECT
SELECT country FROM employees;

    --EXCEPT--
SELECT country FROM suppliers
EXCEPT
SELECT country FROM customers;

SELECT country FROM customers
intersect
SELECT country FROM suppliers
except
SELECT country FROM employees;

    --EXCEPT ALL--
SELECT country FROM suppliers
EXCEPT ALL
SELECT country FROM customers

