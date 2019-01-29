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