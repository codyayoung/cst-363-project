import cgitb, cgi
import mysql.connector
cgitb.enable()
form = cgi.FieldStorage()

def print_data(table):
	print("<form action=\"/cgi-bin/scuzzy_output.py\" method = \"post\">")
	if table == "artists":
		print("<h2>Search by artist name or genre.</h2>")
		print("<h2>Leave all fields blank to print all artists.</h2>")
		print("Artist name:\t <input type = \"text\" name = \"artist\"/></br>")
		print("Genre:\t <input type = \"text\" name = \"genre\"/></br>")
		print("<input type=\"submit\" value=\"search\" name=\"Search\"/>")
	print("</form>")

selection = form["queries"].value

operation = selection.split(' ',1)[0] ##Get first word (desired operation)
table = selection.split(' ',1)[1] ##Get second word (table name)

print("Content-Type: text/html")
print()
print("<html><body>")

if "print" in operation:
	print_data(table)

print("</html></body>")