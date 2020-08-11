from flask import Flask
from flask import request
from flask import render_template
import requests

app = Flask(__name__)

trivia_api_url = 'http://trivia-backend/trivia'

@app.route('/', methods=['GET', 'POST'])
def trivia():
    if request.method == 'GET':
        return render_template('GET/index.html')
    else:
        r = requests.get(trivia_api_url)
        trivia = r.text

        return render_template('POST/index.html', trivia=trivia)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
