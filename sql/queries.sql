Select * 
From species 
WHERE wingspan_cm > 50 
ORDER BY wingspan_cm DESC 
LIMIT 2; 


SELECT b.nickname, b.ring_code, s.name AS species_name
FROM birds b
JOIN species s
ON b.species_id = s.id;


SELECT b.nickname, COUNT(*) AS sightings_count
FROM birdspotting bs
JOIN birds b ON bs.bird_id = b.id
GROUP BY b.id, b.nickname
ORDER BY sightings_count DESC;