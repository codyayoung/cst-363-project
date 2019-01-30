from scuzzy_sql_queries import *
import cgitb, cgi
import mysql.connector
cgitb.enable()
form = cgi.FieldStorage()

#user_query = []
user_query = {}
selection = ""

for item in form:
	if form[item].value == "Submit":
		#user_query.append(item)
		selection = item
		

for item in form.value:
	if item.value == "Submit":
		continue
	else:
		#user_query.append((item.name, item.value))
		user_query[item.name] = item.value

operation = selection.split(' ',1)[0] ##Get first word (desired operation)
table = selection.split(' ',1)[1] ##Get second word (table name)

print("Content-Type: text/html")
print()
print("""<html><head><style>a.button {
    -webkit-appearance: button;
    -moz-appearance: button;
    appearance: button;

    text-decoration: none;
    color: initial;
}</style></head>""")
print("<body>")

cnx = mysql.connector.connect(user='root',
                                password='65-Ariaismyhomegirl',
                                database='scuzzy_records',
                                host='127.0.0.1')

cursor = cnx.cursor()
alter_cursor = cnx.cursor()
sql = ""
alter_sql = ""
table_headers = []
status_prompt = ""

##Handles queries for artists
if table == "artists":
	table_headers = ["Artist", "Genre"]
	if operation == "print":
		sql = artist_print(user_query)
	else:
		sql = artist_print({})
	if operation == "add":
		alter_sql = artist_add(user_query)
		status_prompt = "<h1>Artist added successfully.</h1><br><br>"
	elif operation == "remove":
		alter_sql = artist_remove(user_query)
		status_prompt = "<h1>Artist removed successfully.</h1><br><br>"
	elif operation == "update":
		alter_sql = artist_update(user_query)
		status_prompt = "<h1>Artist updated successfully.</h1><br><br>"

##Handles queries for venues
elif table == "venues":
	table_headers = ["Venue ID", "City", "State", "Capacity", "Cost"]
	if operation == "print":
		sql = venue_print(user_query)
	else:
		sql = venue_print({})
	if operation == "update":
		alter_sql = venue_update(user_query)
		status_prompt = "<h1>Venue updated successfully.</h1><br><br>"

##Handles queries for record sales
elif table == "record_sales":
	table_headers = ["Sale ID", "Artist", "Date of Sale", "Total Amount", "City", "State"]
	if operation == "print":
		sql = sale_print(user_query)
	else:
		sql = sale_print({})
	if operation == "add":
		alter_sql = sale_add(user_query)
		status_prompt = "<h1>Sale added successfully.</h1><br><br>"

##Handles queries for performances
elif table == "performances":
	pass

##If something goes terribly wrong...
else:
	print("<h1>Unknown error. Please go back and try again.</h1>")
	cnx.close()
	raise(SystemExit)

if len(status_prompt) > 0:
	print(status_prompt)

if len(alter_sql) > 0:
	alter_cursor.execute(alter_sql)
"""
cursor.execute(sql)
print('<table border="1"><tr>')
for label in table_headers:
	print('<th>{}</th>'.format(label))
print('</tr>')
row = cursor.fetchall()
for item in row:
	print('<tr>')
	for value in item:
		print('<td>{} '.format(value))
	print('</tr>')
"""
print("<br>{}<br>".format(sql))
#print ("{}<br>{}<br>".format(operation, table))
#print("{}".format(user_query))
print("<p><a href=\"/scuzzy_app.html\" class=\"button\">Main Menu</a></p>")
print("</body></html>")

cnx.commit()
cnx.close()  ## close the connection 