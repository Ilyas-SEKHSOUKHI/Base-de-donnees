DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customerid SERIAL PRIMARY KEY,
    customername VARCHAR(50),
    contactname VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    postalcode VARCHAR(25),
    country VARCHAR(25)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employeeid SERIAL PRIMARY KEY,
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    birthdate DATE,
    photo VARCHAR(50),
    notes VARCHAR(255)
);

DROP TABLE IF EXISTS shippers;
CREATE TABLE shippers (
    shipperid SERIAL PRIMARY KEY,
    shippername VARCHAR(50),
    phone VARCHAR(50)
);

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers (
    supplierid SERIAL PRIMARY KEY,
    suppliername VARCHAR(50),
    contactname VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    postalcode VARCHAR(25),
    country VARCHAR(25),
    phone VARCHAR(25)
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
    categoryid SERIAL PRIMARY KEY,
    categoryname VARCHAR(25),
    description VARCHAR(100)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    productid SERIAL PRIMARY KEY,
    productname VARCHAR(50),
    supplierid INTEGER REFERENCES suppliers(supplierid),
    categoryid INTEGER REFERENCES categories(categoryid),
    unit VARCHAR(50),
    price NUMERIC(6,2)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    orderid SERIAL PRIMARY KEY,
    customerid INTEGER REFERENCES customers(customerid),
    employeeid INTEGER REFERENCES employees(employeeid),
    orderdate DATE,
    shipperid INTEGER REFERENCES shippers(shipperid)
);

DROP TABLE IF EXISTS orderdetails;
CREATE TABLE orderdetails (
    orderdetailid SERIAL PRIMARY KEY,
    orderid INTEGER REFERENCES orders(orderid),
    productid INTEGER REFERENCES products(productid),
    quantity INTEGER
);
