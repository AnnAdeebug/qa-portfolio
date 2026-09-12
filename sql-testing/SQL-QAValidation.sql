-- SQL QA Validation
-- Database: qa_shop
-- Purpose: Validate data accuracy, consistency and business rules

USE qa_shop;


-- 1. Check for missing user emails
SELECT *
FROM users
WHERE userEmail IS NULL
   OR userEmail = '';


-- 2. Check for missing user names
SELECT *
FROM users
WHERE userName IS NULL
   OR userName = '';


-- 3. Check for invalid product prices
SELECT *
FROM products
WHERE price <= 0;


-- 4. Check for incorrect order totals
SELECT
    o.orderId,
    p.productName,
    o.totalPrice,
    (p.price * o.quantity) AS expectedTotal
FROM orders o
JOIN products p
    ON o.productId = p.productId
WHERE o.totalPrice != (p.price * o.quantity);


-- 5. Check for duplicate user emails
SELECT userEmail, COUNT(*) AS emailCount
FROM users
GROUP BY userEmail
HAVING COUNT(*) > 1;


-- 6. Check for orders linked to non-existing users
SELECT o.orderId, o.userId
FROM orders o
LEFT JOIN users u
    ON o.userId = u.userId
WHERE u.userId IS NULL;


-- 7. Check for orders linked to non-existing products
SELECT o.orderId, o.productId
FROM orders o
LEFT JOIN products p
    ON o.productId = p.productId
WHERE p.productId IS NULL;


-- 8. Check for missing order data
SELECT *
FROM orders
WHERE userId IS NULL
   OR productId IS NULL
   OR quantity IS NULL
   OR totalPrice IS NULL;


-- 9. Check for invalid order quantities
SELECT *
FROM orders
WHERE quantity <= 0;


-- 10. Check whether order quantity > product stock
SELECT
    o.orderId,
    p.productName,
    o.quantity,
    p.stock
FROM orders o
JOIN products p
    ON o.productId = p.productId
WHERE o.quantity > p.stock;

-- 11. Verify that an update affected only the intended user
SELECT *
FROM users
WHERE userId = 1;