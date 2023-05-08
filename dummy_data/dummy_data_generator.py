import csv
import random
from faker import Faker
from datetime import datetime, timedelta

# Create an instance of the Faker generator
fake = Faker('id_ID')


def generate_users_dummy_data():
    # Define the list of city IDs
    city_ids = [
        3171, 3172, 3173, 3174, 3175,
        3573, 3578, 3471, 3273, 1371,
        1375, 6471, 6472, 7371, 5171
    ]

    # Generate user dummy data
    users = []
    for i in range(1, 101):
        user = {
            'user_id': i,
            'name': fake.name(),
            'phone_number': fake.phone_number(),
            'city_id': random.choice(city_ids)
        }
        users.append(user)

    return users


def generate_ads_dummy_data(car_data):

    # Generate ads dummy data
    ads_data = []
    for i in range(1, 51):
        user_id = random.randint(1, 100)
        car_id = i
        car_info = car_data[str(car_id)]
        car_model = car_info["model"]
        body_type = car_info["body_type"]
        manufacturing_year = car_info["manufacturing_year"]
        price = car_info["price_idr"]
        mileage_km = random.randint(1000, 100000)
        color = fake.color_name()
        transmission = random.choice(["manual", "otomatis"])
        negotiable = random.choice([True, False])
        post_date = fake.date_between_dates(date_start=datetime(
            2022, 1, 1), date_end=datetime(2023, 4, 30))

        title = f"Dijual {car_model} {body_type} ({manufacturing_year}) - {color} - {transmission}"
        description = f"Informasi mobil:\nBrand: {car_info['brand']}\nModel: {car_model}\nTipe Body: {body_type}\nTahun: {manufacturing_year}\nHarga: {price} IDR"
        if negotiable:
            description += "\nHarga bisa nego"

        ads_data.append({
            "user_id": user_id,
            "car_id": car_id,
            "title": title,
            "description": description,
            "mileage_km": mileage_km,
            "color": color,
            "transmission": transmission,
            "negotiable": negotiable,
            "post_date": post_date.strftime("%Y-%m-%d")
        })

    return ads_data


def generate_bids_dummy_data(ads_data):
    # Read negotiable ads data
    negotiable_ads = [ad for ad in ads_data if ad["negotiable"]]

    if not negotiable_ads:
        print("No negotiable ads found.")
        return []

    bids_data = []
    for _ in range(100):
        user_id = random.randint(1, 100)
        ad = random.choice(negotiable_ads)
        ad_id = ad["car_id"]
        bid_price_idr = random.randint(5_000_000, 100_000_000)

        start_date = datetime(2022, 1, 1)
        end_date = datetime
        start_date = datetime(2022, 1, 1)
        end_date = datetime(2023, 4, 30)
        days_diff = (end_date - start_date).days
        bid_date = start_date + timedelta(days=random.randint(0, days_diff))

        bids_data.append({
            "user_id": user_id,
            "ad_id": ad_id,
            "bid_price_idr": bid_price_idr,
            "bid_date": bid_date.strftime("%Y-%m-%d")
        })

    return bids_data


# Generate users dummy data
users_dummy_data = generate_users_dummy_data()

# Save users dummy data to CSV
users_output_file = 'dummy_data/dummy_data_users.csv'
with open(users_output_file, 'w', newline='') as csvfile:
    fieldnames = ['user_id', 'name', 'phone_number', 'city_id']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()
    writer.writerows(users_dummy_data)

print(f"User dummy data has been generated and saved to {users_output_file}.")

# Generate ads dummy data
car_data = {}
with open("dummy_data/dummy_data_cars.csv", mode="r") as csv_file:
    reader = csv.DictReader(csv_file)
    for row in reader:
        car_data[row["product_id"]] = {
            "brand": row["brand"],
            "model": row["model"],
            "body_type": row["body_type"],
            "manufacturing_year": row["year"],
            "price_idr": row["price"]
        }

ads_dummy_data = generate_ads_dummy_data(car_data)

# Save ads dummy data to CSV
ads_output_file = 'dummy_data/dummy_data_ads.csv'
with open(ads_output_file, mode="w", newline="") as csv_file:
    fieldnames = ["user_id", "car_id", "title", "description",
                  "mileage_km", "color", "transmission", "negotiable", "post_date"]
    writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(ads_dummy_data)

print(f"Ads dummy data has been generated and saved to {ads_output_file}.")

# Generate bids dummy data
bids_dummy_data = generate_bids_dummy_data(ads_dummy_data)

if bids_dummy_data:
    bids_output_file = "dummy_data/dummy_data_bids.csv"
    with open(bids_output_file, mode="w", newline="") as csv_file:
        fieldnames = ["user_id", "ad_id", "bid_price_idr", "bid_date"]
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(bids_dummy_data)

    print(
        f"Bids dummy data has been generated and saved to {bids_output_file}.")
