CREATE DATABASE tripbudgetplanner;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE "locations" (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    city VARCHAR(150) NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE "users" (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    last_name VARCHAR(250),
    first_name VARCHAR(250),
    username VARCHAR(250) UNIQUE NOT NULL,
    password VARCHAR(250) NOT NULL,
    mail VARCHAR(250) UNIQUE NOT NULL,
    phone_numb VARCHAR(20),
    birthday DATE,
    location_id UUID REFERENCES "locations"(id) ON DELETE SET NULL
);

CREATE TABLE "friends" (
  id INT PRIMARY KEY REFERENCES "users"(id) ON DELETE CASCADE,
  friends_ids INT[] NOT NULL DEFAULT '{}'
);

CREATE TABLE "travel_groups" (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  member_ids INT[] NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);