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


/*
5. List the Employee first and last name, and their Customer’s name even if 
the Employee is not working with a Customer
*/

/*
6. List all of the possible statuses for an order.
*/

/*
7. List all Orders where the quantity of a product ordered is greater than the 
quantity of that product on hand
*/

/*
8. List the Employee LastName and FirstName that work in Japan
*/