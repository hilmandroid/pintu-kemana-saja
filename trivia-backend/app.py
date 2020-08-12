from flask import Flask
from flask import request
from datetime import datetime
import time
import requests

app = Flask(__name__)

timezone = 7
trivia_api_url = 'http://numbersapi.com/{}/date'

@app.route('/trivia', methods=['GET'])
def trivia():
    month_date = get_month_date()
    trivia = get_trivia(month_date)

    return trivia
    

def get_month_date():
    time_in_epoch = time.time() + 3600 * timezone
    current_datetime = datetime.utcfromtimestamp(time_in_epoch)
    current_date = current_datetime.day
    current_month = current_datetime.month

    return '{}/{}'.format(current_month, current_date)

def get_trivia(month_date):
    api_url = trivia_api_url.format(month_date)
    r = requests.get(api_url)

    return r.text



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
