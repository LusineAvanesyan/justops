class TravelPlace:
    def __init__(self, country, city, must_see_places):
        self.country = country
        self.city = city
        self.must_see_places = must_see_places

    def to_my_json(self):
        return {
            'country': self.country,
            'city': self.city,
            'must_see_places': self.must_see_places
        }
