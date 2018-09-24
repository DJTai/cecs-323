CREATE TABLE customer (
    customer_id INTEGER NOT NULL GENERATED always AS
        IDENTITY (START WITH 1, increment BY 1)
        CONSTRAINT customers_pk PRIMARY KEY,
    cFirstName  VARCHAR(20) NOT NULL,
    cLastName   VARCHAR(20) NOT NULL,
    cPhone      VARCHAR(20) NOT NULL,
    cStreet     VARCHAR(50),
    cZipcode    VARCHAR(5),
    CONSTRAINT  customers_uk01 UNIQUE(cFirstName, cLastName, cPhone)
);

CREATE TABLE "Order" (
    customer_id INTEGER NOT NULL,
    orderdate   DATE,
    soldby      VARCHAR(20),
    CONSTRAINT  orders_customers_fk01
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id),
    CONSTRAINT  orders_pk PRIMARY KEY (customer_id, orderdate)
);

CREATE TABLE product (
    upc         INTEGER NOT NULL PRIMARY KEY,
    prodName    VARCHAR(40) NOT NULL,
    mfgr        VARCHAR(40) NOT NULL,
    model       VARCHAR(20) NOT NULL,
    unitListPrice   DOUBLE NOT NULL,
    unitsInStock    INTEGER NOT NULL
);

ALTER TABLE product ADD CONSTRAINT product_uk01 UNIQUE(prodName, mfgr, model);

CREATE TABLE OrderLine (
    customer_id             INTEGER NOT NULL,
    orderDate               DATE NOT NULL,
    UniversalProductCode    INTEGER NOT NULL,
    quantity                INTEGER NOT NULL,
    unitSalePrice   DOUBLE,
    CONSTRAINT orderline_pk PRIMARY KEY(customer_id, orderDate, UniversalProductCode),
    CONSTRAINT OrderLine_Order_fk01 FOREIGN KEY(customer_id, orderDate)
        REFERENCES "Order"(customer_id, orderdate),
    CONSTRAINT OrderLine_product FOREIGN KEY(UniversalProductCode)
        REFERENCES product(upc)
);

INSERT INTO customer(cFirstName, cLastName, cPhone, cStreet, cZipcode)
VALUES ('Dave', 'Brown', '562-982-8696', '123 Lakewood Blvd. Long Beach', '90080'),
    ('Rachel', 'Burris', '213-543-2211', '54 218th St. Torrance', '90210'),
    ('Tom', 'Jewett', '714-555-1212', '10200 Slater', '92708'),
    ('Alvero', 'Monge', '562-111-1234', '314159 Pi St. Long Beach', '90814');

INSERT INTO product(UPC, prodName, mfgr, model, unitListPrice, unitsInStock)
VALUES (135798642, 'Framing hammer, 20oz.', 'Stanley', 'Frame01', 18.95, 20),
(123456789, 'Framer''s level 9 ft.', 'Stanley', 'Frame09', 28.57, 10),
(777999111, 'Blade Screwdriver #2', 'Proto', 'Blad02', 8.53, 15),
(123123123, 'Cold Chisel 1"', 'Challenger', 'One inch', 12.04, 30),
(321321321, 'Jackhammer, Electric', 'Bosche', 'Sml Elec', 128.95, 5),
(111222333, 'Arc Welder', 'Lincoln', 'Industrial', 5298.65, 1);

INSERT INTO "Order"(customer_ID, orderDate, soldBy)
VALUES
(1, '2015-12-24', 'Patrick'),
(1, '2015-11-25', 'Sally Forth'),
(2, '2016-05-05', 'Mack'),
(3, '2012-05-05', 'Phillip'),
(3, '2014-04-04', 'Patrick');

INSERT INTO OrderLine
(customer_id, orderDate, UniversalProductCode, quantity, unitSalePrice)
VALUES
(1, '2015-12-24', 135798642, 3, NULL),
(1, '2015-12-24', 123456789, 1, NULL),
(1, '2015-11-25', 777999111, 3, NULL),
(2, '2016-05-05', 321321321, 2, 120.00),
(3, '2012-05-05', 123123123, 1, NULL),
(3, '2012-05-05', 777999111, 3, NULL),
(3, '2012-05-05', 123456789, 2, NULL),
(3, '2014-04-04', 135798642, 1, NULL),
(3, '2014-04-04', 123123123, 2, NULL);


/*
Perform a join between customer to order to orderline to product and list out
all of the columns (9)

Customer: customer_id, cFirstName, cLastName, cPhone, cStreet, cZipCode
OrderLine: CUSTOMER_ID, orderDate, universalProductcode, Qty, unitSalePrice
"Order": CUSTOMER_ID, ORDERDATE, soldBy
Product: UPC, prodName, mfgr, model, unitListPrice, unitsInStock
*/
SELECT *
FROM customer
NATURAL JOIN "Order"
NATURAL JOIN orderLine
INNER JOIN product ON orderLine.UNIVERSALPRODUCTCODE = product.UPC;

/*
List the product name and price of all of the products that have never been 
ordered (1)
*/
SELECT prodName, unitListPrice
FROM product
LEFT OUTER JOIN orderLine
ON product.UPC = orderLine.UNIVERSALPRODUCTCODE
WHERE orderDate is NULL;

/*
NOT using the natural join, list the first name, last name, and phone num of all of
the customers who have placed at least one order. List alphabetically by last name, 
then first name. List each customer ONLY ONCE (3)
*/
SELECT DISTINCT cFirstName, cLastName, cPhone
FROM customer
INNER JOIN "Orders" USING (Customer_ID)
ORDER BY cLastName, cFirstName;

/*
NOT sing the natural join, list the customer last name, first name, phone number, and 
the date of the order of those who have placed an order PRIOR to 2016. List ea customer 
order only once. List the orders in order by last name, then first name, and finally by 
date (4)
*/


/*
You remember that someone came in and ordered a level, but you don’t recall what sort of 
level it was, and you want to give them a call.  Write a query that will print the first 
name, last name, phone number and the name of the product of anyone who has ordered a 
product with the word “level” in it.  Do not assume that you know what the capitalization 
of the product name is.  List each customer and product only once.(2)
*/


/*
List the product name, manufacturer, and model of all products that have been ordered 
at least once in an order in which the month number was the same as the day number. For 
instance, July 7th 2010 is such a date. List a given product only once.(5)
*/
