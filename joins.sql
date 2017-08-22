-- 1) Which collars have a known owner? Display only collars
--    with known owners and those owners' names.

SELECT lost_dog_collars.dog_name AS collars_with_known_owners,
       dog_owners.name AS owner_name
FROM dog_owners
JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- 2) For which collars is there no known owner? Display only
--    collars without known owners.

SELECT lost_dog_collars.dog_name AS collars_without_known_owners_ಠ╭╮ಠ
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name)
WHERE dog_owners.dog_name IS NULL;

-- 3) What collars are in our possession? Display all collars
--    in our possession. If an owner exists for a given collar,
--    display that also.

SELECT lost_dog_collars.dog_name AS collars_in_our_possession,
       dog_owners.name AS owner_for_given_collar
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- 4) What owners do we know about? Display all owners known to
--    us. If a collar matches that owner, display the collar also.

SELECT dog_owners.name AS owners_we_know_about,
       lost_dog_collars.dog_name AS collar_that_matches_owner
FROM dog_owners
LEFT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);
