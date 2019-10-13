CREATE TABLE CUSTOMERS(
    Id INTEGER,
    LastName VARCHAR(100),
    FirstName VARCHAR(100),
    PRIMARY KEY (Id)
);

CREATE TABLE GOODS(
    Id VARCHAR(30),
    Flavor VARCHAR(100),
    Food VARCHAR(100),
    Price FLOAT,
    PRIMARY KEY (Id)
);

CREATE TABLE RECEIPTS(
    ReceiptNumber INTEGER,
    PurchaseDate DATE,
    CustomerId INTEGER,
    PRIMARY KEY (ReceiptNumber),
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS (Id)
);

CREATE TABLE ITEMS(
    Receipt INTEGER,
    Ordinal INTEGER,
    Item VARCHAR(30),
    FOREIGN KEY (Item) REFERENCES GOODS (Id),
    FOREIGN KEY (Receipt) REFERENCES RECEIPTS (ReceiptNumber)
);