#############
#SQL queries#
#############

#########
#Artists#
#########

def artist_print(values):
	artists_print = """SELECT a.artist_name, g.genre_name
				FROM artists a JOIN genres g 
				ON a.artist_genre_id = g.genre_id"""
	if len(values) < 1:
		return artist_print
	if "name" in values:
		artists_print += " WHERE a.artist_name LIKE {};".format(values["name"])
		return artists_print
	elif "genre" in values:
		artists_print += " WHERE g.genre_name = {}".format(values["genre"])
		return artists_print

def artist_add(values):
	if len(values < 2):
		return False
	add_artist = "INSERT INTO artists VALUES (NULL, {}, (SELECT genre_id FROM genres WHERE genre_name = {}));".format(values["name"], values["genre"])
	return add_artist

#Remove artist
#Removes an artist from the artist table.
def artist_remove(values):
	remove_artist = "DELETE FROM artists WHERE artist_name = {};".format(values["name"])
	return remove_artist

#Update artist
#Updates an existing artist's name and genre.
def artist_update(values):
	update_artist = "UPDATE artists SET "
	if "update" not in values:
		return False
	if "name" in values:
		update_artist += "artist_name = {}".format(values["name"])
	if len(values) > 2:
		update_artist += ", "
	if "genre" in values:
		update_artist += "genre_id = (SELECT genre_id FROM genres WHERE genre_name = {}) ".format(values["genre"])
	update_artist += "WHERE artist_name = {};".format(values["update"])
	return update_artist

########
#Venues#
########

def venue_print(values):
	print_venue = """SELECT venue_id, 
					venue_city, 
					venue_state, 
					venue_capacity, 
					venue_cost
				FROM venues """
	if len(values) < 1:
		return print_venue
	print_venue += "WHERE "
	for item in values:
		print_venue += "venue_{} = {} AND ".format(item, values[item])
	print_venue.strip(' AND ')
	return print_venue

def venue_update(values):
	if "update" not in values:
		return False
	update_venue = "UPDATE venues SET "
	for item in values:
		update_venue += "venue_{} = {}, ".format(item, values[item])
	update_venue.strip(', ')
	update_venue += " WHERE venue_id = {};".format(values["update"])
	return update_venue

#######
#Sales#
#######

def sale_print(values):
	print_sale = """SELECT sales_id,
					artist_id,
					sales_date,
					sales_total,
					sales_city,
					sales_state
					FROM record_sales """
	if len(values) < 1:
		return print_sale
	print_sale += "WHERE "
	for item in values:
		if item == "artist":
			print_sale += "(SELECT artist_id FROM artists WHERE artist_name = {}) = artist_id AND ".format(values["artist"])
		else:
			print_sale += "sales_{} = {} AND ".format(item, values[item])
	print_sale.strip(' AND ')
	return print_sale

def sale_add(values):
	if len(values < 5):
		return False
	add_sale = "INSERT INTO record_sales VALUES (NULL, {}, {}, {}, {}, {});".format(values["artist"], values["date"], values["total"], values["city"], values["state"])
	return add_artist

##############
#Performances#
##############

def performance_print(values):
	pass

def performance_add(values):
	pass

def performance_remove(values):
	pass

def performance_update(values):
	pass
