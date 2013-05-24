	SELECT
		c.id
	
	FROM
		components c
	
	LEFT JOIN
		`component_to_ergonomics` cte
			ON cte.component_id = c.id
		
	WHERE
		cte.component_id IS NULL

