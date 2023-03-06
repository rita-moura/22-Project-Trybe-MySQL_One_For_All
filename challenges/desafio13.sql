SELECT
	CASE 
	  WHEN u.age > 60 THEN 'Maior de 60 anos'
	  WHEN u.age > 30 THEN 'Entre 31 e 60 anos'
	  ELSE 'Até 30 anos'
	END as faixa_etaria,
    COUNT(DISTINCT u.user_id) as total_pessoas_usuarias,
    COUNT(f.user_id) as total_favoritadas
FROM users as u
	LEFT JOIN favorite_songs as f
		ON u.user_id = f.user_id
GROUP BY faixa_etaria;