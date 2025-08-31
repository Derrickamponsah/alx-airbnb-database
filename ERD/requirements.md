# Entities and Relationships - Airbnb Database

This document outlines the **entities, attributes, and relationships** for the Airbnb-like database design, based on the ERD.

---

## Entities and Attributes

### 1. User
- `user_id` (UUID, Primary Key, Indexed)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 2. Property
- `property_id` (UUID, Primary Key, Indexed)
- `host_id` (UUID, Foreign Key → User.user_id)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

---

### 3. Booking
- `booking_id` (UUID, Primary Key, Indexed)
- `property_id` (UUID, Foreign Key → Property.property_id)
- `user_id` (UUID, Foreign Key → User.user_id)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 4. Payment
- `payment_id` (UUID, Primary Key, Indexed)
- `booking_id` (UUID, Foreign Key → Booking.booking_id)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)

---

### 5. Review
- `review_id` (UUID, Primary Key, Indexed)
- `property_id` (UUID, Foreign Key → Property.property_id)
- `user_id` (UUID, Foreign Key → User.user_id)
- `rating` (INTEGER, CHECK: rating between 1–5, NOT NULL)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 6. Message
- `message_id` (UUID, Primary Key, Indexed)
- `sender_id` (UUID, Foreign Key → User.user_id)
- `recipient_id` (UUID, Foreign Key → User.user_id)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Relationships

- **User → Property**  
  A User (host) can list many Properties.  
  `(1 User : many Properties)`

- **User → Booking**  
  A User (guest) can make many Bookings.  
  `(1 User : many Bookings)`

- **Property → Booking**  
  A Property can have many Bookings.  
  `(1 Property : many Bookings)`

- **Booking → Payment**  
  A Booking can have one or more Payments.  
  `(1 Booking : many Payments)`

- **Property → Review**  
  A Property can have many Reviews.  
  `(1 Property : many Reviews)`

- **User → Review**  
  A User can leave many Reviews.  
  `(1 User : many Reviews)`

- **User → Message**  
  A User can send and receive many Messages.  
  `(many-to-many via sender_id and recipient_id)`

---

## Indexing

- Primary keys are indexed automatically.
- Additional indexes:  
  - `email` in **User** (unique, fast lookup).  
  - `property_id` in **Property** and **Booking**.  
  - `booking_id` in **Booking** and **Payment**.  

---

✅ This document ensures clarity in entity design, constraints, and relationships, serving as a foundation for schema creation and database implementation.
