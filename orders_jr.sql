-- Get a list of all orders with customer names and delivery addresses: --
SELECT
    o.order_id,
    c.cust_firstname,
    c.cust_lastname,
    a.delivery_address1,
    a.delivery_address2,
    a.delivery_city,
    a.delivery_zipcode
FROM
    orders o
INNER JOIN
    customers c
ON
    o.cust_id = c.cust_id
INNER JOIN
    address a
ON
    o.add_id = a.add_id;
    
-- Find the total quantity of items ordered by each customer: --
SELECT
    c.cust_id,
    c.cust_firstname,
    c.cust_lastname,
    SUM(o.quantity) AS total_quantity_ordered
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.cust_id = o.cust_id
GROUP BY
    c.cust_id, c.cust_firstname, c.cust_lastname;

-- Find the most recent order for each customer: --
SELECT
    c.cust_id,
    c.cust_firstname,
    c.cust_lastname,
    MAX(o.created_at) AS most_recent_order_date
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.cust_id = o.cust_id
GROUP BY
    c.cust_id, c.cust_firstname, c.cust_lastname;

-- Count the number of orders placed for each delivery address: --
SELECT
    a.delivery_address1,
    a.delivery_address2,
    a.delivery_city,
    a.delivery_zipcode,
    COUNT(o.order_id) AS order_count
FROM
    address a
LEFT JOIN
    orders o
ON
    a.add_id = o.add_id
GROUP BY
    a.delivery_address1, a.delivery_address2, a.delivery_city, a.delivery_zipcode;

-- Retrieve all orders that have not been delivered (where 0 means not delivered and 1 means delivered): --
SELECT
    o.order_id,
    o.created_at,
    o.delivery
FROM
    orders o
WHERE
    o.delivery = 0;

-- Find the total quantity and total value of items ordered for each customer: --
SELECT
    c.cust_id,
    c.cust_firstname,
    c.cust_lastname,
    SUM(o.quantity) AS total_quantity_ordered,
    SUM(o.quantity * item_price) AS total_order_value
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.cust_id = o.cust_id
LEFT JOIN
    item i
ON
    o.item_id = i.item_id
GROUP BY
    c.cust_id, c.cust_firstname, c.cust_lastname;

-- Recipes and Ingredients Tables:
-- This query combines the Recipes and Ingredients tables to retrieve recipes along with the ingredients used in each recipe. --

SELECT
    r.recipe_id,
    r.ing_id,
    r.quantity AS recipe_quantity,
    ing.ing_name,
    ing.ing_weight,
    ing.ing_meas,
    ing.ing_price
FROM
    recipe r
LEFT JOIN
    ingredient ing ON r.ing_id = ing.ing_id;

-- Inventory and Items Tables:

-- This query combines the Inventory and Items tables to retrieve information about the available inventory for each item.
SELECT
    i.item_id,
    i.sku,
    i.item_name,
    i.item_cat,
    i.item_size,
    i.item_price,
    inv.quantity AS inventory_quantity
FROM
    item i
LEFT JOIN
    inventory inv ON i.item_id = inv.item_id;
    
-- Rota and Staff Tables:

-- This query combines the Rota and Staff tables to get information about staff scheduling and their details.

SELECT
    ro.rota_id,
    ro.date AS rota_date,
    ro.shift_id AS rota_shift_id,
    s.day_of_week,
    s.start_time,
    s.end_time,
    st.staff_id AS staff_id,
    st.first_name AS staff_first_name,
    st.last_name AS staff_last_name,
    st.position,
    st.hourly_rate
FROM
    rota ro
LEFT JOIN
    staff st ON ro.staff_id = st.staff_id
LEFT JOIN
    shift s ON ro.shift_id = s.shift_id;

-- Calculations

-- Total Order Value:
-- This query calculates the total order value for each order by multiplying the quantity of each item by its price and then summing it up.

SELECT
    o.order_id,
    SUM(o.quantity * i.item_price) AS total_order_value
FROM
    orders o
JOIN
    item i ON o.item_id = i.item_id
GROUP BY
    o.order_id;

-- Ingredient Cost in Recipes:
-- This query calculates the cost of ingredients used in each recipe by multiplying the quantity of each ingredient by its price and then summing it up.

SELECT
    r.recipe_id,
    SUM(r.quantity * ing.ing_price) AS ingredient_cost
FROM
    recipe r
JOIN
    ingredient ing ON r.ing_id = ing.ing_id
GROUP BY
    r.recipe_id;

-- Average Hourly Rate by Position:
-- This query calculates the average hourly rate for each staff position.

SELECT
    staff.position,
    AVG(staff.hourly_rate) AS avg_hourly_rate
