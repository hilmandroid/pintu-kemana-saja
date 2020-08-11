from flask import Flask
from flask import request
from flask import render_template
import requests

app = Flask(__name__)

timezone = 7
trivia_api_url = 'http://numbersapi.com/{}/date'

@app.route('/', methods=['GET', 'POST'])
def trivia():
    if request.method == 'GET':
        return render_template('GET/index.html')
    else:
        return 'POST method will be implemented here!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
