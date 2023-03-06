SELECT users.name as pessoa_usuaria, COUNT(history.song_id) as musicas_ouvidas, 
ROUND(SUM(songs.duration / 60), 2) as total_minutos
FROM users as users
	INNER JOIN history as history 
		ON users.user_id = history.user_id
	INNER JOIN songs as songs
		ON songs.song_id = history.song_id
GROUP BY users.name
ORDER BY users.name ASC;

