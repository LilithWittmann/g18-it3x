SELECT
	t.`name`,
	c.name,
	GROUP_CONCAT(ca.name) attributNamen,
	GROUP_CONCAT(a.value) attributWerte
			
FROM
	`components` c
	
INNER JOIN
	component_types t
		ON t.id = c.type_id
	
LEFT JOIN
	`attribute_to_component` a
	ON a.component_id = c.id
	
LEFT JOIN
	component_attributes ca
		ON ca.id = a.attribute_id
		
GROUP BY
	a.component_id
	
ORDER BY
	c.type_id,
	ca.name

