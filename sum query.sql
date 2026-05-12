-- 1. عرض كل الأدوية مع التصنيف
SELECT maximum.Name, maximum.Price, c.CategoryName
FROM Medicines maximum
JOIN Categories c ON maximum.CategoryID = c.CategoryID;

-- 2. عرض المخزون المنخفض
SELECT Name, QuantityInStock, MinimumStockLevel
FROM Medicines
WHERE QuantityInStock <= MinimumStockLevel;

-- 3. عرض فواتير الموردين
SELECT s.Name AS SupplierName, si.InvoiceDate, si.TotalAmount
FROM SupplierInvoices si
JOIN Suppliers s ON si.SupplierID = s.SupplierID;

-- 4. تفاصيل فواتير الموردين
SELECT si.InvoiceID, maximum.Name, id.Quantity, id.Price
FROM InvoiceDetails id
JOIN Medicines maximum ON id.MedicineID = maximum.MedicineID
JOIN SupplierInvoices si ON id.InvoiceID = si.InvoiceID;

-- 5. عرض مبيعات العملاء
SELECT c.Name AS CustomerName, s.SaleDate, s.TotalAmount
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID;

-- 6. تفاصيل عمليات البيع
SELECT s.SaleID, maximum.Name, sd.Quantity, sd.Price
FROM SaleDetails sd
JOIN Medicines maximum ON sd.MedicineID = maximum.MedicineID
JOIN Sales s ON sd.SaleID = s.SaleID;

-- 7. إجمالي المدفوعات لكل عملية
SELECT SaleID, SUM(Amount) AS TotalPaid
FROM Payments
GROUP BY SaleID;

-- 8. عرض الطلبات المعلقة
SELECT *
FROM Requests
WHERE Status = 'Pending';

-- 9. عرض الشكاوى المفتوحة
SELECT *
FROM Complaints
WHERE Status = 'Open';

-- 10. إجمالي المبيعات
SELECT SUM(TotalAmount) AS TotalSales
FROM Sales;

-- 11. أكثر دواء مبيعًا
SELECT maximum.Name, SUM(sd.Quantity) AS TotalSold
FROM SaleDetails sd
JOIN Medicines maximum ON sd.MedicineID = maximum.MedicineID
GROUP BY maximum.Name
ORDER BY TotalSold DESC;

-- 12. أفضل عميل
SELECT c.Name, SUM(s.TotalAmount) AS TotalSpent
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
GROUP BY c.Name
ORDER BY TotalSpent DESC;

-- 13. إجمالي الإيرادات
SELECT SUM(sd.Quantity * sd.Price) AS TotalRevenue
FROM SaleDetails sd;