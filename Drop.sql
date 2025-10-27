DROP TABLE IF EXISTS "friends" CASCADE;
DROP TABLE IF EXISTS "group_memberships" CASCADE;
DROP TABLE IF EXISTS "travel_groups" CASCADE;
DROP TABLE IF EXISTS "locations" CASCADE;
DROP TABLE IF EXISTS "users" CASCADE;
DROP TABLE IF EXISTS "voyages" CASCADE;
DROP TABLE IF EXISTS "images" CASCADE;
DROP TABLE IF EXISTS "expenses" CASCADE;

-- fonction

DROP FUNCTION IF EXISTS update_object_image();
DROP FUNCTION IF EXISTS enforce_friendship_order();
DROP FUNCTION IF EXISTS update_travel_group_voyage_id();