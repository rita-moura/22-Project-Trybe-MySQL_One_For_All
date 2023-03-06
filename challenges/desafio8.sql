SELECT 
  album.name as album, 
  a.name as artista
FROM artists as a
	INNER JOIN albums as album
		ON album.artist_id = a.artist_id
GROUP BY a.name, album.name
HAVING a.name = 'Elis Regina'
ORDER BY album.name;