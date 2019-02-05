INSERT INTO scuzzy_records_data_warehouse.dim_artists
	(artist_id, artist_name, artist_genre)
SELECT
	NULL AS new_id, a.artist_name, g.genre_name
FROM scuzzy_records.artists a JOIN scuzzy_records.genres g
	ON a.artist_genre_id = g.genre_id;

INSERT INTO scuzzy_records_data_warehouse.dim_events
	(event_id, event_type, city, state, event_date)
SELECT
	NULL AS new_id, 'performance', v.venue_city, v.venue_state, p.performance_date
FROM scuzzy_records.performances p JOIN scuzzy_records.venues v
	ON p.venue_id = v.venue_id;

INSERT INTO scuzzy_records_data_warehouse.dim_events
	(event_id, event_type, city, state, event_date)
SELECT
	NULL AS new_id, 'record sale', r.sales_city, r.sales_state, r.sales_date
FROM scuzzy_records.record_sales r;

INSERT INTO scuzzy_records_data_warehouse.fact_artist_stat
	(artist_id, event_id, cost, amount, total)
SELECT
	da.artist_id,
    de.event_id,
    v.venue_cost,
    v.venue_capacity * p.performance_cost,
    ((v.venue_capacity * p.performance_cost) - v.venue_cost)
FROM scuzzy_records_data_warehouse.dim_artists da
	JOIN scuzzy_records.artists a ON da.artist_name = a.artist_name
    JOIN scuzzy_records.performances p ON p.performing_artist_id = a.artist_id
    JOIN scuzzy_records.venues v ON p.venue_id = v.venue_id
    JOIN scuzzy_records_data_warehouse.dim_events de
		ON de.city = v.venue_city
        AND de.state = v.venue_state
        AND de.event_date = p.performance_date
WHERE de.event_type = 'performance';

INSERT INTO scuzzy_records_data_warehouse.fact_artist_stat
	(artist_id, event_id, cost, amount, total)
SELECT
	da.artist_id,
    de.event_id,
    5.00 * (r.sales_total / 10) AS record_sale_cost,
    r.sales_total AS record_sale_amount,
    (r.sales_total - (5.00 * (r.sales_total / 10))) AS record_sale_profit
FROM scuzzy_records_data_warehouse.dim_artists da
	JOIN scuzzy_records.artists a ON da.artist_name = a.artist_name
    JOIN scuzzy_records.record_sales r ON a.artist_id = r.artist_id
    JOIN scuzzy_records_data_warehouse.dim_events de
		ON de.city = r.sales_city
        AND de.state = r.sales_state
        AND de.event_date = r.sales_date
WHERE de.event_type = 'record sale';