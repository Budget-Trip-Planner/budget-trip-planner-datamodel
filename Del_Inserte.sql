TRUNCATE TABLE "users", "locations" RESTART IDENTITY CASCADE;

DELETE FROM "users"
WHERE username = 'titi';