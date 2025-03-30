FROM python:3.11

WORKDIR /app

COPY ../requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

CMD ["celery", "-A", "tercer_tiempo_BE", "worker", "--loglevel=info"]
