print("Hello")

def print_data(table):
	print("<form action=\"/cgi-bin/scuzzy_output.py\" method = \"post\">")
	if table == "artists":
		print("<h2>Search by artist name or genre.</h2>")
		print("<h2>Leave all fields blank to print all artists.</h2>")
		print("Artist name:\t <input type = \"text\" name = \"artist\"/></br>")
		print("Genre:\t <input type = \"text\" name = \"genre\"/></br>")
		print("<input type=\"submit\" value=\"search\" name=\"Search\"/>")
	print("</form>")

	if "print" in operation:
	print_data(table)
	
	enctype="multipart/form-data"
	
		update_artist = """UPDATE artists
					SET artist_name = artist_to_update, genre_id = '%s'
					WHERE genre_id = '%s' AND artist_to_update = '%s'"""
					
					#Prints artist name only given user input as string.
review_artist_uinput = """SELECT a.artist_name as Artist
					FROM artists a
					WHERE a.artist_name = %s"""
					

#Prints venues given user input.
review_venue = """SELECT v.venue_id as Venue ID, 
					v.venue_city as City, 
					v.venue_state as State, 
					v.venue_capacity as Capacity, 
					v.venue_cost as Cost
				FROM venues v
				WHERE v.venue_city = '%s', v.venue_state = '%s', v.venue_capacity = '%s', v.venue_cost = '%s' """


#Update venue
#Updates an existing venue's city, state, capacity, and cost, from venue ID as user input.
update_venue = """
				SELECT v.venue_id FROM venues v WHERE v.venue_id = '%s'
				UPDATE venues
				  SET venue_city, venue_state, venue_capacity, venue_cost
				  WHERE venue_city = '%s', venue_state = '%s', venue_capacity = '%s', venue_cost = '%s'"""