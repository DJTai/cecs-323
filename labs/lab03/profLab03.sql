/*
1. List all the data in the classic models database:
- ProductLines
- Products
- OrderDetails
- Employees
- Offices
- Customers
- Orders
- Payments
*/
SELECT productLine, textDescription, htmlDescription, image
FROM productLines;

SELECT productCode, productName, productLine, productScale, productVendor,
productDescription, quantityInStock, buyPrice, MSRP
FROM products;

SELECT orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
FROM orderDetails;

SELECT employeeNumber, lastName, firstName, extension, email, officeCode,
reportsTo, jobTitle
FROM employees;

SELECT officeCode, city, phone, addressLine1, addressLine2, state, country,
postalCode, territory
FROM offices;

SELECT customerNumber, customerName, contactLastName, contactFirstName, phone,
addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber,
creditLimit
FROM customers;

SELECT orderNumber, orderDate, requiredDate, shippedDate, status, comments
customerNumber
FROM orders;

SELECT customerNumber, checkNumber, paymentDate, amount
FROM payments;

/*
2. Find all the info on customers whose customername ends in “Co” (7)
*/
SELECT DISTINCT * FROM customers
WHERE customers.CUSTOMERNAME LIKE '%Co';

/*
3. List all of the information on any orders which were placed during October of 2013 (18)
*/
SELECT * FROM orders
WHERE orders.ORDERDATE < '2013-11-01'
AND orders.ORDERDATE > '2013-09-30';

/*
4. Find all information for Product Lines:
- Classic Cars, Motorcycles, and Planes.
- Hint: you have two ways to do this. Try both of them. Which is easier if you have a large number of selection criteria?
*/


/*
5. Find the contact Last Name, contact First Name, and the state for all customers.
- Display them in alphabetical order by city within state. (100)
*/


/*
6. Find the productName for all products which sell for $30.00 to $60.00 (15)
*/