SELECT song.name as cancao, COUNT(history.user_id) as reproducoes
FROM songs as song
	INNER JOIN history as history
		ON history.song_id = song.song_id
GROUP BY song.name       
ORDER BY reproducoes DESC, song.name ASC LIMIT 2;