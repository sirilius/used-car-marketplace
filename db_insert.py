import csv
import psycopg2
from credentials_production import *


# Function to insert data into the cities table
def insert_cities_data():
    with open('dummy_data/dummy_data_city.csv', 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip header row
        cities_data = list(reader)

    conn = psycopg2.connect(
        host=db_host,
        port=db_port,
        dbname=db_name,
        user=db_user,
        password=db_password
    )
    cur = conn.cursor()

    for row in cities_data:
        cur.execute(
            "INSERT INTO cities (city_id, city_name, latitude, longitude) "
            "VALUES (%s, %s, %s, %s)",
            row
        )

    conn.commit()
    cur.close()
    conn.close()


# Function to insert data into the users table
def insert_users_data():
    with open('dummy_data/dummy_data_users.csv', 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip header row
        users_data = list(reader)

    conn = psycopg2.connect(
        host=db_host,
        port=db_port,
        dbname=db_name,
        user=db_user,
        password=db_password
    )
    cur = conn.cursor()

    for row in users_data:
        cur.execute(
            "INSERT INTO users (user_id, name, phone_number, city_id) "
            "VALUES (%s, %s, %s, %s)",
            row
        )

    conn.commit()
    cur.close()
    conn.close()


# Function to insert data into the cars table
def insert_cars_data():
    with open('dummy_data/dummy_data_cars.csv', 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip header row
        cars_data = list(reader)

    conn = psycopg2.connect(
        host=db_host,
        port=db_port,
        dbname=db_name,
        user=db_user,
        password=db_password
    )
    cur = conn.cursor()

    for row in cars_data:
        cur.execute(
            "INSERT INTO cars (car_id, brand, model, body_type,manufacturing_year, price_idr) "
            "VALUES (%s, %s, %s, %s, %s, %s)",
            row
        )

    conn.commit()
    cur.close()
    conn.close()


# Function to insert data into the ads table
def insert_ads_data():
    with open('dummy_data/dummy_data_ads.csv', 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip header row
        ads_data = list(reader)

    conn = psycopg2.connect(
        host=db_host,
        port=db_port,
        dbname=db_name,
        user=db_user,
        password=db_password
    )
    cur = conn.cursor()

    for row in ads_data:
        cur.execute(
            "INSERT INTO ads (user_id, car_id, title, description, mileage_km, color, transmission, negotiable, post_date) "
            "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)",
            row
        )

    conn.commit()
    cur.close()
    conn.close()


# Function to insert data into the bids table
def insert_bids_data():
    with open('dummy_data/dummy_data_bids.csv', 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip header row
        bids_data = list(reader)

    conn = psycopg2.connect(
        host=db_host,
        port=db_port,
        dbname=db_name,
        user=db_user,
        password=db_password
    )
    cur = conn.cursor()

    for row in bids_data:
        cur.execute(
            "INSERT INTO bids (bid_id, user_id, ad_id, bid_price_idr, bid_date) "
            "VALUES (DEFAULT, %s, %s, %s, %s)",
            row
        )

    conn.commit()
    cur.close()
    conn.close()


insert_cities_data()
insert_users_data()
insert_cars_data()
insert_ads_data()
insert_bids_data()
