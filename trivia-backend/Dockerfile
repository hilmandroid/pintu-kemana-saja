FROM python:3.8.5-alpine3.12

USER 0

RUN mkdir /opt/trivia-backend

COPY app.py /opt/trivia-backend
COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt

EXPOSE 80

ENTRYPOINT ["python", "/opt/trivia-backend/app.py"]
