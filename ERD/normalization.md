# Database Normalization - Airbnb Database

## Objective
The objective of this document is to apply **normalization principles** to the Airbnb database schema and ensure the design satisfies the **Third Normal Form (3NF)**. This prevents data redundancy, improves data integrity, and optimizes performance.

---

## Step 1: First Normal Form (1NF)

### Rules:
- Eliminate repeating groups.
- Ensure atomic (indivisible) attributes.
- Each record must be unique.

### Application:
- All attributes (e.g., `first_name`, `last_name`, `email`, `pricepernight`) are atomic.  
- No multi-valued or repeating attributes exist.  
- Primary keys (`user_id`, `property_id`, etc.) uniquely identify records.  

✅ The database is in **1NF**.

---

## Step 2: Second Normal Form (2NF)

### Rules:
- Must be in 1NF.
- Remove partial dependencies (non-key attributes must depend on the whole primary key, not just part of it).

### Application:
- All tables have **single-column primary keys** (`user_id`, `property_id`, etc.).  
- No attribute depends on part of a composite key (since there are no composite keys).  
- Example: In **Booking**, attributes like `start_date`, `end_date`, and `status` depend entirely on `booking_id`.  

✅ The database is in **2NF**.

---

## Step 3: Third Normal Form (3NF)

### Rules:
- Must be in 2NF.
- Eliminate transitive dependencies (non-key attributes should not depend on other non-key attributes).

### Application:
- **User Table**:  
  - `role` is directly tied to the user, not to another non-key attribute.  
  - No transitive dependencies.  

- **Property Table**:  
  - `pricepernight`, `location`, `description` depend only on `property_id`.  
  - No transitive dependencies.  

- **Booking Table**:  
  - `total_price` depends on `booking_id`.  
  - Some designs calculate `total_price` from (`pricepernight * nights`), but storing it here is acceptable for performance. If strict 3NF is required, `total_price` could be computed dynamically instead of stored.  

- **Payment Table**:  
  - `amount`, `payment_method`, `payment_date` depend only on `payment_id`.  
  - No transitive dependencies.  

- **Review Table**:  
  - `rating` and `comment` depend on `review_id`.  
  - No transitive dependencies.  

- **Message Table**:  
  - `message_body` and `sent_at` depend only on `message_id`.  
  - No transitive dependencies.  

✅ The database is in **3NF**.

---

## Conclusion

- The schema satisfies **Third Normal Form (3NF)**.  
- There are no repeating groups, partial dependencies, or transitive dependencies.  
- Minor design choice: `total_price` in **Booking** could be stored or computed. If computed, the schema would be in **strict 3NF**; if stored, it improves performance but slightly denormalizes.  

**Final Status:** The Airbnb database design is **3NF compliant** and ready for implementation.
