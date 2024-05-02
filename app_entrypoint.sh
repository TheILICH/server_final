#!/bin/sh


# Run migrations
python3 manage.py makemigrations
python3 manage.py migrate

# Start the server
exec python3 manage.py runserver 0.0.0.0:8080
