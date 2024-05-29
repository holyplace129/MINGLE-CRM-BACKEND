-- EMPLOYEE 데이터 삽입
INSERT INTO employee (name, email, password, authority, is_deleted) VALUES
('김동욱', 'dongwook@test.com', 'wook123', 'MANAGER', FALSE),
('장명훈', 'myeonghoon@test.com', 'hoon123', 'STAFF', FALSE),
('관리자', 'thinghoon@icloud.com', '$2a$10$m8ckfEF4dV2nlIa5Z/vkkezEcDc8eEaKQPKYaFJEsGv2ow.cFAkNq', 'STAFF', FALSE);

-- CUSTOMER 데이터 삽입
INSERT INTO customer (name, grade, phone, address, employee_id, memo, gender, birth, is_deleted) VALUES
('권성지', 'VVIP', '010-1234-4321', 'seongji123@test.com', 1, '', 'Male', '1999-01-29', false),
('하지민', '신규', '010-4321-4321', 'jimin123@test.com', 1, '', 'Female', '1998-01-01', false),
('강찬미', '기존', '010-4132-4132', 'chanmi123@test.com', 1, '', 'Female', '2002-01-02', false),
('김동윽', 'VIP', '010-9876-9876', 'dongwwwwww@test.com', 2, '', 'Male', '1995-04-10', false),
('장띵훈', '기존', '010-3289-8903', 'thinghoon123@test.com', 2, '', 'Male', '1998-04-21', false),
('풀도젠깃갓리찬미', '기존', '010-3428-1342', 'fulli123@test.com', 2, '', 'Female', '2002-10-30', false);

-- INQUIRY 데이터 삽입
INSERT INTO inquiry (customer_id, date, inquiry_title, inquiry_content, type, is_reply)
VALUES
(1, '2024-05-23', '문의 제목 1', '문의 내용 1', '온라인 문의', FALSE),
(2, '2024-05-22', '문의 제목 2', '문의 내용 2', '전화 문의', TRUE),
(3, '2024-05-21', '문의 제목 3', '문의 내용 3', '방문 문의', FALSE),
(4, '2024-05-20', '문의 제목 4', '문의 내용 4', '온라인 문의', TRUE),
(5, '2024-05-19', '문의 제목 5', '문의 내용 5', '전화 문의', FALSE),
(6, '2024-05-18', '문의 제목 6', '문의 내용 6', '방문 문의', TRUE),
(1, '2024-05-17', '문의 제목 7', '문의 내용 7', '온라인 문의', FALSE),
(2, '2024-05-16', '문의 제목 8', '문의 내용 8', '전화 문의', TRUE),
(3, '2024-05-15', '문의 제목 9', '문의 내용 9', '방문 문의', FALSE),
(4, '2024-05-14', '문의 제목 10', '문의 내용 10', '온라인 문의', TRUE);


-- PAYMENT 데이터 삽입
INSERT INTO payment (type, amount_before_discount, discount_amount, payment_amount, payment_date, is_refunded, refund_date, created_reward, customer_id, payment_spot) VALUES
('Credit Card', 100000, 5000, 95000, '2024-06-01 12:00:00', FALSE, NULL, 100, 1, 'Online'),
('Cash', 200000, 10000, 190000, '2024-06-02 12:00:00', FALSE, NULL, 200, 2, 'Offline'),
('Credit Card', 300000, 15000, 285000, '2024-06-03 12:00:00', FALSE, NULL, 300, 3, 'Online'),
('Cash', 400000, 20000, 380000, '2024-06-04 12:00:00', TRUE, '2024-06-05 12:00:00', 400, 4, 'Offline'),
('Credit Card', 500000, 25000, 475000, '2024-06-05 12:00:00', FALSE, NULL, 500, 5, 'Online'),
('Cash', 600000, 30000, 570000, '2024-06-06 12:00:00', FALSE, NULL, 600, 6, 'Offline'),
('Credit Card', 700000, 35000, 665000, '2024-06-07 12:00:00', FALSE, NULL, 700, 1, 'Online'),
('Cash', 800000, 40000, 760000, '2024-06-08 12:00:00', TRUE, '2024-06-09 12:00:00', 800, 2, 'Offline'),
('Credit Card', 900000, 45000, 855000, '2024-06-09 12:00:00', FALSE, NULL, 900, 3, 'Online'),
('Cash', 1000000, 50000, 950000, '2024-06-10 12:00:00', FALSE, NULL, 1000, 4, 'Offline');

