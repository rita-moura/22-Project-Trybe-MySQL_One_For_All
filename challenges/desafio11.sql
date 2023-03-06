SELECT 
	a.name as album,
    COUNT(*) as favoritadas
FROM albums as a
	INNER JOIN songs as s
		ON a.album_id = s.album_id
	INNER JOIN favorite_songs as f
		ON s.song_id = f.song_id
GROUP BY a.name
ORDER BY favoritadas DESC, a.name ASC
LIMIT 3;