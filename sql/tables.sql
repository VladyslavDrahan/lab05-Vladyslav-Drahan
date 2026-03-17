CREATE TABLE "species" (
  "id" serial NOT NULL,
  PRIMARY KEY ("id"),
  "name" character varying(50) NOT NULL,
  "scientific_name" character varying(50) NOT NULL,
  "family" character varying(50) NOT NULL,
  "conservation_status" character varying(50) NOT NULL,
  "wingspan_cm" numeric(5,2) NOT NULL
);


CREATE TABLE birds (
    id SERIAL PRIMARY KEY,
    nickname VARCHAR(255) NOT NULL,
    ring_code VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER NOT NULL,
    species_id INTEGER NOT NULL,
    FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE RESTRICT
);


CREATE TABLE birdspotting (
    id SERIAL PRIMARY KEY,
    bird_id INTEGER NOT NULL,
    spotted_at TIMESTAMP NOT NULL,
    location VARCHAR(255) NOT NULL,
    observer_name VARCHAR(255) NOT NULL,
    notes TEXT NULL,
    FOREIGN KEY (bird_id) REFERENCES birds(id) ON DELETE CASCADE
);