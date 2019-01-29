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

print("Content-Type: text/html")
print()
print("<html><body>")

print("{}".format(temp))

print("</html></body>")