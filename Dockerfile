FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    gcc \
    pkg-config \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install django mysqlclient pillow Babel

COPY . .

COPY sijago_luhur.sql /docker-entrypoint-initdb.d/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
