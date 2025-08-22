-- Create DB (use your own name if different)
CREATE DATABASE IF NOT EXISTS gaadidost
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE gaadidost;

-- USERS (kept compatible with your earlier table)
CREATE TABLE IF NOT EXISTS users (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  username    VARCHAR(100) NOT NULL UNIQUE,
  password    VARCHAR(255) NOT NULL,               -- store as plain or hashed (your choice)
  email       VARCHAR(150) NOT NULL,
  created_at  TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- VEHICLES owned by users
CREATE TABLE IF NOT EXISTS vehicles (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  user_id       INT NOT NULL,
  vehicle_name  VARCHAR(100) NOT NULL,
  vehicle_type  VARCHAR(50)  NOT NULL,             -- e.g., Car, Bike, SUV
  reg_no        VARCHAR(50)  NOT NULL,
  created_at    TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_vehicles_user
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_vehicles_user ON vehicles(user_id);

-- BOOKINGS (wash/repair/oil) with specific options
-- service_type: 'wash' | 'repair' | 'oil'
-- service_option:
--    wash   -> 'normal','foam','oil'
--    repair -> 'normal','minimal','max'
--    oil    -> 'general','onlyoil'
CREATE TABLE IF NOT EXISTS bookings (
  id             INT AUTO_INCREMENT PRIMARY KEY,
  user_id        INT NOT NULL,
  service_type   VARCHAR(20)  NOT NULL,
  service_option VARCHAR(20)  NOT NULL,
  scheduled_for  DATETIME NULL,                     -- optional when user picks a time
  notes          VARCHAR(255) NULL,
  booking_date   TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_bookings_user
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_bookings_user ON bookings(user_id);
CREATE INDEX idx_bookings_sched ON bookings(scheduled_for);

-- MARKETPLACE (Buy/Sell)
-- 'Buy' lists will be read from here
-- 'Sell' form inserts into this table with a computed estimated_price
CREATE TABLE IF NOT EXISTS marketplace (
  id               INT AUTO_INCREMENT PRIMARY KEY,
  seller_id        INT NOT NULL,
  vehicle_type     VARCHAR(50) NOT NULL,            -- e.g., Car, Bike, Scooter
  model            VARCHAR(100) NULL,
  age              INT NOT NULL,                    -- years
  accidents        ENUM('yes','no') NOT NULL DEFAULT 'no',
  estimated_price  DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  listed_at        TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_marketplace_user
    FOREIGN KEY (seller_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_marketplace_seller ON marketplace(seller_id);


