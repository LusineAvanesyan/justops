from flask import flask
app = flask(__name__)

@app.route("/barev")
def index():
    return"Hello, World!"

if __name__ == "_main_":
    app.run(debug=True, host= '0.0.0.0', port=5000)