-- HOTEL_ROOM 데이터 삽입
INSERT INTO hotel_room (hotel, address, room_number, room_type, room_state) VALUES
('grand hotel', '서울 강남구', 101, 'SUPERIOR', '예약 가능'),
('grand hotel', '서울 강남구', 102, 'SUPERIOR', '예약 중'),
('grand hotel', '서울 강남구', 103, 'DELUXE_DOUBLE', '예약 가능'),
('grand hotel', '서울 강남구', 104, 'DELUXE_DOUBLE', '예약 중'),
('grand hotel', '서울 강남구', 105, 'DELUXE_TWIN', '예약 가능'),
('grand hotel', '서울 강남구', 106, 'DELUXE_TWIN', '예약 가능'),
('grand hotel', '서울 강남구', 107, 'PREMIER_SUITE', '예약 중'),
('grand hotel', '서울 강남구', 108, 'EXECUTIVE_SUITE', '예약 가능'),
('grand hotel', '서울 강남구', 109, 'RESIDENTIAL_SUITE', '예약 중'),
('grand hotel', '서울 강남구', 110, 'PLAZA_SUITE', '예약 가능');

-- ROOM_RESERVATION 데이터 삽입
INSERT INTO room_reservation (hotel_room_id, payment_id, customer_id, reservation_date, checkin_time, checkout_time, price) VALUES
(1, 1, 1, '2024-06-01 14:00:00', '2024-06-10 15:00:00', '2024-06-15 11:00:00', 50000),
(2, 2, 2, '2024-06-02 14:00:00', '2024-06-11 15:00:00', '2024-06-16 11:00:00', 60000),
(3, 3, 3, '2024-06-03 14:00:00', '2024-06-12 15:00:00', '2024-06-17 11:00:00', 70000),
(4, 4, 4, '2024-06-04 14:00:00', '2024-06-13 15:00:00', '2024-06-18 11:00:00', 80000),
(5, 5, 5, '2024-06-05 14:00:00', '2024-06-14 15:00:00', '2024-06-19 11:00:00', 90000),
(6, 6, 6, '2024-06-06 14:00:00', '2024-06-15 15:00:00', '2024-06-20 11:00:00', 100000),
(7, 7, 1, '2024-06-07 14:00:00', '2024-06-16 15:00:00', '2024-06-21 11:00:00', 110000),
(8, 8, 2, '2024-06-08 14:00:00', '2024-06-17 15:00:00', '2024-06-22 11:00:00', 120000),
(9, 9, 3, '2024-06-09 14:00:00', '2024-06-18 15:00:00', '2024-06-23 11:00:00', 130000),
(10, 10, 4, '2024-06-10 14:00:00', '2024-06-19 15:00:00', '2024-06-24 11:00:00', 140000);

-- DISH_RESERVATION 데이터 삽입
INSERT INTO dish_reservation (payment_id, total_price, reservation_date, customer_id) VALUES
(1, 15000, '2024-06-01 19:00:00', 1),
(2, 25000, '2024-06-02 19:00:00', 2),
(3, 35000, '2024-06-03 19:00:00', 3),
(4, 45000, '2024-06-04 19:00:00', 4),
(5, 55000, '2024-06-05 19:00:00', 5),
(6, 65000, '2024-06-06 19:00:00', 6),
(7, 75000, '2024-06-07 19:00:00', 1),
(8, 85000, '2024-06-08 19:00:00', 2),
(9, 95000, '2024-06-09 19:00:00', 3),
(10, 105000, '2024-06-10 19:00:00', 4);

-- DISH 데이터 삽입
INSERT INTO dish (name, amount, price, dish_reservation_id) VALUES
('스파게티', 2, 8000, 1),
('샐러드', 1, 7000, 1),
('스테이크', 1, 15000, 2),
('리조또', 2, 16000, 2),
('피자', 1, 12000, 3),
('파스타', 2, 14000, 3),
('치킨', 1, 10000, 4),
('버거', 2, 13000, 4),
('샌드위치', 1, 9000, 5),
('수프', 2, 11000, 5),
('타코', 1, 8500, 6),
('나쵸', 2, 9500, 6),
('떡볶이', 1, 6000, 7),
('김밥', 2, 7000, 7),
('비빔밥', 1, 8000, 8),
('된장찌개', 2, 9000, 8),
('라면', 1, 5000, 9),
('삼겹살', 2, 12000, 9),
('불고기', 1, 11000, 10),
('잡채', 2, 13000, 10);

-- VOUCHER 데이터 삽입
INSERT INTO voucher (issuer_id, customer_id, amount, create_date, expired_date) VALUES
(2, 1, 10000, '2024-06-01 12:00:00', '2025-06-01 12:00:00'),
(3, 2, 20000, '2024-06-02 12:00:00', '2025-06-02 12:00:00'),
(2, 3, 30000, '2024-06-03 12:00:00', '2025-06-03 12:00:00'),
(3, 4, 40000, '2024-06-04 12:00:00', '2025-06-04 12:00:00'),
(2, 5, 50000, '2024-06-05 12:00:00', '2025-06-05 12:00:00'),
(3, 6, 60000, '2024-06-06 12:00:00', '2025-06-06 12:00:00'),
(2, 1, 70000, '2024-06-07 12:00:00', '2025-06-07 12:00:00'),
(3, 2, 80000, '2024-06-08 12:00:00', '2025-06-08 12:00:00'),
(2, 3, 90000, '2024-06-09 12:00:00', '2025-06-09 12:00:00'),
(3, 4, 100000, '2024-06-10 12:00:00', '2025-06-10 12:00:00');

