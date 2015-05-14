Use Northwind;
Go

-- Úloha è. 6
SELECT 'Shipper' AS Shipper,  [1], [2], [3]
FROM (Select ShipVia FROM Orders) AS SourceTable
PIVOT
(
COUNT(ShipVia)
FOR ShipVia IN ([1], [2], [3])
) AS PivotTable;
