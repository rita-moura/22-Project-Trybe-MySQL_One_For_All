SELECT user.name as pessoa_usuaria,
  CASE 
    WHEN MAX(YEAR(history.reproduction_date)) < 2021 
      THEN 'Inativa'
      ELSE 'Ativa'
  END as status_pessoa_usuaria
FROM users as user
  INNER JOIN history as history
    ON user.user_id = history.user_id
GROUP BY user.name
ORDER BY user.name;