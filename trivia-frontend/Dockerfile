FROM python:3.8.5-alpine3.12

USER 0

RUN mkdir /opt/trivia-frontend

COPY app.py /opt/trivia-frontend
COPY templates /opt/trivia-frontend/templates
COPY requirements.txt /tmp/requirements.txt


RUN pip install -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt

EXPOSE 80

ENTRYPOINT ["python", "/opt/trivia-frontend/app.py"]
