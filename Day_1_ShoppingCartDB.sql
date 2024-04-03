CREATE DATABASE ShoppingCartDB;

use ShoppingCartDB;



CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    QuantityInStock INT NOT NULL,
    UnitPrice INT NOT NULL CHECK (UnitPrice > 0),
    Category VARCHAR(100) NOT NULL
);

CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    UserName VARCHAR(255),
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Cart (
    CartId INT PRIMARY KEY,
    ProductId INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UserId INT NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId) ON DELETE CASCADE,
    FOREIGN KEY (UserId) REFERENCES Users(UserId) ON DELETE CASCADE
);

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    CartId INT NOT NULL,
    OrderDate DATE,
    UserId INT,
    FOREIGN KEY (CartId) REFERENCES Cart(CartId) ON DELETE CASCADE,
    FOREIGN KEY (UserId) REFERENCES Users(UserId) ON DELETE CASCADE
);




INSERT INTO Products (ProductId, Name, QuantityInStock, UnitPrice, Category) 
VALUES 
(1, 'Mobile', 10, 10000, 'Android'),
(2, 'Laptop', 15, 47000, 'nextGen'),
(3, 'SmartWatch', 25, 1500, 'Digital'),
(4, 'Earbuds', 5, 2000, 'White'),
(5, 'Computer', 12, 50000, 'Lenovo');


INSERT INTO Users (UserId, UserName, Password, ContactNumber, Address)
VALUES
(1, 'John Doe', '12345', '123-456-7890', '123 Main St, City, Country'),
(2, 'Jane Smith', '123456', '456-789-0123', '456 Elm St, City, Country'),
(3, 'Alice Johnson', '1234567', '789-012-3456', '789 Oak St, City, Country'),
(4, 'Bob Brown', '12345678', '987-654-3210', '987 Pine St, City, Country'),
(5, 'Emma White', '123456789', '321-654-9870', '321 Cedar St, City, Country');

INSERT INTO Cart (CartId, ProductId, Quantity, UserId)
VALUES
(1, 1, 2, 1),
(2, 2, 3, 2),
(3, 3, 1, 3),
(4, 4, 2, 4),
(5, 5, 1, 5);

INSERT INTO Orders (OrderId, CartId, OrderDate, UserId)
VALUES
(1, 1, '2024-04-01', 1),
(2, 2, '2024-04-02', 2),
(3, 3, '2024-04-03', 3),
(4, 4, '2024-04-04', 4),
(5, 5, '2024-04-05', 5);

select * from products;
select * from products where category='White';
select * from products where quantityinstock=0;
select * from products where unitprice between 1000 and 10000;
select * from products where productid=3;

select c.cartId, p.Name as productName,p.UnitPrice, c.quantity
from cart c
join products p on c.productId = p.productId
where c.cartId =2;

select count(*) as ProductCount from cart where productid=2;

select o.OrderId, o.OrderDate, u.UserName, p.name as ProductName, p.UnitPrice, c.quantity as Quanitity, (p.UnitPrice * c.Quantity) as TotalPrice
from Orders o join cart c on o.cartId = c.cartId
join Products p on c.ProductId = p.ProductId
join Users u on o.UserId = u.UserId
where o.OrderId = '2';

select o.OrderId, o.OrderDate,u.UserName, p.name as ProductName, p.UnitPrice, c.quantity as Quantity, (p.UnitPrice * c.Quantity) as TotalPrice
from Orders o join cart c on o.cartId = c.cartId
join Products p on c.ProductId = p.ProductId
join Users u on o.UserId = u.UserId
where o.Orderdate = '2024-04-04';

select o.OrderId, o.OrderDate,u.UserName, p.name as ProductName, p.UnitPrice, c.quantity as Quantity, (p.UnitPrice * c.Quantity) as TotalPrice
from Orders o join cart c on o.cartId = c.cartId
join Products p on c.ProductId = p.ProductId
join Users u on o.UserId = u.UserId
where o.userid = '4';

