CREATE TABLE cities (
  city_id SERIAL PRIMARY KEY,
  city_name VARCHAR(255) NOT NULL,
  latitude DECIMAL(9, 6) NOT NULL,
  longitude DECIMAL(9, 6) NOT NULL,
  CONSTRAINT uc_latitude_longitude UNIQUE (latitude, longitude)
);

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  city_id INTEGER NOT NULL,
  CONSTRAINT fk_city_id FOREIGN KEY (city_id) REFERENCES cities (city_id),
  CONSTRAINT uc_phone_number UNIQUE (phone_number)
);

CREATE TABLE cars (
  car_id SERIAL PRIMARY KEY,
  brand VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  body_type VARCHAR(50) NOT NULL,
  manufacturing_year SMALLINT NOT NULL,
  price_idr DECIMAL(12, 2) NOT NULL,
  CONSTRAINT ck_price CHECK (price_idr >= 0),
  CONSTRAINT ck_manufacturing_year CHECK (manufacturing_year > 0 AND manufacturing_year <= EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE ads (
  ad_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  car_id INTEGER NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  mileage_km INTEGER NOT NULL,
  color VARCHAR(50) NOT NULL,
  transmission VARCHAR(50) NOT NULL,
  negotiable BOOLEAN NOT NULL,
  post_date DATE NOT NULL,
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
  CONSTRAINT fk_car_id FOREIGN KEY (car_id) REFERENCES cars (car_id)
);

CREATE TABLE bids (
  bid_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ad_id INTEGER NOT NULL,
  bid_price_idr DECIMAL(12, 2) NOT NULL,
  bid_date DATE NOT NULL,
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
  CONSTRAINT fk_ad_id FOREIGN KEY (ad_id) REFERENCES ads (ad_id)
);
