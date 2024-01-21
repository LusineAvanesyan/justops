from flask import Flask, jsonify
from travel_place import TravelPlace

shokolad = Flask(__name__)

# Sample data
places_data = [
    TravelPlace("Armenia", "Yerevan", "Cascade"),
    TravelPlace("Italy", "Rome", "Vatican"),
    TravelPlace("Spain", "Barcelona", "Sagrada Familia")
]


# Enable CORS for all routes
@shokolad.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT')
    return response


# API endpoint for getting travel places
@shokolad.route('/travelner', methods=['GET'])
def get_travel_places():
 travel_places = [place.to_my_json() for place in places_data]
 return jsonify(travel_places)


if __name__ == '__main__':
    shokolad.run(debug=True)
