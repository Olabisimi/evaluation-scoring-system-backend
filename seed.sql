-- INSERT CATEGORIES
INSERT INTO categories (name)
VALUES ('Tech'), ('Business'), ('Design');

-- INSERT STAGES
INSERT INTO stages (name)
VALUES ('Submission'), ('Review'), ('Final');

-- INSERT JUDGES
INSERT INTO judges (name, email)
SELECT
'Judge ' || i,
'judge' || i || '@mail.com'
FROM generate_series(1, 10) AS i;

-- INSERT PARTICIPANTS (500)
INSERT INTO participants (full_name, email)
SELECT
'Participant ' || i,
'user' || i || '@mail.com'
FROM generate_series(1, 500) AS i;

-- INSERT SUBMISSIONS (250)
INSERT INTO submissions (participant_id, category_id, stage_id, title)
SELECT
FLOOR(RANDOM() * 500 + 1),
FLOOR(RANDOM() * 3 + 1),
FLOOR(RANDOM() * 3 + 1),
'Submission ' || i
FROM generate_series(1, 250) AS i;

-- INSERT EVALUATIONS (50+)
INSERT INTO evaluations (submission_id, judge_id, score, feedback)
SELECT
FLOOR(RANDOM() * 250 + 1),
FLOOR(RANDOM() * 10 + 1),
FLOOR(RANDOM() * 100),
'Good work'
FROM generate_series(1, 50);