FROM
    staff
GROUP BY
    staff.position;

-- Total Inventory Value:
-- This query calculates the total value of the inventory for each item by multiplying the quantity of each item by its price and then summing it up.

SELECT
    i.item_id,
    i.sku,
    SUM(inv.quantity * i.item_price) AS total_inventory_value
FROM
    item i
JOIN
    inventory inv ON i.item_id = inv.item_id
GROUP BY
    i.item_id, i.sku;
    
-- Total Sales by Customer:
-- This query calculates the total sales for each customer by summing the values of their orders.

SELECT
    c.cust_id,
    c.cust_firstname,
    c.cust_lastname,
    SUM(o.quantity * i.item_price) AS total_sales
FROM
    customers c
LEFT JOIN
    orders o ON c.cust_id = o.cust_id
LEFT JOIN
    item i ON o.item_id = i.item_id
GROUP BY
    c.cust_id, c.cust_firstname, c.cust_lastname;

-- ********************************************************** --

-- retrieving specific columns from the tables "orders," "item," and "address" while using LEFT JOIN
SELECT o.order_id,
item.item_id,
address.add_id,
item.item_price,
o.quantity,
item.item_cat,
item.item_name,
o.created_at,
address.delivery_address1,
address.delivery_address2,
address.delivery_city,
address.delivery_zipcode,
o.delivery
FROM 
	orders o
	LEFT JOIN item on o.item_id=item.item_id
	LEFT JOIN address on o.add_id=address.add_id;

-- TOTAL QUANTITY BY INGREDIENT (NO. OF ORDERS x INGREDIENT QUANTITY IN RECIPE)
SELECT S1.item_name,S1.ing_id,S1.ing_name,S1.ing_weight,S1.ing_price,S1.order_quantity,S1.recipe_quantity,
S1.order_quantity*recipe_quantity AS ordered_weight,
S1.ing_price/S1.ing_weight as unit_cost,
(S1.order_quantity*S1.recipe_quantity)*(S1.ing_price/S1.ing_weight) as ingredient_cost_1
FROM
(
SELECT 
o.item_id,
item.sku,
item.item_name,
recipe.ing_id,
ingredient.ing_name,
ingredient.ing_weight,
ingredient.ing_price,
recipe.quantity AS recipe_quantity,
SUM(o.quantity) AS order_quantity
FROM orders o
LEFT JOIN item on o.item_id=item.item_id
LEFT JOIN recipe on item.sku=recipe.recipe_id
LEFT JOIN ingredient on ingredient.ing_id=recipe.ing_id
GROUP BY o.item_id,item.sku,item.item_name,recipe.ing_id,recipe.quantity,ingredient.ing_name,ingredient.ing_weight, 
ingredient.ing_price) S1;

--  retrieving data from the "rota" table and joining it with the "staff" and "shift" tables.
select
rota.date,
staff.first_name,
staff.last_name,
staff.hourly_rate,
shift.start_time,
shift.end_time,
((hour(timediff(shift.end_time,shift.start_time))*60)+(minute(timediff(shift.end_time,shift.start_time))))/60 as hours_in_shift,
((hour(timediff(shift.end_time,shift.start_time))*60)+(minute(timediff(shift.end_time,shift.start_time))))/60 *staff.hourly_rate as staff_cost
from rota
left join staff on rota.staff_id = staff.staff_id
left join shift on rota.shift_id = shift.shift_id;

-- VIEW

CREATE VIEW stock5 AS
SELECT S1.item_name,S1.ing_id,S1.ing_name,S1.ing_weight,S1.ing_price,S1.order_quantity,S1.recipe_quantity,
S1.order_quantity*recipe_quantity AS ordered_weight,
S1.ing_price/S1.ing_weight as unit_cost,
(S1.order_quantity*S1.recipe_quantity)*(S1.ing_price/S1.ing_weight) as ingredient_cost_1
FROM
(
SELECT 
o.item_id,
item.sku,
item.item_name,
recipe.ing_id,
ingredient.ing_name,
ingredient.ing_weight,
ingredient.ing_price,
recipe.quantity AS recipe_quantity,
SUM(o.quantity) AS order_quantity
FROM orders o
LEFT JOIN item on o.item_id=item.item_id
LEFT JOIN recipe on item.sku=recipe.recipe_id
LEFT JOIN ingredient on ingredient.ing_id=recipe.ing_id
GROUP BY o.item_id,item.sku,item.item_name,recipe.ing_id,recipe.quantity,ingredient.ing_name,ingredient.ing_weight, 
ingredient.ing_price) S1;

SELECT * FROM pizza_db.stock5;