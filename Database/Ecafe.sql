-----------------------ECafe Data-Base creation query------------------
DROP DATABASE IF EXISTS ECafe;

-----------------------------------------------------------------------
CREATE DATABASE ECafe;

-----------------------------------------------------------------------
USE DATABASE ECafe;
GO

-----------------------------------------------------------------------
CREATE TABLE PS4 (
    PS4ID INT IDENTITY(1,1) PRIMARY KEY,
    PS4State BIT, /*0-Busy 1-Available*/
    PS4Status BIT /*0-Inactive 1-Active*/
);

-----------------------------------------------------------------------
CREATE TABLE Utilizer (
    UtilizerID INT IDENTITY(1,1) PRIMARY KEY,
    UtilizerName CHAR(255),
    UtilizerType BIT,  /*0-Worker 1-Manager*/
	UtilizerStatus BIT /*0-Active 1-Blocked*/
);

-----------------------------------------------------------------------
CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName CHAR(255),
    EmployeeSalary INT,
	EmployeeNote CHAR(255),
	EmployeeStatus BIT /*0-Fired 1-Active*/
);

-----------------------------------------------------------------------
CREATE TABLE Reciept (
    RecieptID INT IDENTITY(1,1) PRIMARY KEY,
    RecieptTotal INT,
    RecieptRelatedPS4ID INT,
	RecieptDate DATE,
	RecieptTime TIME,
	RecieptStatus BIT,  /*0-Notpaid 1-Paid*/
	FOREIGN KEY (RecieptRelatedPS4ID) REFERENCES PS4(PS4ID)
);

-----------------------------------------------------------------------
CREATE TABLE Expense (
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    ExpenseReason CHAR(255),
    ExpenseTotal INT,
	ExpenseDate DATE,
	ExpenseTime TIME,
	ExpenseRecieptNumber INT,  
	FOREIGN KEY (ExpenseRecieptNumber) REFERENCES Reciept(RecieptID)
);

-----------------------------------------------------------------------
CREATE TABLE Income (
    IncomeID INT IDENTITY(1,1) PRIMARY KEY,
    IncomeReason CHAR(255),
    IncomeTotal INT,
	IncomeDate DATE,
	IncomeTime TIME,
	IncomeRecieptNumber INT,  
	FOREIGN KEY (IncomeRecieptNumber) REFERENCES Reciept(RecieptID)
);

-----------------------------------------------------------------------
CREATE TABLE PriceList (
    PriceListID INT IDENTITY(1,1) PRIMARY KEY,
    PriceListItem CHAR(255),
    Price INT
);

-----------------------------------------------------------------------
CREATE TABLE PS4Rental (
    PS4RentalID INT IDENTITY(1,1) PRIMARY KEY,
    PS4RentalNote CHAR(255),
    PS4RentalPS4ID INT,
	PS4RentalDate DATE,
	PS4RentalStartTime TIME,
	PS4RentalEndTime TIME,
	PS4RentalTotalHours DECIMAL(18,3),
    PS4RentalTotalPrice DECIMAL(18,3),
 	PS4RentalRecieptNumber INT,
	FOREIGN KEY (PS4RentalRecieptNumber) REFERENCES Reciept(RecieptID),
	FOREIGN KEY (PS4RentalPS4ID) REFERENCES PS4(PS4ID)
);

-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------