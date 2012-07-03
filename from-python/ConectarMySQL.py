

import MySQLdb

conn = MySQLdb.connect (host = "localhost",
                           user = "root",
                           passwd = "root",
                           db = "mysql")
cursor = conn.cursor()
cursor.execute("SHOW TABLES;")
rows = cursor.fetchall()
for row in rows:
	print row[0]
cursor.close()
conn.close()
