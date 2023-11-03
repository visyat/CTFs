#Terminal Command to Open SQL Editor
#docker run -v "$PWD/aurora.sql:/docker-entrypoint-initdb.d/aurora.sql:ro" -e MARIADB_ROOT_PASSWORD=bob -e MARIADB_DATABASE=aurora -d mariadb:11
#docker exec -it 5e76 mariadb -p aurora 

# Clean-Up on Aisle 5

#ATTEMPT 1
SELECT drug_id FROM drugs where drug_name="Starypax";
/*
+---------+
| drug_id |
+---------+
|      26 |
+---------+ */

SELECT facility_id, qty from inventory where drug_id=26 GROUP BY qty DESC LIMIT 1;
/*
+-------------+------+
| facility_id | qty  |
+-------------+------+
|         739 | 2997 |
+-------------+------+ */

SELECT city, state, zip, phone, facility_id from facilities where facility_id=739;
/*
+------------+-------+-------+--------------+-------------+
| city       | state | zip   | phone        | facility_id |
+------------+-------+-------+--------------+-------------+
| Fort Worth | TX    | 76129 | 555-637-4277 |         739 |
+------------+-------+-------+--------------+-------------+ */

SELECT locator from inventory where facility_id=739 AND drug_id=26;
/*
+---------+
| locator |
+---------+
| A18B9   |
+---------+ */

#ATTEMPT 2
SELECT * from facilities INNER JOIN inventory on facilities.facility_id=inventory.facility_id AND drug_id=26 GROUP BY qty DESC LIMIT 10; 
/*
+-------------+--------------+--------------------------+---------------+-------+-------+--------+---------+-------------+---------+------+
| facility_id | phone        | street                   | city          | state | zip   | inv_id | drug_id | facility_id | locator | qty  |
+-------------+--------------+--------------------------+---------------+-------+-------+--------+---------+-------------+---------+------+
|         739 | 555-637-4277 | 6869 Evergreen Lane      | Fort Worth    | TX    | 76129 |  18269 |      26 |         739 | A18B9   | 2997 |
|         648 | 555-622-8582 | 86267 Stone Corner Court | New York City | NY    | 10150 |  17871 |      26 |         648 | A27B37  | 2995 |
|         616 | 555-387-0612 | 689 La Follette Alley    | Lynchburg     | VA    | 24515 |   9555 |      26 |         616 | A2B49   | 2994 |
|         245 | 555-154-8418 | 98495 Mendota Circle     | Mobile        | AL    | 36622 |   1891 |      26 |         245 | A1B33   | 2992 |
|         172 | 555-445-2790 | 660 Bay Way              | Kansas City   | KS    | 66160 |  11841 |      26 |         172 | A16B6   | 2991 |
|         158 | 555-557-0336 | 42832 Garrison Crossing  | Portland      | OR    | 97221 |  15587 |      26 |         158 | A12B28  | 2980 |
|         188 | 555-403-4156 | 4143 Badeau Park         | Sacramento    | CA    | 95813 |  10236 |      26 |         188 | A26B9   | 2975 |
|         658 | 555-922-4560 | 93939 Oak Valley Place   | New York City | NY    | 10184 |  28675 |      26 |         658 | A26B42  | 2968 |
|        1397 | 555-900-6663 | 31 Thackeray Road        | Fort Worth    | TX    | 76115 |  27868 |      26 |        1397 | A16B45  | 2966 |
|        1111 | 555-287-0800 | 4884 Nancy Crossing      | Montpelier    | VT    | 05609 |   6278 |      26 |        1111 | A17B2   | 2964 |
+-------------+--------------+--------------------------+---------------+-------+-------+--------+---------+-------------+---------+------+ */

#ATTEMPT 3 -- AFTER CHECKING GHOSTFACE FOR ADDITIONAL HINTS 
SELECT * from facilities INNER JOIN inventory on facilities.facility_id=inventory.facility_id AND drug_id=26 AND city="Phoenix" GROUP BY qty DESC LIMIT 10;
/*
+-------------+--------------+------------------------+---------+-------+-------+--------+---------+-------------+---------+------+
| facility_id | phone        | street                 | city    | state | zip   | inv_id | drug_id | facility_id | locator | qty  |
+-------------+--------------+------------------------+---------+-------+-------+--------+---------+-------------+---------+------+
|         412 | 555-933-8122 | 6 Riverside Park       | Phoenix | AZ    | 85040 |  29078 |      26 |         412 | A11B44  | 2740 |
|         567 | 555-190-7465 | 8 Main Pass            | Phoenix | AZ    | 85083 |   3211 |      26 |         567 | A11B51  | 2737 |
|         706 | 555-687-2891 | 3807 Chinook Junction  | Phoenix | AZ    | 85040 |  19980 |      26 |         706 | A4B20   | 2573 |
|        1058 | 555-797-7877 | 79 Bowman Crossing     | Phoenix | AZ    | 85067 |  24607 |      26 |        1058 | A7B25   | 2524 |
|         434 | 555-195-7871 | 4098 Rutledge Trail    | Phoenix | AZ    | 85020 |   3374 |      26 |         434 | A43B51  | 2480 |
|          40 | 555-949-5598 | 02 Fairview Plaza      | Phoenix | AZ    | 85005 |  29609 |      26 |          40 | A39B38  | 2411 |
|         178 | 555-234-9188 | 4430 Randy Street      | Phoenix | AZ    | 85099 |   4696 |      26 |         178 | A17B32  | 2023 |
|        1388 | 555-573-5903 | 65 Fairview Park       | Phoenix | AZ    | 85053 |  16071 |      26 |        1388 | A30B23  | 1853 |
|         442 | 555-669-3391 | 6876 Caliangt Crossing | Phoenix | AZ    | 85030 |  19353 |      26 |         442 | A23B24  | 1382 |
|        1110 | 555-773-0868 | 7365 Moulton Way       | Phoenix | AZ    | 85077 |  23588 |      26 |        1110 | A17B49  |  573 |
+-------------+--------------+------------------------+---------+-------+-------+--------+---------+-------------+---------+------+ */
