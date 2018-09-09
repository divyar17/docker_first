from flask import Flask, request
from flask_restful import Resource, Api
from flask_cors import CORS, cross_origin


app = Flask(__name__)
CORS(app)
api = Api(app)

class Search(Resource):
  def get(self, msg):
      return msg

api.add_resource(Search, '/search/<msg>') # Route_1

if __name__ == '__main__':
     app.run(host ='0.0.0.0', port=5003, threaded=True)
