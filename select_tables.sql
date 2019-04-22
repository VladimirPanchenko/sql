SELECT brand."name", product_type."type", P.description, P.quantity, P.warranty, P.available, P.price, promo_cod.discount
FROM product AS P
INNER JOIN brand ON P.brand_id = brand.id
INNER JOIN product_type ON P.product_type_id = product_type.id
INNER JOIN promo_cod ON P.promo_cod_id = promo_cod.id;


SELECT product.warranty
FROM product
GROUP BY product.warranty;

SELECT *
FROM product
ORDER BY price;

SELECT *
FROM product
ORDER BY price DESC;

SELECT *
FROM product
WHERE quantity < 10;

