#CITS1402 Assignment - SQL Commands and Queries

#Task 2.c - creating tables

#Create Customer Table
CREATE TABLE Customer(
PhoneNumber VARCHAR(10) NOT NULL,
PaymentType ENUM('Card','Cash','Paypal','Cheque') NOT NULL,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Address VARCHAR(40) NOT NULL,
Suburb VARCHAR(20) NOT NULL,
PRIMARY KEY (PhoneNumber))
ENGINE = InnoDB;

#Create NonPizza Table
CREATE TABLE NonPizza(
NonPizzaID INT(3) NOT NULL AUTO_INCREMENT,
Name VARCHAR(20) NOT NULL,
Cost INT(2) NOT NULL,
RetailPrice INT(2) NOT NULL,
Size ENUM('S','M','L') NOT NULL,
Quantity INT(2) NOT NULL,
PRIMARY KEY (NonPizzaID))
ENGINE = InnoDB;

#Create Pizza Table
CREATE TABLE Pizza(
PizzaID INT(3) NOT NULL AUTO_INCREMENT,
Name VARCHAR(20) NOT NULL,
Size ENUM ('S','M','L') NOT NULL,
Crust ENUM('Standard', 'Thin', 'Thick') NOT NULL,
RetailPrice int(2) NOT NULL,
Quantity INT(2) NOT NULL,
PRIMARY KEY (PizzaID))
ENGINE = InnoDB;

#Create Topping Table
CREATE TABLE Topping(
PizzaID INT(3) NOT NULL,
ToppingID INT(3) NOT NULL AUTO_INCREMENT,
Name VARCHAR(10) NOT NULL,
Cost INT(2) NOT NULL,
RetailPrice INT(2) NOT NULL,
Quantity INT(2) NOT NULL,
FOREIGN KEY (PizzaID) REFERENCES Pizza(PizzaID),
PRIMARY KEY (ToppingID, PizzaID))
ENGINE = InnoDB;

#Create Employee Table
CREATE TABLE Employee(
EmployeeID INT(3) NOT NULL AUTO_INCREMENT,
PhoneNumber VARCHAR(10) NOT NULL,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Address VARCHAR(40) NOT NULL,
Suburb VARCHAR(20) NOT NULL,
PRIMARY KEY (EmployeeID))
ENGINE = InnoDB;

#Create Role Table
CREATE TABLE Role(
EmployeeID INT(3) NOT NULL,
RoleName ENUM('Cook', 'Driver', 'Cook/Driver') NOT NULL,
Salary INT(5) NOT NULL,
Commission FLOAT(3) NOT NULL,
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
PRIMARY KEY (RoleName, EmployeeID))
ENGINE = InnoDB;

