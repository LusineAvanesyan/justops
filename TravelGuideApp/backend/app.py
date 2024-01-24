from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

# Enable CORS for all routes
@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT')
    return response


# API endpoint for getting travel places
@app.route('/places', methods=['GET'])
def get_travel_places():
  conn = psycopg2.connect(database = "traveldb", 
                        user = "postgres", 
                        host= 'localhost',
                        password = "postgres",
                        port = 5432)   
  
  # Open a cursor to perform database operations
  cur = conn.cursor()
  # Execute a command: 
  cur.execute('SELECT * FROM travelplaces;')
  rows = cur.fetchall()
  
  # Make the changes to the database persistent
  conn.commit()
  # Close cursor and communication with the database
  cur.close()
  conn.close()    
   
  return jsonify(rows)


if __name__ == '__main__':
    app.run(debug=True, port=5000)
