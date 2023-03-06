SELECT 
	art.name as artista, 
	alb.name as album,
	COUNT(fol.artist_id) as pessoas_seguidoras
FROM artists as art
	INNER JOIN albums as alb
		ON alb.artist_id = art.artist_id
	INNER JOIN followers as fol
		ON fol.artist_id = art.artist_id
GROUP BY art.name, alb.name
ORDER BY pessoas_seguidoras DESC, art.name ASC, alb.name ASC;