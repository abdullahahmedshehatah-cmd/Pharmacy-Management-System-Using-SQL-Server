-- Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Painkillers'),
(2, 'Antibiotics'),
(3, 'Vitamins'),
(4, 'Diabetes'),
(5, 'Heart'),
(6, 'Skin Care');

-- Medicines
INSERT INTO Medicines (MedicineID, Name, Description, Price, QuantityInStock, MinimumStockLevel, CategoryID) VALUES
(1, 'Panadol', 'Pain relief', 20.00, 100, 10, 1),
(2, 'Amoxicillin', 'Antibiotic', 50.00, 50, 5, 2),
(3, 'Vitamin C', 'Immune support', 30.00, 80, 10, 3),
(4, 'Insulin', 'Diabetes treatment', 120.00, 40, 5, 4),
(5, 'Aspirin', 'Blood thinner', 25.00, 60, 10, 5),
(6, 'Moisturizer Cream', 'Skin hydration', 45.00, 30, 5, 6),
(7, 'Augmentin', 'Strong antibiotic', 70.00, 25, 5, 2),
(8, 'Vitamin D', 'Bone health', 35.00, 90, 10, 3);

-- Suppliers
INSERT INTO Suppliers (SupplierID, Name, Phone, Address) VALUES
(1, 'PharmaCo', '01012345678', 'Cairo'),
(2, 'MedSupply', '01198765432', 'Giza'),
(3, 'Global Pharma', '01222222222', 'Alexandria'),
(4, 'HealthCare Co', '01555555555', 'Mansoura');

-- SupplierInvoices
INSERT INTO SupplierInvoices (InvoiceID, SupplierID, InvoiceDate, TotalAmount) VALUES
(1, 1, '2026-04-01', 2000),
(2, 2, '2026-04-05', 1500),
(3, 3, '2026-04-08', 3000),
(4, 4, '2026-04-09', 2500);

-- InvoiceDetails
INSERT INTO InvoiceDetails (InvoiceDetailID, InvoiceID, MedicineID, Quantity, Price) VALUES
(1, 1, 1, 50, 18),
(2, 1, 2, 30, 45),
(3, 2, 3, 40, 25),
(4, 3, 4, 20, 110),
(5, 3, 5, 40, 20),
(6, 4, 6, 25, 40),
(7, 4, 7, 15, 60);

-- Customers
INSERT INTO Customers (CustomerID, Name, Phone, Address) VALUES
(1, 'Ahmed Ali', '01000000000', 'Cairo'),
(2, 'Sara Mohamed', '01111111111', 'Giza'),
(3, 'Omar Hassan', '01233333333', 'Alexandria'),
(4, 'Mona Adel', '01544444444', 'Mansoura');

-- Sales
INSERT INTO Sales (SaleID, CustomerID, SaleDate, TotalAmount) VALUES
(1, 1, '2026-04-10', 100),
(2, 2, '2026-04-11', 150),
(3, 3, '2026-04-12', 200),
(4, 4, '2026-04-13', 180);

-- SaleDetails
INSERT INTO SaleDetails (SaleDetailID, SaleID, MedicineID, Quantity, Price) VALUES
(1, 1, 1, 2, 20),
(2, 2, 2, 3, 50),
(3, 3, 4, 1, 120),
(4, 3, 8, 2, 35),
(5, 4, 5, 2, 25),
(6, 4, 6, 2, 45);

-- Payments
INSERT INTO Payments (PaymentID, SaleID, PaymentDate, Amount, PaymentMethod) VALUES
(1, 1, '2026-04-10', 100, 'Cash'),
(2, 2, '2026-04-11', 150, 'Card'),
(3, 3, '2026-04-12', 200, 'Cash'),
(4, 4, '2026-04-13', 180, 'Card');

-- Requests
INSERT INTO Requests (RequestID, CustomerID, MedicineName, RequestDate, Status) VALUES
(1, 1, 'Paracetamol Extra', '2026-04-12', 'Pending'),
(2, 2, 'Insulin', '2026-04-13', 'Approved'),
(3, 3, 'Blood Pressure Medicine', '2026-04-14', 'Pending'),
(4, 4, 'Allergy Tablets', '2026-04-15', 'Rejected');

-- Complaints
INSERT INTO Complaints (ComplaintID, CustomerID, ComplaintText, ComplaintDate, Status) VALUES
(1, 1, 'Late service', '2026-04-12', 'Open'),
(2, 2, 'Wrong medicine', '2026-04-13', 'Closed'),
(3, 3, 'High price', '2026-04-14', 'Open'),
(4, 4, 'Bad packaging', '2026-04-15', 'Closed');