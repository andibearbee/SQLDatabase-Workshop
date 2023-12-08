SELECT *
FROM sales_contracts
JOIN vehicles 
ON s.vin = v.vin
JOIN inventory 
ON v.vin = i.vin
WHERE i.dealerships_id = 2
    AND s.sale_date BETWEEN '2022-02-01' AND '2023-01-31';