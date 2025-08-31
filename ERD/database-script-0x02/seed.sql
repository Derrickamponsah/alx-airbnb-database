-- ==================================================
-- Airbnb Database Sample Data (Seeding Script)
-- ==================================================

-- ================
-- Users
-- ================
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest'),
    ('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0987654321', 'host'),
    ('33333333-3333-3333-3333-333333333333', 'Clara', 'Williams', 'clara@example.com', 'hashed_pw3', '1112223333', 'host'),
    ('44444444-4444-4444-4444-444444444444', 'David', 'Brown', 'david@example.com', 'hashed_pw4', NULL, 'guest'),
    ('55555555-5555-5555-5555-555555555555', 'Eve', 'Admin', 'eve@example.com', 'hashed_pw5', NULL, 'admin');

-- ================
-- Properties
-- ================
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
    ('aaaa1111-aaaa-1111-aaaa-111111111111', '22222222-2222-2222-2222-222222222222', 'Cozy Apartment', '2-bedroom apartment near downtown', 'New York, USA', 120.00),
    ('bbbb2222-bbbb-2222-bbbb-222222222222', '33333333-3333-3333-3333-333333333333', 'Beach House', 'A beautiful beach house with sea view', 'Miami, USA', 250.00),
    ('cccc3333-cccc-3333-cccc-333333333333', '33333333-3333-3333-3333-333333333333', 'Mountain Cabin', 'Quiet cabin in the mountains', 'Aspen, USA', 180.00);

-- ================
-- Bookings
-- ================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    ('bkg11111-1111-1111-1111-111111111111', 'aaaa1111-aaaa-1111-aaaa-111111111111', '11111111-1111-1111-1111-111111111111', '2025-06-01', '2025-06-05', 480.00, 'confirmed'),
    ('bkg22222-2222-2222-2222-222222222222', 'bbbb2222-bbbb-2222-bbbb-222222222222', '44444444-4444-4444-4444-444444444444', '2025-07-10', '2025-07-15', 1250.00, 'pending'),
    ('bkg33333-3333-3333-3333-333333333333', 'cccc3333-cccc-3333-cccc-333333333333', '11111111-1111-1111-1111-111111111111', '2025-08-20', '2025-08-23', 540.00, 'canceled');

-- ================
-- Payments
-- ================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
    ('pay11111-aaaa-1111-aaaa-111111111111', 'bkg11111-1111-1111-1111-111111111111', 480.00, 'credit_card'),
    ('pay22222-bbbb-2222-bbbb-222222222222', 'bkg22222-2222-2222-2222-222222222222', 1250.00, 'paypal');

-- ================
-- Reviews
-- ================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
    ('rev11111-aaaa-1111-aaaa-111111111111', 'aaaa1111-aaaa-1111-aaaa-111111111111', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay, very clean and comfortable!'),
    ('rev22222-bbbb-2222-bbbb-222222222222', 'bbbb2222-bbbb-2222-bbbb-222222222222', '44444444-4444-4444-4444-444444444444', 4, 'Great location, but WiFi was slow.');

-- ================
-- Messages
-- ================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    ('msg11111-aaaa-1111-aaaa-111111111111', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, is the apartment available for early check-in?'),
    ('msg22222-bbbb-2222-bbbb-222222222222', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, yes, early check-in is possible at 1 PM.');
