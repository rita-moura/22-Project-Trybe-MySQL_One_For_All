SELECT a.name as artista,
	CASE 
	  WHEN COUNT(f.song_id) > 4 THEN 'A'
	  WHEN COUNT(f.song_id) > 2 THEN 'B'
	  WHEN COUNT(f.song_id) > 0 THEN 'C'
	  ELSE '-'
	END as ranking
FROM artists as a
	INNER JOIN songs as s
		ON a.artist_id = s.artist_id
	LEFT JOIN favorite_songs as f
		ON s.song_id = f.song_id
GROUP BY artista
ORDER BY COUNT(f.song_id) DESC, artista;