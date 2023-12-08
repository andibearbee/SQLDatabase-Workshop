SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealerships_id
JOIN vehicles v ON i.vin = v.vin
WHERE v.model = 'C3';