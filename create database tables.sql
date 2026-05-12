-- Create Database
CREATE DATABASE Pharmacy_sys;
GO

USE Pharmacy_sys;
GO

-- Categories
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Medicines
CREATE TABLE Medicines (
    MedicineID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    QuantityInStock INT NOT NULL DEFAULT 0 CHECK (QuantityInStock >= 0),
    MinimumStockLevel INT NOT NULL CHECK (MinimumStockLevel >= 0),
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Suppliers
CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) UNIQUE,
    Address VARCHAR(255)
);

-- SupplierInvoices
CREATE TABLE SupplierInvoices (
    InvoiceID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierID INT NOT NULL,
    InvoiceDate DATE NOT NULL DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) CHECK (TotalAmount >= 0),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- InvoiceDetails (حل Many-to-Many)
CREATE TABLE InvoiceDetails (
    InvoiceDetailID INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceID INT NOT NULL,
    MedicineID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    FOREIGN KEY (InvoiceID) REFERENCES SupplierInvoices(InvoiceID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

-- Customers
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) UNIQUE,
    Address VARCHAR(255)
);

-- Sales
CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    SaleDate DATE NOT NULL DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- SaleDetails (حل Many-to-Many)
CREATE TABLE SaleDetails (
    SaleDetailID INT IDENTITY(1,1) PRIMARY KEY,
    SaleID INT NOT NULL,
    MedicineID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

-- Payments
CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    SaleID INT NOT NULL,
    PaymentDate DATE DEFAULT GETDATE(),
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
    PaymentMethod VARCHAR(50) CHECK (PaymentMethod IN ('Cash', 'Card', 'Online')),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
);

-- Requests
CREATE TABLE Requests (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    MedicineName VARCHAR(100) NOT NULL,
    RequestDate DATE DEFAULT GETDATE(),
    Status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Complaints
CREATE TABLE Complaints (
    ComplaintID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    ComplaintText VARCHAR(255) NOT NULL,
    ComplaintDate DATE DEFAULT GETDATE(),
    Status VARCHAR(50) DEFAULT 'Open',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);