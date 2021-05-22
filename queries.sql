SELECT client.name AS "nombre cliente",
	client.surname AS "apellido cliente",
    product.name AS "nombre producto",
    supplier.name AS "nombre proveedor"
FROM client
JOIN client_has_product ON client.id = client_has_product.client_id
JOIN product ON product.id = client_has_product.product_id
JOIN supplier ON product.supplier_id = supplier.id
WHERE product.code = 321;

SELECT name AS "nombre producto", price AS "precio"
FROM product
WHERE price = (SELECT MAX(price) FROM product)
LIMIT 1;

SELECT name AS "nombre producto", price AS "precio"
FROM product
WHERE price = (SELECT MIN(price) FROM product)
LIMIT 1;

SELECT product.name AS "nombre producto", supplier.name AS "proveedor"
FROM product
JOIN supplier ON product.supplier_id = supplier.id
WHERE supplier.nif = "77.654.321-0"
LIMIT 5;