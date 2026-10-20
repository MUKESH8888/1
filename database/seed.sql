-- ====================================================================
-- EcoBug Database Seed Data
-- ====================================================================

-- --------------------------------------------------------------------
-- 1. SEED PLANTS
-- --------------------------------------------------------------------
INSERT INTO plants (id, scientific_name, subtitle, common_names, image_url, plant_type, foliage_colour, climatic_zone, iucn_status, uses)
VALUES
(1, 'Areca Lutescens', 'PALM', 'Areca Palm, Yellow Butterfly Palm, Cane Palm', '/images/plant_1.png', 'Palm', 'Golden Green', 'Tropical & Subtropical', 'Least Concern', 'Air purification, indoor aesthetic, hedge screening, landscape focal points'),
(2, 'Sansevieria Trifasciata', 'SUCCULENT', 'Snake Plant, Mother-in-Law Tongue, Saint George Sword', '/images/plant_12.png', 'Succulent', 'Deep Green & Yellow', 'Arid to Tropical', 'Least Concern', 'Indoor oxygen generation, low-light decor, drought-tolerant landscapes'),
(3, 'Monstera Deliciosa', 'CLIMBER', 'Swiss Cheese Plant, Split-leaf Philodendron', '/images/plant_13.png', 'Climber / Shrub', 'Emerald Green', 'Tropical Humid', 'Least Concern', 'Architectural foliage, interior statement plant, shaded patio gardens'),
(4, 'Ficus Elastica', 'TREE', 'Rubber Fig, Rubber Tree, India Rubber Plant', '/images/plant_14.png', 'Tree / Large Shrub', 'Burgundy / Dark Green', 'Tropical & Warm Temperate', 'Least Concern', 'Specimen indoor plant, windbreak, soil erosion control in coastal areas')
ON CONFLICT (id) DO NOTHING;

-- Plant Keywords
INSERT INTO plant_keywords (plant_id, keyword) VALUES
(1, 'indoor'), (1, 'air purifying'), (1, 'palm'), (1, 'low maintenance'),
(2, 'indoor'), (2, 'drought tolerant'), (2, 'bedroom'), (2, 'succulent'),
(3, 'tropical'), (3, 'shade loving'), (3, 'climbing'), (3, 'architectural'),
(4, 'indoor'), (4, 'air cleaning'), (4, 'hardy'), (4, 'statement');

-- Plant Attributes for Areca Lutescens
INSERT INTO plant_attributes (plant_id, heading, lines, more) VALUES
(1, 'Foliage', 'Colour: Golden-green feathery fronds' || E'\n' || 'Texture: Delicate, arching pinnate leaves', true),
(1, 'Light & Sun', 'Light: Bright indirect sunlight' || E'\n' || 'Tolerance: Light partial shade', false),
(1, 'Water Requirements', 'Watering: Keep soil evenly moist' || E'\n' || 'Drought: Low tolerance to severe drought', false),
(1, 'Soil & Growth', 'Soil: Well-draining peat-based loam' || E'\n' || 'Growth Rate: Moderate (up to 6-8 ft indoors)', true);

-- Plant Attributes for Sansevieria Trifasciata
INSERT INTO plant_attributes (plant_id, heading, lines, more) VALUES
(2, 'Foliage', 'Colour: Banded green with golden yellow borders' || E'\n' || 'Texture: Upright, stiff, sword-shaped leaves', true),
(2, 'Light & Sun', 'Light: Low to high indirect light' || E'\n' || 'Tolerance: Thrives in dark corners', false),
(2, 'Water Requirements', 'Watering: Water only when soil is completely dry' || E'\n' || 'Drought: Exceptionally high drought tolerance', false),
(2, 'Soil & Growth', 'Soil: Fast-draining cactus or succulent potting mix' || E'\n' || 'Growth Rate: Slow to medium', false);

-- Adjust sequence
SELECT setval('plants_id_seq', (SELECT MAX(id) FROM plants));

