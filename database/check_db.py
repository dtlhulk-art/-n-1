import sqlite3, os

db_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "app.db")
conn = sqlite3.connect(db_path)

print("Số dòng mỗi bảng:")
for table in ("laws", "sanctions", "offences", "offence_sanctions", "glossary"):
    n = conn.execute(f"SELECT COUNT(*) FROM {table}").fetchone()[0]
    print(f"  {table}: {n}")

print("\nCác lỗi bị thẻ đỏ:")
rows = conn.execute("""
    SELECT o.name, s.name
    FROM offences o
    JOIN offence_sanctions os ON os.offence_id = o.id
    JOIN sanctions s ON s.id = os.sanction_id
    WHERE s.name = 'Thẻ đỏ'
""").fetchall()
for r in rows:
    print(" -", r[0], "->", r[1])

conn.close()