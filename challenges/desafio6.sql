SELECT 
	ROUND(MIN(p.plan_value), 2) as faturamento_minimo,
	ROUND(MAX(p.plan_value), 2) as faturamento_maximo,
    ROUND(AVG(p.plan_value), 2) as faturamento_medio,
    ROUND(SUM(p.plan_value), 2) as faturamento_total
FROM plans as p
	INNER JOIN users as u 
    ON u.plan_id = p.plan_id;