SELECT *
FROM dealerships
JOIN inventory 
ON d.dealership_id = i.dealerships_id
WHERE i.vin = '9sU2iL3yG5fE8pA7r';