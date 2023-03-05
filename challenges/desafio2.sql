SELECT
    COUNT(DISTINCT name) as cancoes,
    COUNT(DISTINCT artist_id) as artistas,
    COUNT(DISTINCT album_id) as albuns
FROM songs;