-- PARTICIPANTS
CREATE TABLE participants (
id SERIAL PRIMARY KEY,
full_name TEXT,
email TEXT UNIQUE
);

-- JUDGES
CREATE TABLE judges (
id SERIAL PRIMARY KEY,
name TEXT,
email TEXT UNIQUE
);

-- CATEGORIES
CREATE TABLE categories (
id SERIAL PRIMARY KEY,
name TEXT
);

-- STAGES
CREATE TABLE stages (
id SERIAL PRIMARY KEY,
name TEXT
);

-- SUBMISSIONS
CREATE TABLE submissions (
id SERIAL PRIMARY KEY,
participant_id INT REFERENCES participants(id),
category_id INT REFERENCES categories(id),
stage_id INT REFERENCES stages(id),
title TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- EVALUATIONS
CREATE TABLE evaluations (
id SERIAL PRIMARY KEY,
submission_id INT REFERENCES submissions(id),
judge_id INT REFERENCES judges(id),
score INT,
feedback TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- STAGE UNLOCKS
CREATE TABLE stage_unlocks (
id SERIAL PRIMARY KEY,
submission_id INT REFERENCES submissions(id),
stage_id INT REFERENCES stages(id),
unlocked BOOLEAN DEFAULT FALSE
);

-- AUDIT LOGS
CREATE TABLE audit_logs (
id SERIAL PRIMARY KEY,
action TEXT,
performed_by TEXT,
target_table TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
