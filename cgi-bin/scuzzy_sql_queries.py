#############
# SCSI Logic
# Nathan Warren-Acord
# Cody Young
# Abby Packham
#
# CST 363 - Databases - Project 1 SQL queries
#############

#########
#Artists#
#########

#Prints the artist table.
def artist_print(values):
	print_artists = """SELECT a.artist_name, g.genre_name
				FROM artists a JOIN genres g 
				ON a.artist_genre_id = g.genre_id"""
	if len(values) < 1:
		return print_artists
	if "name" in values:
		print_artists += " WHERE a.artist_name LIKE \"%{}%\";".format(values["name"])
		return print_artists
	elif "genre" in values:
		print_artists += " WHERE g.genre_name = '{}'".format(values["genre"])
		return print_artists

#Adds artist
#Adds an artist to the artist table.
def artist_add(values):
	if len(values) < 2:
		return False
	add_artist = "INSERT INTO artists VALUES (NULL, '{}', (SELECT genre_id FROM genres WHERE genre_name = '{}'));".format(values["name"], values["genre"])
	return add_artist

#Remove artist
#Removes an artist from the artist table.
def artist_remove(values):
	remove_artist = "DELETE FROM artists WHERE artist_name = '{}';".format(values["name"])
	return remove_artist

#Update artist
#Updates an existing artist's name and genre.
def artist_update(values):
	update_artist = "UPDATE artists SET "
	if "update" not in values:
		return False
	if "name" in values:
		update_artist += "artist_name = '{}'".format(values["name"])
	if len(values) > 2:
		update_artist += ", "
	if "genre" in values:
		update_artist += "genre_id = (SELECT genre_id FROM genres WHERE genre_name = '{}') ".format(values["genre"])
	update_artist += "WHERE artist_name = '{}';".format(values["update"])
	return update_artist

########
#Venues#
########

#Prints the venue table.
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
		print_venue += "venue_{} = '{}' AND ".format(item, values[item])
	print_venue = print_venue.strip(' AND ')
	return print_venue

#Update venue
#Updates a venue on the venue table.
def venue_update(values):
	if "update" not in values:
		return False
	update_venue = "UPDATE venues SET "
	for item in values:
		update_venue += "venue_{} = '{}', ".format(item, values[item])
	update_venue.strip(', ')
	update_venue += " WHERE venue_id = {};".format(values["update"])
	return update_venue

#######
#Sales#
#######

#Print the record sales table.
def sale_print(values):
	print_sale = """SELECT sales_id,
					a.artist_name,
					sales_date,
					sales_total,
					sales_city,
					sales_state
					FROM record_sales r JOIN artists a ON r.artist_id = a.artist_id"""
	if len(values) < 1:
		return print_sale
	print_sale += " WHERE "
	for item in values:
		if item == "artist":
			print_sale += "a.artist_name = '{}' AND ".format(values["artist"])
		else:
			print_sale += "sales_{} = '{}' AND ".format(item, values[item])
	print_sale = print_sale.strip(' AND ')
	return print_sale

#Add sale
#Adds a sale to the record sale table.
def sale_add(values):
	if len(values) < 5:
		return False
	add_sale = "INSERT INTO record_sales VALUES (NULL, (SELECT artist_id FROM artists WHERE artist_name = '{}'), '{}', {}, '{}', '{}');".format(values["artist"], values["date"], values["total"], values["city"], values["state"])
	return add_artist

##############
#Performances#
##############

#Prints the performance table
def performance_print(values):
	print_performance = """SELECT p.performance_name,
							a.artist_name,
							p.performance_cost,
							p.performance_date,
							v.venue_city,
							v.venue_state
							FROM performances p JOIN artists a ON a.artist_id = p.performing_artist_id JOIN venues v ON p.venue_id = v.venue_id"""
	if len(values) < 1:
		return print_performance
	print_performance += " WHERE "
	for item in values:
		if item == "artist":
			print_performance += "a.artist_name = '{}' AND ".format(values["artist"])
		if item == "cost" or item == "date":
			print_performance += "p.performance_{} = {} AND ".format(item, values[item])
		if item == "city" or item == "state":
			print_performance += "v.venue_{} = {} AND ".format(item, values[item])
	print_performance = print_performance.strip(' AND ')
	return print_performance

#Add performance
#Adds a performance to the performance table.
def performance_add(values):
	if len(values) < 5:
		return False
	add_performance = "INSERT INTO performances VALUES (NULL, '{}', (SELECT artist_id FROM artists WHERE artist_name = '{}'), {}, {}, {};".format(values["name"], values["artist"], values["cost"], values["date"], values["venue"])
	return add_performance

#Remove performance
#Removes a performance from the performance table.
def performance_remove(values):
	if len(values) < 2:
		return False
	remove_performance = "DELETE FROM performance WHERE performance_name = '{}' AND performance_date = {};".format(values["name"], values["date"])
	return remove_performance

#Update performance
#Updates a performance from the performance table.
def performance_update(values):
	if "update" not in values:
		return False
	update_performance = "UPDATE performances SET "
	for item in values:
		if item == "artist":
			update_performance += "performing_artist_id = (SELECT artist_id FROM artists WHERE artist_name = '{}')".format(values["artist"])
		elif item == "venue":
			update_performance += "venue_id = {}".format(values["venue"])
		elif item == "name":
			update_performance += "performance_{} = '{}', ".format(item, values[item])
		else:
			update_performance += "performance_{} = {}, ".format(item, values[item])
	update_performance.strip(', ')
	update_performance += " WHERE performance_name = {};".format(values["update"])
	return update_performance