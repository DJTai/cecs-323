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
