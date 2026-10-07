-- Project 02: Recycling in Canada — analysis queries (table: plastics)
-- RULE: always filter source='All' for province/national totals (else triple-count).

-- Q1/Q3 National plastics diverted, trend + on-track test
SELECT year, ROUND(SUM(tonnes),0) AS plastics_diverted_t
FROM plastics WHERE source='All' GROUP BY year ORDER BY year;

-- Q2 Concentration: absolute tonnes + share of national, 2022
SELECT geography, ROUND(tonnes,0) AS tonnes,
       ROUND(100.0*tonnes/SUM(tonnes) OVER (),1) AS pct_of_national
FROM plastics WHERE source='All' AND year=2022
ORDER BY tonnes DESC;

-- Q2b Per-capita ranking, 2022 (map data)
SELECT geography, ROUND(tonnes,0) AS tonnes, ROUND(diverted_kg_per_person,1) AS kg_per_person
FROM plastics WHERE source='All' AND year=2022 AND diverted_kg_per_person IS NOT NULL
ORDER BY kg_per_person DESC;

-- Q4 Residential vs non-residential, national 2022
SELECT source, ROUND(SUM(tonnes),0) AS tonnes
FROM plastics WHERE year=2022 AND source IN ('Residential','Non-residential')
GROUP BY source;

-- Q5 Total-waste diversion rate (2020) vs plastic per-capita (context)
SELECT geography, ROUND(diverted_kg_per_person,1) AS plastic_kg_pp,
       ROUND(totalwaste_diversion_rate_2020,3) AS totalwaste_rate
FROM plastics WHERE source='All' AND year=2020 AND diverted_kg_per_person IS NOT NULL
ORDER BY totalwaste_rate DESC;

-- Q6 Trend by province (which provinces improved 2018->2022)
SELECT geography,
       ROUND(MAX(CASE WHEN year=2018 THEN tonnes END),0) AS y2018,
       ROUND(MAX(CASE WHEN year=2022 THEN tonnes END),0) AS y2022
FROM plastics WHERE source='All' GROUP BY geography ORDER BY y2022 DESC;
