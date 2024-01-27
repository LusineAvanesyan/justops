import psycopg2

# Get all travel places from db table travelplaces
def get_travel_places():
  conn = None
  rows = None
  try:
    # Make the connection to the database
    conn = psycopg2.connect(database = "postgres", 
                        host= 'localhost',
                        user = "postgres", 
                        password = "postgres",
                        port = 5432)   
  
    # Open a cursor to perform database operations
    cur = conn.cursor()
  
    # Execute command for creating table
    cur.execute("""CREATE TABLE IF NOT EXISTS places (
                   id SERIAL PRIMARY KEY,
                   country VARCHAR(255),
                   city VARCHAR(255),
                   mustsee VARCHAR(255));""")
  
    
    # Execute select command 
    cur.execute('SELECT * FROM places;')
    rows = cur.fetchall()
    
    # If the table is empty, let's add 3 rows of information there
    if len(rows) == 0:
      # Execute command for inserting data into the table
        cur.execute("""INSERT INTO places (id, country, city, mustsee)
                    VALUES
                    (1, 'Armenia', 'Yerevan', 'Cascade'),
                    (2, 'Italy', 'Rome', 'Vatican'),
                    (3, 'Spain', 'Barcelona', 'Sagrada Familia');""")
  
        cur.execute('SELECT * FROM places;')
        rows = cur.fetchall()
  
    # Make the changes to the database persistent
    conn.commit()
  
  except (Exception, psycopg2.DatabaseError) as error:
    print(error)
  finally:
    if conn is not None:
      # Close cursor and communication with the database
      cur.close()
      conn.close()
  
  return rows