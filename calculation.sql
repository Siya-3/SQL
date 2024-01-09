SELECT * FROM pizza_db.stock1;
select s2.ing_name,s2.ordered_weight,ingredient.ing_weight,inventory.quantity,
ingredient.ing_weight*inventory.quantity as total_inv_weight
from(
select
ing_id,
ing_name,
	sum(ordered_weight) as ordered_weight
FROM
	stock1
    group by ing_name, ing_id) s2
LEFT JOIN inventory ON inventory.item_id = s2.ing_id
LEFT JOIN ingredient ON ingredient.ing_id = s2.ing_id;






























