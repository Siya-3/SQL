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
left join shift on rota.shift_id = shift.shift_id