-- Active: 1747575156757@@localhost@5432@conservation_db


-- the solution of problem --> 1
INSERT INTO rangers (name,region)
VALUES('Derek Fox','Coastal Plains');



-- the solution of problem --> 2
SELECT count(DISTINCT species_id) as unique_species_count FROM sightings;

-- the solution of problem --> 3
SELECT * FROM sightings
WHERE location LIKE '%Pass';

-- -- the solution of problem --> 4

SELECT name, count(*) as total_sightings FROM sightings
INNER JOIN rangers using(ranger_id)
GROUP BY name ORDER BY name ASC;

--  the solution of problem --> 5
SELECT common_name from species 
LEFT JOIN sightings USING(species_id)
WHERE sighting_id IS NULL;

--  the solution of problem --> 6

SELECT common_name,sighting_time,name FROM sightings 
JOIN species USING(species_id)
JOIN rangers USING(ranger_id) ORDER BY sighting_time DESC LIMIT 2;

--  the solution of problem --> 7

UPDATE species
SET conservation_status = 'Historic'
WHERE extract(year from discovery_date) < 1800;



--  the solution of problem --> 8
SELECT sighting_id,
CASE 
    WHEN  (extract(Hour FROM sighting_time)) < 12 THEN  'Morning'
    WHEN (extract(Hour FROM sighting_time)) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE  'Evening'
END  time_of_day 
  FROM sightings ;


--  the solution of problem --> 9
DELETE FROM rangers
WHERE ranger_id NOT IN(
    SELECT ranger_id FROM sightings
);

