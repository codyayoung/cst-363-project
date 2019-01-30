##########################
## SCSI Logic
## Nathan Warren-Acord
## Cody Young
## Abby Packham
##
## CST 363 Databases - Project 1
##########################

from scuzzy_sql_queries import *
import cgitb, cgi
import mysql.connector
cgitb.enable()
form = cgi.FieldStorage()

user_query = {} #Holds the user input
selection = ""

#Find what operation and table has been selected
for item in form:
	if form[item].value == "Submit":
		selection = item
		
#Save any values that the user has entered
for item in form.value:
	if item.value == "Submit":
		continue
	else:
		user_query[item.name] = item.value

operation = selection.split(' ',1)[0] #Get first word (desired operation)
table = selection.split(' ',1)[1] #Get second word (table name)

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
                                password='',
                                database='scuzzy_records',
                                host='127.0.0.1')

#Cursor for our select statements
cursor = cnx.cursor()
#Cursor for other queries
alter_cursor = cnx.cursor()
#Strings to hold the query text
sql = ""
alter_sql = ""
#List that will be filled with relevant table headers
table_headers = []
#Prompt the user if an add, remove, or update was successful
status_prompt = ""

#Handles queries for artists
if table == "artists":
	table_headers = ["Artist", "Genre"]
	if operation == "print":
		sql = artist_print(user_query)
	else:
		sql = artist_print({})
	if operation == "add":
		alter_sql = artist_add(user_query)
	elif operation == "remove":
		alter_sql = artist_remove(user_query)
	elif operation == "update":
		alter_sql = artist_update(user_query)

#Handles queries for venues
elif table == "venues":
	table_headers = ["Venue ID", "City", "State", "Capacity", "Cost"]
	if operation == "print":
		sql = venue_print(user_query)
	else:
		sql = venue_print({})
	if operation == "update":
		alter_sql = venue_update(user_query)

#Handles queries for record sales
elif table == "record_sales":
	table_headers = ["Sale ID", "Artist", "Date of Sale", "Total Amount", "City", "State"]
	if operation == "print":
		sql = sale_print(user_query)
	else:
		sql = sale_print({})
	if operation == "add":
		alter_sql = sale_add(user_query)

#Handles queries for performances
elif table == "performances":
	table_headers = ["Performance name", "Performing artist", "Total cost", "Date of Performance", "City", "State"]
	if operation == "print":
		sql = performance_print(user_query)
	else:
		sql = performance_print_print({})
	if operation == "add":
		alter_sql = performance_add(user_query)
	elif operation == "remove":
		alter_sql = performance_remove(user_query)
	elif operation == "update":
		alter_sql = performance_update(user_query)

#If something goes terribly wrong...
else:
	print("<h1>Unknown error. Don't panic. Please go back and try again.</h1>")
	cnx.close()
	raise(SystemExit)

#Check if add, remove, or update queries were successful
if alter_sql:
	status_prompt = "<h1>{} {}ed successfully.</h1><br>".format(table, operation)
	alter_cursor.execute(alter_sql)
if alter_sql == False:
	status_prompt = "<h1>{} failed to {}. Please fill in all fields.</h1><br>".format(table, operation)
print(status_prompt)

#Print the table based on the query
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

#Button to redirect back to main page
print("<p><a href=\"/scuzzy_app.html\" class=\"button\">Main Menu</a></p>")
print("</body></html>")

cnx.commit()
cnx.close()  #Close the connection 