-- VOUCHER_HISTORY 데이터 삽입
INSERT INTO voucher_history (voucher_id, request_date, is_auth, auth_date, is_converted_yn, conversion_date, manager_id, staff_id, customer_id) VALUES
(1, '2024-06-01 13:00:00', TRUE, '2024-06-01 14:00:00', TRUE, '2024-06-02 12:00:00', 1, 2, 1),
(2, '2024-06-02 13:00:00', TRUE, '2024-06-02 14:00:00', TRUE, '2024-06-03 12:00:00', 1, 3, 2),
(3, '2024-06-03 13:00:00', TRUE, '2024-06-03 14:00:00', TRUE, '2024-06-04 12:00:00', 2, 3, 3),
(4, '2024-06-04 13:00:00', TRUE, '2024-06-04 14:00:00', TRUE, '2024-06-05 12:00:00', 2, 1, 4),
(5, '2024-06-05 13:00:00', TRUE, '2024-06-05 14:00:00', TRUE, '2024-06-06 12:00:00', 3, 1, 5),
(6, '2024-06-06 13:00:00', TRUE, '2024-06-06 14:00:00', TRUE, '2024-06-07 12:00:00', 3, 2, 6),
(7, '2024-06-07 13:00:00', TRUE, '2024-06-07 14:00:00', TRUE, '2024-06-08 12:00:00', 1, 3, 4),
(8, '2024-06-08 13:00:00', TRUE, '2024-06-08 14:00:00', TRUE, '2024-06-09 12:00:00', 2, 1, 3),
(9, '2024-06-09 13:00:00', TRUE, '2024-06-09 14:00:00', TRUE, '2024-06-10 12:00:00', 3, 2, 2),
(10, '2024-06-10 13:00:00', TRUE, '2024-06-10 14:00:00', TRUE, '2024-06-11 12:00:00', 1, 3, 1);


-- REWARD 데이터 삽입
INSERT INTO reward (customer_id, amount) VALUES
(1, 1000),
(2, 2000),
(3, 3000),
(4, 4000),
(5, 5000),
(6, 6000);

-- REWARD_HISTORY 데이터 삽입
INSERT INTO reward_history (reward_id, payment_id, voucher_id, type, amount, reason, date) VALUES
(1, 1, 1, 'Earn', 1000, 'Payment', '2024-06-01 12:00:00'),
(2, 2, 2, 'Redeem', 2000, 'Voucher', '2024-06-02 12:00:00'),
(3, 3, 3, 'Earn', 3000, 'Payment', '2024-06-03 12:00:00'),
(4, 4, 4, 'Redeem', 4000, 'Voucher', '2024-06-04 12:00:00'),
(5, 5, 5, 'Earn', 5000, 'Payment', '2024-06-05 12:00:00'),
(6, 6, 6, 'Redeem', 6000, 'Voucher', '2024-06-06 12:00:00');


-- HOTEL_REVIEW 데이터 삽입
INSERT INTO hotel_review (CLEANLINESS_RATING, CONVENIENCE_RATING, KINDNESS_RATING, LOCATION_RATING, CREATED_TIME, CUSTOMER_ID, ROOM_RESERVATION_ID, COMMENT) VALUES
(1, 2, 3, 4, '2024-05-01 07:05:15', 1, 1, '호텔이 아주 좋아요'),
(2, 1, 3, 4, '2024-05-02 07:05:15', 2, 2, '호텔이 아주 좋아요2'),
(3, 2, 1, 4, '2024-05-03 07:05:15', 3, 3, '호텔이 아주 좋아요3'),
(5, 2, 3, 4, '2024-05-04 07:05:15', 4, 4, '호텔이 아주 좋아요4'),
(5, 5, 3, 4, '2024-05-05 07:05:15', 5, 5, '호텔이 아주 좋아요5'),
(1, 2, 3, 4, '2024-05-06 07:05:15', 6, 6, '호텔이 아주 좋아요');
-- (2, 1, 3, 4, '2024-05-07 07:05:15', 7, null, '호텔이 아주 좋아요2'),
-- (3, 2, 1, 4, '2024-05-08 07:05:15', 8, null, '호텔이 아주 좋아요3'),
-- (5, 2, 3, 4, '2024-05-09 07:05:15', 9, null, '호텔이 아주 좋아요4'),
-- (5, 5, 3, 4, '2024-05-10 07:05:15', 10, null, '호텔이 아주 좋아요5');