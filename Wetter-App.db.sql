BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "wind_direction" (
	"pk_wind_direction"	TEXT,
	PRIMARY KEY("pk_wind_direction")
);
CREATE TABLE IF NOT EXISTS "time" (
	"pk_time"	INTEGER,
	PRIMARY KEY("pk_time")
);
CREATE TABLE IF NOT EXISTS "moon_phase" (
	"pk_moon_phase"	TEXT,
	PRIMARY KEY("pk_moon_phase")
);
CREATE TABLE IF NOT EXISTS "signs_of_the_zodiac" (
	"pk_signs_of_the_zodiac"	TEXT,
	PRIMARY KEY("pk_signs_of_the_zodiac")
);
CREATE TABLE IF NOT EXISTS "astronomy" (
	"pfk_weather_data_day_id"	INTEGER,
	"fk_moonrise"	INTEGER,
	"fk_moonset"	INTEGER,
	"fk_moon_phase"	TEXT,
	"fk_signs_of_the_zodiac"	TEXT,
	PRIMARY KEY("pfk_weather_data_day_id"),
	FOREIGN KEY("pfk_weather_data_day_id") REFERENCES "weather_data_day"("pk_id"),
	FOREIGN KEY("fk_signs_of_the_zodiac") REFERENCES "signs_of_the_zodiac"("pk_signs_of_the_zodiac"),
	FOREIGN KEY("fk_moon_phase") REFERENCES "moon_phase"("pk_moon_phase"),
	FOREIGN KEY("fk_moonrise") REFERENCES "time"("pk_time"),
	FOREIGN KEY("fk_moonset") REFERENCES "time"("pk_time")
);
CREATE TABLE IF NOT EXISTS "user" (
	"pk_name"	TEXT,
	"e-mail_address"	TEXT NOT NULL,
	"password"	TEXT NOT NULL,
	PRIMARY KEY("pk_name")
);
CREATE TABLE IF NOT EXISTS "saved_location" (
	"pk_id"	INTEGER,
	"fk_user_name"	TEXT,
	"fk_location_id"	INTEGER,
	PRIMARY KEY("pk_id" AUTOINCREMENT),
	FOREIGN KEY("fk_location_id") REFERENCES "location"("pk_id"),
	FOREIGN KEY("fk_user_name") REFERENCES "user"("pk_name")
);
CREATE TABLE IF NOT EXISTS "location" (
	"pk_id"	INTEGER,
	"city_name"	TEXT,
	"state_code"	TEXT,
	"country_code"	TEXT,
	"zip_code"	TEXT,
	"latitude"	NUMERIC NOT NULL,
	"longitude"	NUMERIC NOT NULL,
	PRIMARY KEY("pk_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sky_state" (
	"pk_sky_state"	TEXT,
	PRIMARY KEY("pk_sky_state")
);
CREATE TABLE IF NOT EXISTS "weather_data_hour" (
	"pk_id"	INTEGER,
	"fk_weather_data_day_id"	INTEGER NOT NULL,
	"fk_hour"	INTEGER NOT NULL,
	"temperature"	NUMERIC,
	"felt_temperature"	NUMERIC,
	"sky_state"	TEXT,
	"wind_speed"	NUMERIC,
	"wind_gust"	NUMERIC,
	"wind_degree"	NUMERIC,
	"fk_wind_direction"	TEXT,
	"precipitation_probability"	NUMERIC,
	"humidity"	NUMERIC,
	"air_pressure"	INTEGER,
	PRIMARY KEY("pk_id"),
	FOREIGN KEY("fk_weather_data_day_id") REFERENCES "weather_data_day"("pk_id"),
	FOREIGN KEY("fk_hour") REFERENCES "time"("pk_time"),
	FOREIGN KEY("fk_wind_direction") REFERENCES "wind_direction"("pk_wind_direction"),
	FOREIGN KEY("sky_state") REFERENCES "sky_state"("pk_sky_state")
);
CREATE TABLE IF NOT EXISTS "weather_data_day" (
	"pk_id"	INTEGER,
	"fk_location_id"	INTEGER NOT NULL,
	"datetime_utc"	INTEGER NOT NULL,
	"temperature"	NUMERIC,
	"max_temperature"	NUMERIC,
	"min_temperature"	NUMERIC,
	"sky_state"	TEXT,
	"max_felt_temperature"	NUMERIC,
	"min_felt_temperature"	NUMERIC,
	"wind_speed"	NUMERIC,
	"wind_gust"	NUMERIC,
	"wind_degree"	INTEGER,
	"fk_wind_direction"	TEXT,
	"precipitation_probability"	NUMERIC,
	"humidity"	NUMERIC,
	"air_pressure"	INTEGER,
	"fk_sunrise"	INTEGER,
	"fk_sunset"	INTEGER,
	"weather_report"	TEXT,
	PRIMARY KEY("pk_id"),
	FOREIGN KEY("sky_state") REFERENCES "sky_state"("pk_sky_state"),
	FOREIGN KEY("fk_sunset") REFERENCES "time"("pk_time"),
	FOREIGN KEY("fk_wind_direction") REFERENCES "wind_direction"("pk_wind_direction"),
	FOREIGN KEY("fk_location_id") REFERENCES "location"("pk_id"),
	FOREIGN KEY("fk_sunrise") REFERENCES "time"("pk_time")
);
INSERT INTO "wind_direction" VALUES ('N');
INSERT INTO "wind_direction" VALUES ('E');
INSERT INTO "wind_direction" VALUES ('S');
INSERT INTO "wind_direction" VALUES ('W');
INSERT INTO "wind_direction" VALUES ('NE');
INSERT INTO "wind_direction" VALUES ('SE');
INSERT INTO "wind_direction" VALUES ('SW');
INSERT INTO "wind_direction" VALUES ('NW');
INSERT INTO "time" VALUES (1);
INSERT INTO "time" VALUES (2);
INSERT INTO "time" VALUES (3);
INSERT INTO "time" VALUES (4);
INSERT INTO "time" VALUES (5);
INSERT INTO "time" VALUES (6);
INSERT INTO "time" VALUES (7);
INSERT INTO "time" VALUES (8);
INSERT INTO "time" VALUES (9);
INSERT INTO "time" VALUES (10);
INSERT INTO "time" VALUES (11);
INSERT INTO "time" VALUES (12);
INSERT INTO "time" VALUES (13);
INSERT INTO "time" VALUES (14);
INSERT INTO "time" VALUES (15);
INSERT INTO "time" VALUES (16);
INSERT INTO "time" VALUES (17);
INSERT INTO "time" VALUES (18);
INSERT INTO "time" VALUES (19);
INSERT INTO "time" VALUES (20);
INSERT INTO "time" VALUES (21);
INSERT INTO "time" VALUES (22);
INSERT INTO "time" VALUES (23);
INSERT INTO "time" VALUES (24);
COMMIT;
