# Database Seeding - Airbnb Database

## Overview
This file (`seeds.sql`) contains **sample data** for the Airbnb-like database.  
It is intended to populate the database with **realistic initial records** for testing and development.

---

## Entities Populated

1. **User**
   - Includes guests, hosts, and an admin.
   - Provides diversity for testing role-based interactions.

2. **Property**
   - Listings owned by hosts (e.g., apartment, beach house, mountain cabin).

3. **Booking**
   - Various bookings with statuses: `confirmed`, `pending`, `canceled`.

4. **Payment**
   - Linked to bookings.
   - Includes multiple payment methods (`credit_card`, `paypal`).

5. **Review**
   - Ratings (1–5) and comments for properties.

6. **Message**
   - Demonstrates user-to-user communication (guest ↔ host).

---

## Usage

1. Ensure you have already created the schema by running:

   ```bash
   mysql -u <username> -p < database_name < schema.sql
