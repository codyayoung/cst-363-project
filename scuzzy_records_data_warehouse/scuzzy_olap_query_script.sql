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

-- Last 3 Year Avg. Profit Per Artist
SELECT a.artist_name AS Artist, ROUND(f.total/3,2) AS Annual_Avg_Profit_Last_3_Yrs
FROM dim_artists a JOIN fact_artist_stat f
	ON a.artist_id = f.artist_id
JOIN dim_events e ON f.event_id = e.event_id
WHERE YEAR(e.event_date) >= YEAR(current_date()) - 3
GROUP BY f.artist_id;

-- Total Profit To-Date Per State
SELECT e.state AS State, f.total AS Total_Profit
FROM fact_artist_stat f JOIN dim_events e
	ON f.event_id = e.event_id
GROUP BY e.state
ORDER BY Total_Profit DESC;

-- Number of performances by genre and the total profit from those performances
SELECT a.artist_genre AS Genre, COUNT(e.event_id) AS Number_Of_Performances, f.total AS Total_Profit
FROM fact_artist_stat f JOIN dim_events e
	ON e.event_id = f.event_id
JOIN dim_artists a
	ON a.artist_id = f.artist_id
WHERE e.event_type = 'performance'
GROUP BY Genre
ORDER BY Genre;

-- Percentage of record sales profit per artist and the state with most transactions for that artist
SELECT a.artist_name AS Artist,
	ROUND(f.total / (SELECT SUM(f2.total) 
		FROM fact_artist_stat f2 JOIN dim_events e2
			ON e2.event_id = f2.event_id
		WHERE e2.event_type = 'record sale'
	), 2) AS Perc_Of_Record_Sale_Profit,
    MAX(e.state) AS State_With_Most_Transactions
FROM fact_artist_stat f JOIN dim_events e
	ON f.event_id = e.event_id
JOIN dim_artists a
	ON f.artist_id = a.artist_id
WHERE e.event_type = 'record sale'
GROUP BY Artist
ORDER BY Perc_Of_Record_Sale_Profit DESC;