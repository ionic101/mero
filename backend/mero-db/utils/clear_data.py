import psycopg2

conn = psycopg2.connect(
    dbname="mero",
    user="user",
    password="qwerty12345",
    host="localhost",
    port="5432"
)

cur = conn.cursor()
cur.execute("DELETE FROM events_partners;")
cur.execute("DELETE FROM participants_masterclasses;")
cur.execute("DELETE FROM events_participants;")
cur.execute("DELETE FROM questions;")
cur.execute("DELETE FROM masterclasses;")
cur.execute("DELETE FROM participants;")
cur.execute("DELETE FROM events;")
cur.execute("DELETE FROM partners;")
conn.commit()

cur.close()
conn.close()

print('DB was clear')