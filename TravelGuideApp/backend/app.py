from flask import Flask, jsonify
import traveldb

app = Flask(__name__)

# Enable CORS for all routes
@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT')
    return response

# For testing
@app.route("/barev") 
def indexapp():
  return "Barev vonc es"

# API endpoint for getting travel places
@app.route('/places', methods=['GET'])
def get_content():
  data = traveldb.get_travel_places()
  return jsonify(data)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
