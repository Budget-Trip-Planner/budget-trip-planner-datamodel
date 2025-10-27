-- Ordonnancement ID friend
CREATE OR REPLACE FUNCTION enforce_friendship_order()
RETURNS TRIGGER AS $$
DECLARE
    temp INT;
BEGIN
    IF NEW.user_id > NEW.friend_id THEN
        temp := NEW.user_id;
        NEW.user_id := NEW.friend_id;
        NEW.friend_id := temp;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_friends
BEFORE INSERT ON friends
FOR EACH ROW
EXECUTE FUNCTION enforce_friendship_order();

-- Ajout d'image automatique

CREATE OR REPLACE FUNCTION update_object_image()
RETURNS TRIGGER AS $$
BEGIN
    -- Mise à jour de l'image de profil d'un utilisateur
    IF NEW.object_type = 'users' THEN
        UPDATE users
        SET profile_image_id = NEW.id
        WHERE id = NEW.object_id;

    -- Mise à jour de l'image de couverture d'un voyage
    ELSIF NEW.object_type = 'voyages' THEN
        UPDATE voyages
        SET cover_image_id = NEW.id
        WHERE id = NEW.object_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_insert_image_user
AFTER INSERT ON images
FOR EACH ROW
EXECUTE FUNCTION update_object_image();

-- liaison travel_groups et voyage

CREATE OR REPLACE FUNCTION update_travel_group_voyage_id()
RETURNS TRIGGER AS $$
BEGIN
    -- Si le voyage est lié à un groupe, on met à jour la colonne voyage_id du groupe
    IF NEW.object_type = 'travel_groups' THEN
        UPDATE travel_groups
        SET voyage_id = NEW.id
        WHERE id = NEW.object_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_update_travel_group_voyage ON voyages;

CREATE TRIGGER trg_update_travel_group_voyage
AFTER INSERT ON voyages
FOR EACH ROW
EXECUTE FUNCTION update_travel_group_voyage_id();

