/* 1. List all the data in the classic models database */
-- a, b, c, d, e, f, g, h
SELECT * FROM productLines;
SELECT * FROM product;
SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM orderDetails;
SELECT * FROM payments;

/* 2. Select customer name from customer. Sort by customer name */
SELECT customerName FROM customers
ORDER BY customerName;

/* 3. List each of the diff status that an order may be in */

/* 4. List firstname and lastname for each employee. Sort by lastname then firstname (23) */

/* 5. List all the employee job titles (7) */

/* 6. List all products along with their product scale (110) */

/* 7. List all the territories where we have offices (4) */

/* Where Clause */
------------------
/* 8. select contact firstname, contact lastname and credit limit for all customers where credit limit > 50000 (85) */

/* 9. select customers who do not have a credit limit (0.00) (24) */

/* 10. List all offices not in the USA (4) */

/* 11. List orders made between June 16, 2014 and July 7, 2014 (8) */

/* 12. List products that we need to reorder (quantityinstock < 1000) (12) */

/* 13. List all orders that shipped after the required date (1) */

/* 14. List all customers who have the word ‘Mini’ in their name (10) */

/* 15. List all products supplied by ‘Highway 66 Mini Classics’ (9) */

/* 16. List all product not supplied by ‘Highway 66 Mini Classics’ (101) */

/* 17. List all employees that don't have a manager (1) */

------------------
/* Natural Join */
------------------
/* 18. Display every order along with the details of that order for order numbers 
10270, 10272, 10279 (23)
Hint: this can be done two ways. Try both of them. Which is easier if you have 
a large number of selection criteria? */

/* 19. List of productlines and vendors that supply the products in that 
productline. (65) */

----------------
/* Inner Join */
----------------
/* 20. select customers that live in the same state as one of our offices (26) */

/* 21. select customers that live in the same state as their employee 
representative works (26) */

----------------
/* Multi-join */
----------------
/* 22. select customerName, orderDate, quantityOrdered, productLine, productName 
for all orders made and shipped in 2015 (444) */

----------------
/* Outer Join */
----------------
/* 23. List products that didn't sell (1) */

/* 24. List all customers and their sales rep even if they don’t have a sales 
rep (122) */

---------------
/* Self Join */
---------------
/* 25. Find all of the customers who have the same sales representative as some 
other customer, and either customer name has ‘Australian’ in it.
List each of the customers sharing a sales representative, and the name of the 
sales representative.  Order by the name of the first customer, then the second.
Do not show any combination more than once. (9) */

-------------------------
/* Aggregate Functions */
-------------------------
/* 26. Find the total of all payments made by each customer (98) */

/* 27. Find the largest payment made by a customer (1) */

/* 28. Find the average payment made by a customer (1) */

/* 29. What is the total number of products per product line (7) */

/* 30. What is the number of orders per status (6) */

/* 31. List all offices and the number of employees working in each office (7) */

/* Having */
------------
/* 32. List the total number of products per product line where number of 
products > 3 (6) */

/* 33. List the product lines and vendors for product lines which are supported 
by < 5 vendors (3) */

------------------
/* Computations */
------------------
/* 34. What product that makes us the most money (qty*price) (1) */

/* 35. What is the profit per product (MSRP-buyprice) (110) */

--------------------
/* Set Operations */
--------------------
/* 36. List all customers who didn't order in 2015 (78) */

/* 37. List all people that we deal with (employees and customer contacts). 
Display first name, last name, company name (or employee) (145) */

/* 38. List the last name, first name, and employee number of all of the 
employees who do not have any customers. Order by last name first, then the 
first name. (8). */

/* 39. List the states and the country that the state is part of that have 
customers but not offices, offices but not customers, or both one or more 
customers and one or more offices all in one query. Designate which state is 
which with the string 'Customer', 'Office', or 'Both'. If a state falls into 
the “Both” category, do not list it as a Customer or an Office state.  Order 
by the country, then the state. Give the category column (where you list 
‘Customer’, ‘Office’, or ‘Both’) a header of “Category” and exclude any 
entries in which the state is null. (19) */

/* 40. List the Product Code and Product name of every product that has never 
been in on order in which the customer asked for more than 48 of them.
Order by the Product Name.  (8) */

/* 41. List the first name and last name of any customer who ordered any products 
from either of the two product lines ‘Trains’ or ‘Trucks and Buses’. Do not use 
an “or”.  Instead perform a union.  Order by the customer’s name. (61) */

/* 42. List the name of all customers who do not live in the same state and 
country with any other customer.  Do not use a count for this exercise.
Order by the customer name. */

----------------
/* Subqueries */
----------------
-- 43. List the products in the product line with the most number of products (38)

-- 44. Find the first name and last name of all customer contacts whose customer 
-- is located in the same state as the San Francisco office.(11)

-- 45. What is the customer and sales person of the highest priced order? (1)

-- 46. What is the order number and the cost of the order for the most expensive 
-- orders?  Note that there could be more than one order which all happen to add 
-- up to the same cost, and that same cost could be the highest cost among all 
-- orders. (1)

-- 47. What is the name of the customer, the order number, and the total cost of 
-- the most expensive orders? (1)

-- 48. Perform the above query using a view. (1)

-- 49. Show all of the customers who have ordered at least one product with the 
-- name “Ford” in it, that “Dragon Souveniers, Ltd.” has also ordered.  List 
-- them in reverse alphabetical order, and do not consider the case of the 
-- letters in the customer name in the ordering. Show each customer no more 
-- than once. (61)

-- 50. Which products have an MSRP within 5% of the average MSRP across all pro
-- ducts? List the Product Name, the MSRP, and the average MSRP ordered by the 
-- product MSRP. (14)

-- 51. List all of the customers who have never made a payment on the same date 
-- as another customer. (57)

-- 52. Find customers who have ordered the same thing. Find only those customer 
-- pairs who have ordered the same thing as each other at least 201 times (1)

/* Recursion */
---------------
-- 53. What is the manager who manages the greatest number of employees (2)

-- 54. Select all employees who work for the manager that manages the greatest 
-- number of employee (12)

/* 55. List all employees that have the same last name. Make sure each combination is listed 
only once (5) */

/* 56. Select the name of each of two customers who have made at least one payment on the 
same date as the other.  Make sure that each pair of 
customers only appears once. (46) */