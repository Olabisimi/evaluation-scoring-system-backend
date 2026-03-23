🧠 Evaluation & Scoring System Backend

A scalable backend system built with Supabase to manage participants, submissions, judges, and evaluation scoring through REST APIs.

---

📌 Overview

This project simulates a real-world evaluation workflow where:

- Participants submit entries
- Judges evaluate submissions
- Scores are stored and retrieved via APIs

The system is designed to handle large datasets and structured evaluation processes using a relational database.

---

⚙️ Tech Stack

- Backend: Supabase
- Database: PostgreSQL
- API: Supabase REST API
- Security: Row Level Security (RLS)
- Testing: Postman

---

🗂️ Database Schema

The system includes the following tables:

- "participants"
- "submissions"
- "judges"
- "evaluations"
- "categories"
- "stages"
- "stage_unlocks"
- "audit_logs"

---

📊 Dataset Summary

- Participants: 500 records
- Submissions: 250 records
- Evaluations: 20+ records

The dataset was generated to simulate realistic evaluation scenarios.

---

🔗 API Endpoints

Base URL:

https://eyeqmvdsdspvbswytywwx.supabase.co/rest/v1/

Endpoints:

- "GET /participants"
- "GET /submissions"
- "GET /evaluations"
- "POST /evaluations"

---

🔐 Authentication

Use Postman to test the API.

Headers:

apikey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV5ZXFtdnNkc3B5YnN3eXR5d3d4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQyNTk4MDYsImV4cCI6MjA4OTgzNTgwNn0.hmnTZBBywRH2Pt5ViJfFiOpApjI1PmG0R4PdFyW9of0

Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV5ZXFtdnNkc3B5YnN3eXR5d3d4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQyNTk4MDYsImV4cCI6MjA4OTgzNTgwNn0.hmnTZBBywRH2Pt5ViJfFiOpApjI1PmG0R4PdFyW9of0

---

🧪 Sample Queries / Views

The project includes queries for real-world operations such as:

- Fetch all submissions with participant details
- Retrieve evaluations by judge
- Calculate average scores per submission
- Rank participants based on scores
- Filter submissions by category
- Track evaluation progress
- Identify top-performing participants
- Aggregate scores by stage

---

🧱 DDL (Schema Creation)

The repository includes SQL scripts to:

- Create all tables
- Define relationships (foreign keys)
- Enforce constraints

---

🌱 Seed Data

SQL scripts are included to populate:

- 500 participants
- 250 submissions
- Evaluation data

---

📐 ER Diagram

An Entity Relationship Diagram (ERD) is included to visualize:

- Table relationships
- Data flow
- System structure

---

🚀 How to Run / Test

1. Open Postman
2. Use any endpoint
3. Add headers (apikey + Authorization)
4. Send request

---

🎯 Project Outcome

This project demonstrates:

- Backend system design at scale
- Database modeling (PostgreSQL)
- API development and testing
- Secure data access using RLS
- Handling structured evaluation workflows

---

📌 Note

This project focuses strictly on backend development.
No frontend interface is included.

---

👤 Author

Olabisi Yekeen
Data Analyst | SQL | Power BI | Python

---
