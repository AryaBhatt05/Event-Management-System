-- Schema Creation

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address TEXT,
    contact_no VARCHAR(20),
    gender VARCHAR(10),
    password VARCHAR(255),
    confirm_password VARCHAR(255),
);

CREATE TABLE hotel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(255) NOT NULL,
    hotel_desc TEXT,
    hotel_img1 LONGBLOB,
    price INT,
    location VARCHAR(255)
);

CREATE TABLE catering (
    id INT AUTO_INCREMENT PRIMARY KEY,
    catername VARCHAR(255) NOT NULL,
    cater_desc TEXT,
    cater_location VARCHAR(255),
    cater_price INT,
    cater_img LONGBLOB
);

CREATE TABLE event (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_desc TEXT,
    event_img LONGBLOB
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_date DATE,
    event_start_time VARCHAR(255),
    max_total_hour VARCHAR(255),
    amount INT,
    no_of_guest VARCHAR(255),
    bookedon VARCHAR(255),
    accept_status INT,
    payment_status INT,
    user_id INT,
    hotel_id INT,
    catering_id INT,
    event_id INT,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id),
    CONSTRAINT fk_catering FOREIGN KEY (catering_id) REFERENCES catering(id),
    CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES event(id)
);

-- Data Inserts

INSERT INTO user (email, first_name, last_name, address, contact_no, gender, password, confirm_password, role)
VALUES
('admin@example.com', 'Admin', 'One', '123 Admin Street', '9876543210', 'Male', 'admin123', 'admin123', 'Admin'),
('user@example.com', 'John', 'Doe', '456 User Avenue', '9123456780', 'Male', 'user123', 'user123', 'User');

INSERT INTO hotel (hotel_name, hotel_desc, hotel_img1, price, location)
VALUES
('The Grand Plaza', 'Luxury 5-star hotel with conference hall.', NULL, 12000, 'New York'),
('Urban Nest', 'Budget-friendly hotel ideal for small events.', NULL, 5000, 'Los Angeles');

INSERT INTO catering (catername, cater_desc, cater_location, cater_price, cater_img)
VALUES
('Delight Caterers', 'Multi-cuisine event catering.', 'San Francisco', 300, NULL),
('Feast & Fest', 'Wedding and banquet specialists.', 'Chicago', 450, NULL);

INSERT INTO event (event_name, event_desc, event_img)
VALUES
('Wedding', 'Traditional wedding ceremonies with decorations.', NULL),
('Corporate Meet', 'Business and networking events.', NULL);

INSERT INTO vendor (vendorname, vendor_desc, vendor_location, vendor_price, vendor_img)
VALUES
('DJ Beats', 'Professional DJ and audio setup.', 'Miami', 700, NULL),
('Pixel Snap Photography', 'Wedding and event photography.', 'Seattle', 1000, NULL);

INSERT INTO bookings (event_date, event_start_time, max_total_hour, amount, no_of_guest, photographer, dj, makeupartist, decorator, bookedon, accept_status, payment_status, user_id, hotel_id, catering_id, event_id)
VALUES
('2025-05-15', '18:00', '6', 15000, '200', 'Pixel Snap Photography', 'DJ Beats', 'Makeup Studio Pro', 'Floral Decor Inc.', '2025-04-02', 1, 1, 2, 1, 1, 1);
