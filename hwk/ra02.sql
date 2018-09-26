/*
1. List the names of all Customers that are located in the same state as an 
Office
*/

/*
2. List the names of all Customers who have ordered Products where the vendor 
is “Classic Metal Creations”
*/

/*
3. List the names of all Customers whose Order was shipped within three days 
of being ordered
*/
SELECT c.customerName, o.orderDate, o.shippedDate
FROM orders o
INNER JOIN customers c USING(customerNumber)
WHERE YEAR(o.SHIPPEDDATE) = YEAR(o.ORDERDATE)
AND MONTH(o.SHIPPEDDATE) = MONTH(o.ORDERDATE)
AND (DAY(o.SHIPPEDDATE) - DAY(o.ORDERDATE)) < 3;

/*
4. List the names of all Customers, their service reps and the Offices that 
the service reps work in
*/
SELECT c.CUSTOMERNAME, e.LASTNAME || ', ' || e.FIRSTNAME AS repName,
o.OFFICECODE, o.CITY, o.ADDRESSLINE1, o.ADDRESSLINE2
FROM customers c
INNER JOIN employees e
ON (c.SALESREPEMPLOYEENUMBER = e.EMPLOYEENUMBER)
INNER JOIN offices o USING(officeCode);

/*
5. List the Employee first and last name, and their Customer’s name even if 
the Employee is not working with a Customer
*/
SELECT e.firstName, e.lastName, 
c.CUSTOMERNAME, c.SALESREPEMPLOYEENUMBER AS SREN
FROM employees e
NATURAL JOIN customers c
ORDER BY e.LASTNAME, e.FIRSTNAME ASC;

/*
6. List all of the possible statuses for an order.
*/
SELECT DISTINCT o.STATUS FROM orders o;

/*
7. List all Orders where the quantity of a product ordered is greater than the 
quantity of that product on hand
*/
SELECT * FROM orders; -- orderNumber
SELECT * FROM orderDetails; -- orderNumber, quantityOrdered, productCode
SELECT * FROM products; -- quantityInStock, productCode

SELECT o.ORDERNUMBER, od.QUANTITYORDERED, p.QUANTITYINSTOCK
FROM orders o
NATURAL JOIN orderDetails od
NATURAL JOIN products p
WHERE od.QUANTITYORDERED > p.QUANTITYINSTOCK;

/*
8. List the Employee LastName and FirstName that work in Japan
*/
SELECT * FROM employees; -- lastName, firstName, officeCode

SELECT * FROM offices; -- officeCode = 5, country = Japan

SELECT * FROM employees e
NATURAL JOIN offices o
WHERE o.COUNTRY LIKE '%Japan%';
-- OR --
SELECT * FROM employees e
NATURAL JOIN offices o
WHERE o.COUNTRY = 'Japan';