#Create Orders Table
CREATE TABLE Orders(
OrderID INT(3) NOT NULL AUTO_INCREMENT,
OrderStatus ENUM('Ordered', 'Ready','On The Way','Delivered'),
OrderDateTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
CustomerID VARCHAR(10) NOT NULL,
NonPizzaID INT(3) NOT NULL,
PizzaID INT(3) NOT NULL,
ToppingID INT(3) NOT NULL,
EmployeeID INT(3) NOT NULL,
RoleName ENUM('Cook', 'Driver', 'Cook/Driver') NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customer(PhoneNumber),
FOREIGN KEY (NonPizzaID) REFERENCES NonPizza(NonPizzaID),
FOREIGN KEY (PizzaID) REFERENCES Pizza(PizzaID),
FOREIGN KEY (ToppingID) REFERENCES Topping(ToppingID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
FOREIGN KEY (RoleName) REFERENCES Role(RoleName),
PRIMARY KEY (OrderID))
ENGINE = InnoDB;

#Task 2.d - inserting dummy records

#Insert records into Customer table
INSERT INTO Customer VALUES('0403746537','Paypal','Steve','Rodgers','50 Smith St','Gosnells');
INSERT INTO Customer VALUES('0427387526','Cash','Paul','Pheonix','21 Brown St','Cannington');
INSERT INTO Customer VALUES('0489727433','Card','Carl','Stanley','2 Downer St','Canning Vale');
INSERT INTO Customer VALUES('0438752374','Paypal','Jack','Sparrow','1 Flinders Rd','Welshpool');
INSERT INTO Customer VALUES('0438726667','Cash','Harry','Porter','17 Hagrid St','Cannington');
INSERT INTO Customer VALUES('0422877387','Card','Joe','Joseph','1 Riley Rd','Southern River');
INSERT INTO Customer VALUES('0438948733','Card','Ethan','Klein','69 Meme Rd','Canning Vale');
INSERT INTO Customer VALUES('0473463271','Paypal','Paul','Paulson','3 Appauled St','Midland');

#Insert records into NonPizza table
INSERT INTO NonPizza VALUES(NULL,'Chips',1,2,'S',1);
INSERT INTO NonPizza VALUES(NULL,'Chips',1,2,'S',3);
INSERT INTO NonPizza VALUES(NULL,'Coke',1,2,'S',2);
INSERT INTO NonPizza VALUES(NULL,'Coke',2,4,'L',4);
INSERT INTO NonPizza VALUES(NULL,'Fanta',1,2,'S',1);
INSERT INTO NonPizza VALUES(NULL,'Nuggets',3,5,'M',2);
INSERT INTO NonPizza VALUES(NULL,'Chips',2,4,'L',1);
INSERT INTO NonPizza VALUES(NULL,'Coke',2,4,'L',1);

#Insert records into Pizza table
INSERT INTO Pizza VALUES(NULL,'Hawaiian','M','Thin',10,1);
INSERT INTO Pizza VALUES(NULL,'Meatlovers','S','Thin',7,2);
INSERT INTO Pizza VALUES(NULL,'Meatlovers','M','Thin',10,1);
INSERT INTO Pizza VALUES(NULL,'Pepperoni','L','Thin',14,1);
INSERT INTO Pizza VALUES(NULL,'Hawaiian','M','Thin',10,1);
INSERT INTO Pizza VALUES(NULL,'Meatlovers','L','Thin',14,2);
INSERT INTO Pizza VALUES(NULL,'Pepperoni','S','Thin',7,1);
INSERT INTO Pizza VALUES(NULL,'Pepperoni','L','Thin',14,1);

#Insert records into Topping table
INSERT INTO Topping VALUES(1,NULL,'Olives',1,2,1);
INSERT INTO Topping VALUES(2,NULL,'Chilli',1,2,2);
INSERT INTO Topping VALUES(7,NULL,'Bacon',1,2,1);
INSERT INTO Topping VALUES(1,NULL,'Olives',1,2,1);
INSERT INTO Topping VALUES(4,NULL,'Onion',1,2,1);
INSERT INTO Topping VALUES(8,NULL,'Sausage',1,2,3);
INSERT INTO Topping VALUES(7,NULL,'Bacon',1,2,1);
INSERT INTO Topping VALUES(6,NULL,'Mushroom',1,2,2);

#Insert records into Employee table
INSERT INTO Employee VALUES(NULL,'0483716372','Denzel','Freeman','20 Stan Rd','Canning Vale');
INSERT INTO Employee VALUES(NULL,'0423316332','Thomas','Gramer','53 Duckson St','Canning Vale');
INSERT INTO Employee VALUES(NULL,'0433716472','Manu','Aung','5 Horizon St','Thornlie');
INSERT INTO Employee VALUES(NULL,'0483726738','Arthur','Raw','2 Welshpool Rd','Welshpool');
INSERT INTO Employee VALUES(NULL,'0483718271','Brendon','Big','1 Moonshine St','Kelmscott');
INSERT INTO Employee VALUES(NULL,'0438728716','Nathan','Smithson','18 Crunchy Rd','Gosnells');
INSERT INTO Employee VALUES(NULL,'0416452632','Jason','Ho','9 Huskey Rd','Kelmscott');
INSERT INTO Employee VALUES(NULL,'0418787987','Timothy','Jackson','17 Flower St','Kelmscott');

#Insert records into Role table
INSERT INTO Role VALUES(1,'Cook',60000,2);
INSERT INTO Role VALUES(2,'Driver',50000,0.5);
INSERT INTO Role VALUES(3,'Cook/Driver',70000,2.5);
INSERT INTO Role VALUES(4,'Cook',60000,2);
INSERT INTO Role VALUES(5,'Cook',60000,2);
INSERT INTO Role VALUES(6,'Driver',50000,0.5);
INSERT INTO Role VALUES(7,'Cook/Driver',70000,2.5);
INSERT INTO Role VALUES(8,'Cook/Driver',70000,2.5);

#Insert records into Order table
INSERT INTO Orders VALUES(NULL,'Delivered',NOW(),'0403746537',1,1,1,1,'Cook');
INSERT INTO Orders VALUES(NULL,'Ready',NOW(),'0427387526',2,1,3,3,'Driver');
INSERT INTO Orders VALUES(NULL,'Ordered',NOW(),'0438948733',1,2,2,4,'Cook');
INSERT INTO Orders VALUES(NULL,'Ready',NOW(),'0438726667',3,4,1,2,'Cook/Driver');
INSERT INTO Orders VALUES(NULL,'On The Way',NOW(),'0473463271',4,4,5,8,'Cook/Driver');
INSERT INTO Orders VALUES(NULL,'Ordered',NOW(),'0403746537',2,1,3,4,'Driver');
INSERT INTO Orders VALUES(NULL,'Ordered',NOW(),'0489727433',7,4,6,1,'Driver');
INSERT INTO Orders VALUES(NULL,'Delivered',NOW(),'0422877387',3,1,2,2,'Cook/Driver');

#Task 3.a - Question (a)

SELECT E.EmployeeID, E.FirstName, E.LastName, E.PhoneNumber, E.Address, E.Suburb
FROM Employee AS E, Role AS R
WHERE E.EmployeeID = R.EmployeeID
AND R.RoleName = 'Cook/Driver';

#Task 3.a - Question (b)

SELECT C.Suburb,
SUM(IFNULL(P.RetailPrice * P.Quantity,0) +
IFNULL(N.RetailPrice * N.Quantity,0) +
IFNULL(T.RetailPrice * P.Quantity,0))
AS OrderPrice FROM Orders AS O
JOIN Customer AS C ON C.PhoneNumber = O.CustomerID
LEFT JOIN NonPizza AS N ON O.NonPizzaID = N.NonPizzaID
LEFT JOIN Pizza AS P ON O.PizzaID = P.PizzaID
LEFT JOIN Topping AS T ON O.ToppingID = T.ToppingID
GROUP BY C.Suburb
ORDER BY OrderPrice DESC;

#Task 3.d - Question (d)

SELECT T.Name
FROM Topping AS T
WHERE T.Name NOT IN
(SELECT T.Name FROM Orders AS O, Topping AS T WHERE O.ToppingID = T.ToppingID GROUP BY T.ToppingID);

#Task 3.f - Question (f)

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT T.Name, COUNT(O.ToppingID) AS ToppingCount
FROM Orders AS O, Topping AS T
WHERE O.ToppingID = T.ToppingID
GROUP BY T.ToppingID
ORDER BY ToppingCount DESC
LIMIT 10;

#Task 3.c and Task 3.e were not completed