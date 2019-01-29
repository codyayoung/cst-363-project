import cgitb, cgi
import mysql.connector
cgitb.enable()
form = cgi.FieldStorage()

temp = []

for item in form.value:
	temp.append(item)

##selection = form["queries"].value

##operation = selection.split(' ',1)[0] ##Get first word (desired operation)
##table = selection.split(' ',1)[1] ##Get second word (table name)

#############
#SQL queries#
#############

#########
#Artists#
#########

#Review queries

#Prints artist name and genre name.
review_artists_genres = """SELECT a.artist_name as Artist, g.genre_name as Genre
					FROM artists a JOIN genres g 
					ON a.artist_genre_id = g.genre_id"""

#Prints artist name only given user input as string.
review_artist_uinput = """SELECT a.artist_name as Artist
					FROM artists a
					WHERE a.artist_name = %s"""
					
#Prints all artists in genre, given user input (genre) as string.
review_genre_uinput = """SELECT a.artist_name as Artist, g.genre_name as Genre
					FROM artists a JOIN genres g 
					ON a.artist_genre_id = g.genre_id
					WHERE g.genre_name = %s"""
					
#Add artist
#Inserts an artist name,genre, and genre ID into the artists table.
#NOTE: Need to add a field for the genre ID.

add_artist = "INSERT INTO artists VALUES ('%s', '%s', '%s')"

#Remove artist
#Removes an artist from the artist table.
remove_artist = "DELETE FROM artists WHERE artist_name = %s"

#Update artist
#Updates an existing artist's name and genre.
update_artist = """UPDATE artists
					SET artist_name = artist_to_update, genre_id = '%s'
					WHERE genre_id = '%s' AND artist_to_update = '%s'"""

########
#Venues#
########

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


#######
#Sales#
#######

##############
#Performances#
##############
print()
print("Content-Type: text/html")
print("<html><body>")

print("{}".format(temp))

print("</html></body>")