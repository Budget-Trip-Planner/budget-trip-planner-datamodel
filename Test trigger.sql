-- Ordonnancement ID friend

-- On insère (3,1), le trigger doit inverser en (1,3)
INSERT INTO friends (user_id, friend_id) VALUES (3, 1);

-- On vérifie :
SELECT * FROM friends WHERE user_id = 1 AND friend_id = 3;

SELECT * FROM friends WHERE user_id = 3 AND friend_id = 1;

-- On supprime :
DELETE FROM friends WHERE user_id = 1 AND friend_id = 3;

DELETE FROM friends WHERE user_id = 3 AND friend_id = 1;


-- Ajout d'image automatique

-- On insère une image liée à l'utilisateur 5. Cela doit déclencher le trigger qui met à jour profile_image_id
INSERT INTO images (url, object_type, object_id)
VALUES ('https://cdn.example.com/images/profil_test.jpg', 'users', 5);
INSERT INTO images (url, object_type, object_id)
VALUES ('https://cdn.example.com/images/voyage_test.jpg', 'voyages', 5);

-- On vérifie :

SELECT * FROM images WHERE object_type = 'users' AND object_id = 5 ORDER BY id DESC LIMIT 1;
SELECT * FROM images WHERE object_type = 'voyages' AND object_id = 5 ORDER BY id DESC LIMIT 1;

SELECT id, username, profile_image_id FROM users WHERE id = 5;
SELECT * FROM voyages WHERE id = 5;

-- On supprime :
DELETE FROM images WHERE object_type = 'users' AND object_id = 5;
DELETE FROM images WHERE object_type = 'voyages' AND object_id = 5;


-- Ajout voyage dans travel_groupe

-- On insère :
WITH created_group AS (
  INSERT INTO travel_groups (name)
  VALUES ('Voyage Prague')
  RETURNING id
),
created_voyage AS (
  INSERT INTO voyages (
      object_type,
      object_id,
      destination,
      budget_total,
      duration_days,
      start_date
  )
  SELECT
      'travel_groups',
      id,
      'Prague',
      3200.00,
      5,
      '2026-02-15'
  FROM created_group
  RETURNING id
)
SELECT created_group.id FROM created_group;

-- On vérifie (modifier id avec celui récupéré dans l'insertion:
--                                     ici
SELECT * FROM travel_groups WHERE id = 11;



