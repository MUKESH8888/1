-- ====================================================================
-- EcoBug Database Schema (PostgreSQL / Supabase compatible)
-- ====================================================================

-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- --------------------------------------------------------------------
-- 1. USERS TABLE
-- --------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'USER',
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- --------------------------------------------------------------------
-- 2. PLANTS & RELATED TABLES
-- --------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS plants (
    id BIGSERIAL PRIMARY KEY,
    scientific_name VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    common_names VARCHAR(500),
    image_url VARCHAR(1000),
    plant_type VARCHAR(100),
    foliage_colour VARCHAR(100),
    climatic_zone VARCHAR(100),
    iucn_status VARCHAR(100),
    uses TEXT
);

CREATE INDEX IF NOT EXISTS idx_plants_scientific_name ON plants(scientific_name);
CREATE INDEX IF NOT EXISTS idx_plants_filters ON plants(plant_type, foliage_colour, climatic_zone);

CREATE TABLE IF NOT EXISTS plant_keywords (
    plant_id BIGINT NOT NULL REFERENCES plants(id) ON DELETE CASCADE,
    keyword VARCHAR(255) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_plant_keywords_plant_id ON plant_keywords(plant_id);

CREATE TABLE IF NOT EXISTS plant_attributes (
    plant_id BIGINT NOT NULL REFERENCES plants(id) ON DELETE CASCADE,
    heading VARCHAR(255),
    lines TEXT,
    more BOOLEAN DEFAULT FALSE
);

CREATE INDEX IF NOT EXISTS idx_plant_attributes_plant_id ON plant_attributes(plant_id);

-- --------------------------------------------------------------------
-- 3. STRATEGIES & RELATED TABLES
-- --------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS strategies (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    summary TEXT,
    image_url VARCHAR(1000),
    full_description TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_strategies_category ON strategies(category);

CREATE TABLE IF NOT EXISTS strategy_keywords (
    strategy_id BIGINT NOT NULL REFERENCES strategies(id) ON DELETE CASCADE,
    keyword VARCHAR(255) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_strategy_keywords_strategy_id ON strategy_keywords(strategy_id);

-- --------------------------------------------------------------------
-- 4. BLOG POSTS TABLE
-- --------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS blog_posts (
    id BIGSERIAL PRIMARY KEY,
    slug VARCHAR(255) NOT NULL UNIQUE,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    read_time VARCHAR(50),
    image_url VARCHAR(1000),
    excerpt TEXT,
    body TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_blog_posts_slug ON blog_posts(slug);
CREATE INDEX IF NOT EXISTS idx_blog_posts_category ON blog_posts(category);
