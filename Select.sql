SELECT u.username, u.first_name, u.last_name, u.mail
FROM "users" u
WHERE u.id IN (
  SELECT unnest(friends_ids) as id
  FROM "friends"
  WHERE id = (SELECT id FROM "users" WHERE username = 'titi')
);


SELECT unnest(friends_ids) as id
  FROM "friends"
  WHERE id = (SELECT id FROM "users" WHERE username = 'titi');