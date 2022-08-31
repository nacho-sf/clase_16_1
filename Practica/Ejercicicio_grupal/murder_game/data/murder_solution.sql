-- Check asesinato
SELECT * FROM crime_scene_report
WHERE date = 20180115 AND type = "murder" AND city = "SQL City"
;

-- Buscar info de testigos "Northwestern Dr". Anabel "Franklin Ave"
SELECT * FROM person
WHERE name LIKE "%Annabel%" AND address_street_name = "Franklin Ave"
; -- Annabel Miller 16371

SELECT * FROM person
WHERE address_street_name = "Northwestern Dr" 
AND address_number = (SELECT MAX(address_number) FROM person WHERE address_street_name = "Northwestern Dr" )
; -- Morty Schapiro

SELECT *, max(address_number) FROM person
WHERE address_street_name = "Northwestern Dr" 
; -- Morty Schapiro 14887

-- Revisar testimonios testigos
SELECT * FROM interview WHERE person_id IN (16371, 14887); -- Miembro 48Z  Matrícula H42W Estuvo el 9th Jan

-- Revisar clientes gym
SELECT * FROM get_fit_now_member
WHERE id LIKE "48Z%" AND membership_status = "gold"; --48Z7A 48Z55

-- Revisar clientes gym
SELECT * FROM drivers_license
WHERE plate_number LIKE "%H42W%" AND gender = "male"
; -- 423327 664760

SELECT * FROM get_fit_now_check_in
WHERE membership_id IN ('48Z7A','48Z55')
;

SELECT * FROM person
WHERE license_id IN (423327,664760);

-- JEREMY BOWERS es el asesino!! Quién está detrás?
SELECT * FROM person WHERE name LIKE "%Jeremy Bowers%"; --67318

SELECT * FROM interview WHERE person_id = 67318;

SELECT person_id, count(event_id) FROM facebook_event_checkin 
WHERE event_name LIKE "%SQL Symphony Concert%" 
AND date >= "20171201" AND date <= "20171231"
GROUP BY 1
ORDER BY 2 DESC
; -- 99716 24556

SELECT p.*, d.* FROM person as p
INNER JOIN drivers_license as d ON p.license_id = d.id
WHERE p.id IN (99716, 24556);

-- Miranda Priestly ASESINA!!!