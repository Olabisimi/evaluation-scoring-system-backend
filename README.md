🧠 Evaluation & Scoring System Backend

«This project evolves from a structured database system into a revenue intelligence and decision-support system, enabling analysis of participant progression, performance, and drop-off across multi-stage workflows.»

---

📌 Overview

This project simulates a real-world evaluation workflow where:

- Participants submit entries
- Judges evaluate submissions
- Scores are stored and analyzed

The system is designed not just to store data, but to generate insights that support decision-making.

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
- "categories"
- "stages"
- "tasks"
- "submissions"
- "judges"
- "evaluations"
- "stage_unlocks"
- "audit_logs"

---

🚀 Stage 2 Upgrade (Revenue Intelligence)

This project was extended in Stage 2 to transform the existing database into a decision-support and analytics system.

Enhancements:

- Leveraged existing dataset (500 participants and staged submissions) for analysis
- Implemented stage progression logic to model participant funnel behavior
- Developed analytical queries to extract insights such as:
  - stage conversion rates
  - drop-off analysis
  - top-performing participants
  - judge workload distribution
- Introduced an insight layer connecting data outputs to decision-making

---

📊 Insights Preview

The system generates analytical insights that support decision-making across the evaluation process.

🔹 Stage Conversion & Drop-Off

- Tracks how participants progress from one stage to another
- Identifies stages with the highest drop-off rates

👉 Helps improve weak stages and increase retention

---

🔹 Participant Performance

- Ranks participants based on average evaluation scores
- Identifies top-performing candidates

👉 Supports objective finalist selection

---

🔹 Deadline Compliance

- Compares on-time vs late submissions
- Highlights participant behavior over time

👉 Helps adjust deadlines and improve submission rates

---

🔹 Judge Workload Distribution

- Measures how evaluations are distributed across judges
- Detects imbalance or overloading

👉 Ensures fairness and better workload management

---

🔹 Category Performance

- Compares average scores across categories
- Identifies strong and weak categories

👉 Guides improvements in underperforming areas

---

🔹 Full Funnel Analysis

- Tracks participant journey from registration to final stage
- Measures overall system efficiency

👉 Enables data-driven decision-making and optimization

---

🔗 API Endpoints

Base URL:

https://eyeqmvsdspybswytywwx.supabase.co/rest/v1/participants

Example Endpoints:

- "/participants"
- "/submissions"
- "/evaluations"

---

🔐 Authentication

Use Postman to test the API.

Headers:

apikey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV5ZXFtdnNkc3B5YnN3eXR5d3d4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQyNTk4MDYsImV4cCI6MjA4OTgzNTgwNn0.hmnTZBBywRH2Pt5ViJfFiOpApjI1PmG0R4PdFyW9of0

Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV5ZXFtdnNkc3B5YnN3eXR5d3d4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQyNTk4MDYsImV4cCI6MjA4OTgzNTgwNn0.hmnTZBBywRH2Pt5ViJfFiOpApjI1PmG0R4PdFyW9of0

---

🧪 How to Test

1. Open Postman
2. Enter endpoint (e.g., "/participants")
3. Add headers
4. Send request

---

📄 Project Description

"Download Project Description" (project_description.pdf)

---

📐 ER Diagram

"ER Diagram" (er_diagram.png)

---

🎯 Project Outcome

This project demonstrates:

- Relational database design
- Workflow modeling and stage progression
- Analytical querying for insights
- Secure data access using RLS
- Building a decision-support system from structured data

---

📌 Note

This project focuses on backend and data intelligence.
No frontend interface is included.

---

👤 Author

Olabisi Yekeen
Data Analyst | SQL | Power BI | Python

---
