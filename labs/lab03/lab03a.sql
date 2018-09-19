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