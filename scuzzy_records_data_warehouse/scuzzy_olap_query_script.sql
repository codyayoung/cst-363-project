-- SCSI Logic
-- Nathan Warren-Acord
-- Cody Young
-- Abby Packham
-- CST 363 - Database

-- All Data
SELECT * 
FROM fact_artist_stat f JOIN dim_events e
	ON f.event_id = e.event_id
JOIN dim_artists a
	ON f.artist_id = a.artist_id
ORDER BY e.event_date;

-- Artist Total Annual
SELECT a.artist_name AS Artist, f.total AS Total_Profit, YEAR(e.event_date) AS Year
FROM fact_artist_stat f JOIN dim_artists a
	ON f.artist_id = a.artist_id
JOIN dim_events e
	ON f.event_id = e.event_id
GROUP BY Artist, Year
ORDER BY Artist;

-- Type Total Annual
SELECT e.event_type AS Event_Type, f.total as Total_Profit, YEAR(e.event_date) AS Year
FROM fact_artist_stat f JOIN dim_events e
	ON f.event_id = e.event_id
GROUP BY Year, Event_Type
ORDER BY Total_Profit DESC;

