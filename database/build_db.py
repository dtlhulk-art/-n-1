import sqlite3, os

here = os.path.dirname(os.path.abspath(__file__))
db_path = os.path.join(here, "app.db")

if os.path.exists(db_path):
    os.remove(db_path)

conn = sqlite3.connect(db_path)
for name in ("schema.sql", "seed.sql"):
    with open(os.path.join(here, name), encoding="utf-8") as f:
        conn.executescript(f.read())
conn.commit()
conn.close()
print("Đã tạo app.db")