-- --------------------------------------------------------------------
-- 2. SEED STRATEGIES
-- --------------------------------------------------------------------
INSERT INTO strategies (id, title, category, summary, image_url, full_description)
VALUES
(1, 'Urban Heat Island Mitigation', 'Microclimate', 'Employing layered canopies and reflective surfaces to reduce urban ambient temperatures by 2-4 degrees Celsius.', '/images/main_illu.png', 'Urban heat islands occur when cities replace natural land cover with dense concentrations of pavement, buildings, and other surfaces that absorb and retain heat. By strategically selecting high-albedo materials, integrating green walls and rooftop vegetation, and planting native shade-providing canopies, we create microclimatic cooling corridors that reduce HVAC energy load and improve community comfort.'),
(2, 'Passive Rainwater Harvesting & Bioswales', 'Water Conservation', 'Designing natural swales and permeable retention basins to filter runoff and recharge groundwater tables.', '/images/origin.png', 'Bioswales are vegetated channels designed to capture, slow, and filter stormwater runoff while recharging local aquifers. Utilizing engineered soil layers and indigenous wetland grasses, bioswales remove up to 90% of heavy metals and sediment from urban surface runoff before it reaches municipal water courses.'),
(3, 'Pollinator Corridor Network Design', 'Biodiversity', 'Connecting fragmented green spaces with native nectar-rich floral strips to sustain local bee and butterfly populations.', '/images/plant_1.png', 'Habitat fragmentation is one of the leading causes of pollinator collapse. Creating stepping-stone corridors with continuous blooming cycles provides essential food and shelter for native solitary bees, honeybees, butterflies, and insectivorous birds across suburban and industrial zones.')
ON CONFLICT (id) DO NOTHING;

-- Strategy Keywords
INSERT INTO strategy_keywords (strategy_id, keyword) VALUES
(1, 'cooling'), (1, 'microclimate'), (1, 'urban design'), (1, 'energy efficiency'),
(2, 'stormwater'), (2, 'drainage'), (2, 'sustainability'), (2, 'groundwater'),
(3, 'biodiversity'), (3, 'ecology'), (3, 'pollinators'), (3, 'native flora');

SELECT setval('strategies_id_seq', (SELECT MAX(id) FROM strategies));

-- --------------------------------------------------------------------
-- 3. SEED BLOG POSTS
-- --------------------------------------------------------------------
INSERT INTO blog_posts (id, slug, title, category, read_time, image_url, excerpt, body)
VALUES
(1, 'sustainable-landscape-design-guide', 'The Comprehensive Guide to Sustainable Landscape Design', 'Design', '5 min', '/images/blog_1.png', 'Explore the fundamental principles of designing resilient, regenerative outdoor spaces that thrive with minimal water and chemical intervention.', '["Sustainable landscape design is not simply about using less water; it is about designing functional ecosystems that heal damaged soils, provide habitat for pollinators, and sequester carbon.", "By selecting climate-adapted native plants, incorporating permeable paving, and utilizing organic mulching strategies, homeowners and commercial landscape architects can reduce irrigation demands by over 60% while eliminating chemical fertilizers.", "Key strategies include hydrozoning, rainwater capture swales, and choosing indigenous keystone species."]')
ON CONFLICT (id) DO NOTHING;

INSERT INTO blog_posts (id, slug, title, category, read_time, image_url, excerpt, body)
VALUES
(2, 'biophilic-architecture-trends-2026', 'Integrating Nature into Modern Workspaces: Biophilic Design in 2026', 'Architecture', '4 min', '/images/blog_2.png', 'How incorporating natural light, living vegetation walls, and organic geometries enhances cognitive focus and well-being.', '["Recent workplace ergonomics research demonstrates that proximity to living plants and natural daylight cycles reduces employee cortisol levels by up to 37% and boosts creative problem-solving by 15%.", "Modern biophilic installations go beyond potted desk plants, embedding automated hydroponic green partitions, circadian rhythm lighting, and bio-acoustic water features into commercial floorplans."]')
ON CONFLICT (id) DO NOTHING;

SELECT setval('blog_posts_id_seq', (SELECT MAX(id) FROM blog_posts));
