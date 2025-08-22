USE gaadidost;
begin;

-- USERS
INSERT INTO users (username, password, email)
VALUES
  ('satya',  'satya123',  'satya@example.com'),
  ('ravi',   'ravi123',   'ravi@example.com')
ON DUPLICATE KEY UPDATE email = VALUES(email);

-- VEHICLES (linked to users)
-- Find actual user IDs to avoid mismatch
-- (If you know the IDs already, you can skip the SELECTs and hardcode.)
SET @uid_satya = (SELECT id FROM users WHERE username='satya' LIMIT 1);
SET @uid_ravi  = (SELECT id FROM users WHERE username='ravi'  LIMIT 1);

INSERT INTO vehicles (user_id, vehicle_name, vehicle_type, reg_no)
VALUES
  (@uid_satya, 'Hyundai i20',  'Car',   'TS09AB1234'),
  (@uid_satya, 'Honda Activa', 'Bike',  'TS07CD5678'),
  (@uid_ravi,  'Maruti Swift', 'Car',   'TS05EF9012')
ON DUPLICATE KEY UPDATE reg_no = VALUES(reg_no);

-- BOOKINGS sample
-- wash options: normal | foam | oil
-- repair options: normal | minimal | max
-- oil options: general | onlyoil
INSERT INTO bookings (user_id, service_type, service_option, scheduled_for, notes)
VALUES
  (@uid_satya, 'wash',   'foam',    DATE_ADD(NOW(), INTERVAL 2 DAY),   'Weekend wash'),
  (@uid_satya, 'repair', 'minimal', DATE_ADD(NOW(), INTERVAL 5 DAY),   'Wiper issue'),
  (@uid_satya, 'oil',    'general', DATE_ADD(NOW(), INTERVAL 10 DAY),  'General service'),
  (@uid_ravi,  'wash',   'normal',  DATE_ADD(NOW(), INTERVAL 1 DAY),   'Pre-trip wash'),
  (@uid_ravi,  'repair', 'max',     DATE_ADD(NOW(), INTERVAL 7 DAY),   'Clutch replacement');

-- MARKETPLACE (Buy) demo data (pretend these are listed items)
INSERT INTO marketplace (seller_id, vehicle_type, model, age, accidents, estimated_price)
VALUES
  (@uid_satya, 'Car',   'Hyundai i20 Sportz', 5, 'no',  380000.00),
  (@uid_ravi,  'Bike',  'Bajaj Pulsar 150',   3, 'no',  65000.00),
  (@uid_ravi,  'Car',   'Maruti Swift VXI',   7, 'yes', 320000.00);


commit;

