SELECT COUNT(*) as musicas_no_historico
FROM history as h
	INNER JOIN users as u
		ON h.user_id = u.user_id
WHERE u.name = 'Barbara Liskov';