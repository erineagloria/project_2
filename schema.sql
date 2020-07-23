CREATE DATABASE theloop; 

\c theloop; -- to connect to the database

CREATE TABLE companies (
    company_id SERIAL PRIMARY KEY,
    company TEXT,
    main_contact TEXT,
    email TEXT,
    password_digest TEXT
);

CREATE TABLE events (
    id  SERIAL PRIMARY KEY, 
    company_id INTEGER,
    event_type TEXT, 
    event_date DATE,
    venue TEXT,
    guests INTEGER, 
    theme TEXT, 
    budget REAL,
    image_url TEXT
);

\d events-- shows you structure of the table

ALTER TABLE events ALTER COLUMN budget TYPE NUMERIC(10,2) USING budget::NUMERIC; 

ALTER TABLE events ADD COLUMN notes TEXT;  


