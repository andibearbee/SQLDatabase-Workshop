SELECT *
FROM vehicles
JOIN inventory ON v.vin = i.vin
WHERE i.dealerships_id = 3;