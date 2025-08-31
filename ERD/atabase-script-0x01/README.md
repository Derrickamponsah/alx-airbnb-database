# Database Schema - Airbnb Database

## Overview
This directory contains the **SQL schema** for the Airbnb-like database project.  
The schema defines tables, attributes, constraints, and indexes based on the ERD design.

---

## Entities and Tables
1. **User**
   - Stores platform users (guests, hosts, admins).
   - Unique email constraint.
   - Indexed `email` for quick lookups.

2. **Property**
   - Represents Airbnb listings.
   - Linked to a host (`User`).

3. **Booking**
   - Stores booking records.
   - Links users to properties.
   - Booking status: `pending`, `confirmed`, `canceled`.

4. **Payment**
   - Tracks payments for bookings.
   - Supports multiple payment methods.

5. **Review**
   - Stores property reviews with ratings (1–5).
   - Linked to both user and property.

6. **Message**
   - User-to-user messaging system.
   - Stores sender, recipient, and message body.

---

## Features
- **Constraints:** Primary keys, foreign keys, unique constraints, and `CHECK` conditions on ratings.
- **Indexes:** Applied to frequently queried columns (`email`, `property_id`, `booking_id`).
- **Timestamps:** Automatic `created_at`, `updated_at`, and `sent_at` fields.

---

## Usage
To create the schema, run:

```bash
mysql -u <username> -p < database_name < schema.sql
