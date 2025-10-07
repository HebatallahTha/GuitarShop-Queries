# 🎸 Strings and SQL
**By Hebatallah Tharhan**  
*Chapter 5 — End of Chapter Submission*

---

### 📘 Overview
This repository contains my **SQL practice queries** from *Chapter 5* of the CIS111 Guitar Shop database exercises.  
It focuses on **aggregations, joins, and grouping operations** — the backbone of real-world SQL reporting.

---

### 🧠 Key Concepts Used
- `INNER JOIN` to connect multiple tables (`Customers`, `Orders`, `OrderItems`, `Products`)
- `GROUP BY` and `HAVING` for grouped summaries
- `ROLLUP` for subtotal generation
- Aggregate functions:  
  - `COUNT()`, `SUM()`, `MAX()`
- Sorting and filtering with `ORDER BY`, `WHERE`

---

### 💾 File Contents
**`Chapter5_GuitarShop_Queries.sql`**  
Includes:
1. Counting total orders and tax amounts  
2. Category summaries with most expensive items  
3. Customer purchase totals and discounts  
4. High-value customer identification  
5. Orders with products over \$400  
6. Product sales totals (with rollup)  
7. Distinct product counts per customer  

---



---

### 🧩 Database Used
**Database:** `Cis111_GuitarShop`  
All queries assume the standard schema provided in class, with tables such as:
- `Customers`
- `Orders`
- `OrderItems`
- `Products`
- `Categories`

---

### 💬 Notes
> “Writing queries is like composing music — every join and group has to harmonize perfectly.” 🎶  
> — *Hebatallah Tharhan*

---

### 📚 License
This project is for **educational purposes** only.
