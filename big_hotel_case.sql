CREATE DATABASE big_hotel_case;
USE big_hotel_case;

CREATE TABLE people (
    person_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    person_type ENUM('guest', 'employee', 'visitor', 'suspect'),
    phone VARCHAR(30)
);

INSERT INTO people VALUES
(101, 'Daniel', 'Levin', 24, 'visitor', '050-1111111'),
(102, 'Maya', 'Cohen', 31, 'guest', '050-2222222'),
(103, 'Noah', 'Green', 28, 'employee', '050-3333333'),
(104, 'Lina', 'Harel', 26, 'guest', '050-4444444'),
(105, 'Adam', 'Shalev', 35, 'visitor', '050-5555555'),
(106, 'Sarah', 'Mor', 42, 'employee', '050-6666666');

CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    floor INT,
    room_type VARCHAR(30),
    status ENUM('occupied', 'vacant', 'maintenance')
);

CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    floor INT,
    room_type VARCHAR(30),
    status ENUM('occupied', 'vacant', 'maintenance')
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    person_id INT,
    room_id INT,
    check_in DATETIME,
    check_out DATETIME,
    FOREIGN KEY (person_id) REFERENCES people(person_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
    
    INSERT INTO bookings VALUES
(1, 102, 503, '2026-08-13 14:00:00', '2026-08-15 11:00:00'),
(2, 104, 711, '2026-08-13 16:20:00', '2026-08-14 11:00:00'),
(3, 105, 214, '2026-08-12 18:00:00', '2026-08-14 10:00:00');

CREATE TABLE access_cards (
    card_id INT PRIMARY KEY,
    person_id INT,
    card_status ENUM('active', 'lost', 'disabled'),
    FOREIGN KEY (person_id) REFERENCES people(person_id)
);

INSERT INTO access_cards VALUES
(3001, 102, 'active'),
(3002, 103, 'active'),
(3003, 104, 'active'),
(3004, 105, 'lost'),
(3005, 106, 'active');

CREATE TABLE access_logs (
    log_id INT PRIMARY KEY,
    card_id INT,
    room_id INT,
    access_time DATETIME,
    access_result ENUM('granted', 'denied'),
    FOREIGN KEY (card_id) REFERENCES access_cards(card_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

INSERT INTO access_logs VALUES
(1, 3005, 708, '2026-08-13 18:42:00', 'granted'),
(2, 3004, 708, '2026-08-13 21:17:00', 'granted'),
(3, 3002, 708, '2026-08-13 21:23:00', 'denied'),
(4, 3003, 711, '2026-08-13 21:25:00', 'granted'),
(5, 3001, 503, '2026-08-13 21:27:00', 'granted'
(6, 3005, 708, '2026-08-13 21:36:00', 'granted');

CREATE TABLE cctv_logs (
    cctv_id INT PRIMARY KEY,
    camera_location VARCHAR(100),
    person_id INT NULL,
    observation_time DATETIME,
    clothing VARCHAR(100),
    direction VARCHAR(100),
    FOREIGN KEY (person_id) REFERENCES people(person_id)
);

INSERT INTO cctv_logs VALUES
(1, 'Main Ceremony Hall', 101, '2026-08-13 21:05:00',
 'Dark T-shirt', 'Standing near west entrance'),

(2, 'Elevator Lobby - Ground Floor', 101, '2026-08-13 21:12:00',
 'Dark T-shirt', 'Entered elevator'),

(3, '7th Floor Elevator', NULL, '2026-08-13 21:15:00',
 'Dark clothing', 'Walking toward Room 708'),

(4, '7th Floor Corridor', 103, '2026-08-13 21:21:00',
 'Hotel uniform', 'Walking toward Room 708'),

(5, 'Main Lobby', 101, '2026-08-13 21:39:00',
 'Dark T-shirt', 'Leaving hotel');
 
 CREATE TABLE evidence (
    evidence_id INT PRIMARY KEY,
    room_id INT,
    evidence_type VARCHAR(50),
    description VARCHAR(255),
    collected_time DATETIME,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

INSERT INTO evidence VALUES
(501, 708, 'DNA',
 'Blood sample found on broken champagne glass',
 '2026-08-13 22:05:00'),

(502, 708, 'Fingerprint',
 'Partial fingerprint recovered from desk',
 '2026-08-13 22:08:00'),

(503, 708, 'Fiber',
 'Black cotton fiber recovered near window',
 '2026-08-13 22:12:00'),

(504, 708, 'Access Card',
 'Lost access card 3004',
 '2026-08-13 22:14:00'),

(505, 708, 'Note',
 'Paper containing handwritten number 214',
 '2026-08-13 22:17:00');
 
 CREATE TABLE dna_profiles (
    dna_id INT PRIMARY KEY,
    person_id INT NULL,
    profile_code VARCHAR(100),
    source VARCHAR(100),
    FOREIGN KEY (person_id) REFERENCES people(person_id)
);

INSERT INTO dna_profiles VALUES
(701, 101, 'DNA-X7A91', 'reference'),
(702, 103, 'DNA-K2P44', 'reference'),
(703, 105, 'DNA-M8Q20', 'reference'),
(704, NULL, 'DNA-Z9T31', 'old_criminal_case');

INSERT INTO dna_evidence_matches VALUES
(501, 701, 99.72),
(501, 704, 63.40);

SELECT
    p.first_name,
    p.last_name,
    ac.card_id,
    al.room_id,
    al.access_time
FROM access_logs al
JOIN access_cards ac
    ON al.card_id = ac.card_id
JOIN people p
    ON ac.person_id = p.person_id
WHERE al.room_id = 708
  AND al.access_time = '2026-08-13 21:17:00';
  
  SELECT *
FROM cctv_logs
WHERE observation_time
BETWEEN '2026-08-13 21:10:00'
AND '2026-08-13 21:30:00';

SELECT
    p.first_name,
    p.last_name,
    dem.match_percentage
FROM dna_evidence_matches dem
JOIN dna_profiles dp
    ON dem.dna_id = dp.dna_id
LEFT JOIN people p
    ON dp.person_id = p.person_id
WHERE dem.evidence_id = 501;

SELECT DISTINCT
    p.person_id,
    p.first_name,
    p.last_name
FROM people p
JOIN cctv_logs c
    ON p.person_id = c.person_id
JOIN dna_profiles d
    ON p.person_id = d.person_id
JOIN dna_evidence_matches m
    ON d.dna_id = m.dna_id
WHERE c.observation_time
BETWEEN '2026-08-13 21:00:00'
AND '2026-08-13 21:40:00'
AND m.evidence_id = 501;

SELECT
    r.room_id,
    p.first_name,
    p.last_name,
    b.check_in,
    b.check_out
FROM rooms r
JOIN bookings b
    ON r.room_id = b.room_id
JOIN people p
    ON b.person_id = p.person_id
WHERE r.room_id = 214;

