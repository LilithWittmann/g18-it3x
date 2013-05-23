SELECT AVG(price) avgPrice, (SELECT name FROM components ORDER BY price DESC LIMIT 1) mostExpensiveProduct, (SELECT name FROM components ORDER BY price ASC LIMIT 1) cheapestProduct
FROM `components`
GROUP BY type_id