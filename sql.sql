CREATE TABLE "human" (
  "id" serial NOT NULL,
  "name"  character varying(500),
  "age" integer DEFAULT NULL,
  CONSTRAINT human_pkey PRIMARY KEY (id )
);

insert  into "human"("id","name","age") values (1,'Vasya',12);
insert  into "human"("id","name","age") values (2,'Maria',25);
insert  into "human"("id","name","age") values (3,'George',45);
insert  into "human"("id","name","age") values (4,'Clark Kent',77);
insert  into "human"("id","name","age") values (5,'Bob',18);
insert  into "human"("id","name","age") values (6,'Traveler',99);


CREATE TABLE "vacation_dist" (
  "id"  serial NOT NULL,
  "name" character varying(500) NOT NULL,
  CONSTRAINT human_pkey PRIMARY KEY (id )
)

insert  into "vacation_dist"("id","name") values (1,'Cuba');
insert  into "vacation_dist"("id","name") values (2,'Aruba');
insert  into "vacation_dist"("id","name") values (3,'Sochi');
insert  into "vacation_dist"("id","name") values (4,'Krypton');

CREATE TABLE "human_vacation_dist" (
  "human_id"  integer NOT NULL  REFERENCES "human" ("id"),
  "distination_id" integer NOT NULL REFERENCES "vacation_dist" ("id"),
  CONSTRAINT human_vacation_dist_pkey PRIMARY KEY (human_id)
)

insert  into "human_vacation_dist"("human_id","distination_id") values (1,1);
insert  into "human_vacation_dist"("human_id","distination_id") values (3,1);
insert  into "human_vacation_dist"("human_id","distination_id") values (4,1);
insert  into "human_vacation_dist"("human_id","distination_id") values (6,1);
insert  into "human_vacation_dist"("human_id","distination_id") values (2,2);
insert  into "human_vacation_dist"("human_id","distination_id") values (6,2);
insert  into "human_vacation_dist"("human_id","distination_id") values (1,3);
insert  into "human_vacation_dist"("human_id","distination_id") values (3,3);
insert  into "human_vacation_dist"("human_id","distination_id") values (6,3);
insert  into "human_vacation_dist"("human_id","distination_id") values (4,4);
insert  into "human_vacation_dist"("human_id","distination_id") values (6,4);


ANSWERS
1. -------------------------------------
SELECT
  max("h"."name"),
  array_agg(vacation_dist."name")
FROM "human" "h",
  "vacation_dist" "vacation_dist",
  "human_vacation_dist" "human_v_d"
WHERE "human_v_d"."human_id"="h"."id"
      AND "human_v_d"."distination_id"="vacation_dist"."id"
GROUP BY  "human_v_d"."human_id"

2. -------------------------------------
SELECT
  max("h"."name"),
  json_agg(vacation_dist."name") as "place22"
FROM "human" "h",
  "vacation_dist" "vacation_dist",
  "human_vacation_dist" "human_v_d"
WHERE "human_v_d"."human_id"="h"."id"
AND "human_v_d"."distination_id"="vacation_dist"."id"
AND vacation_dist."name"=ANY(ARRAY['Cuba', 'Sochi'])
GROUP BY  "human_v_d"."human_id"


3. -------------------------------------
SELECT
  max("h"."name"),
  array_agg(vacation_dist."name") "places"
FROM "human" "h",
  "vacation_dist" "vacation_dist",
  "human_vacation_dist" "human_v_d"
WHERE "human_v_d"."human_id"="h"."id"
      AND "human_v_d"."distination_id"="vacation_dist"."id"
      AND vacation_dist."name"= ANY(ARRAY ['Cuba', 'Sochi'])
GROUP BY  "human_v_d"."human_id"
HAVING array_agg(vacation_dist."name")=ARRAY ['Cuba', 'Sochi']::character varying[];
