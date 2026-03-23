-- 1. Submissions with participant names
SELECT s.id, p.full_name, s.title
FROM submissions s
JOIN participants p ON s.participant_id = p.id;

-- 2. Average score per submission
SELECT submission_id, AVG(score) AS avg_score
FROM evaluations
GROUP BY submission_id;

-- 3. Top 10 submissions by score
SELECT submission_id, AVG(score) AS avg_score
FROM evaluations
GROUP BY submission_id
ORDER BY avg_score DESC
LIMIT 10;

-- 4. Evaluations per judge
SELECT judge_id, COUNT(*) AS total_reviews
FROM evaluations
GROUP BY judge_id;

-- 5. Participants without submissions
SELECT p.id, p.full_name
FROM participants p
LEFT JOIN submissions s ON p.id = s.participant_id
WHERE s.id IS NULL;

-- 6. Submissions per category
SELECT c.name, COUNT(*) AS total
FROM submissions s
JOIN categories c ON s.category_id = c.id
GROUP BY c.name;

-- 7. Scores per stage
SELECT st.name, AVG(e.score)
FROM evaluations e
JOIN submissions s ON e.submission_id = s.id
JOIN stages st ON s.stage_id = st.id
GROUP BY st.name;

-- 8. Highest scoring participant
SELECT p.full_name, AVG(e.score) AS avg_score
FROM participants p
JOIN submissions s ON p.id = s.participant_id
JOIN evaluations e ON s.id = e.submission_id
GROUP BY p.full_name
ORDER BY avg_score DESC
LIMIT 1;

-- 9. Total submissions per participant
SELECT participant_id, COUNT(*) AS total
FROM submissions
GROUP BY participant_id;

-- 10. Evaluation count per submission
SELECT submission_id, COUNT(*) AS total_evaluations
FROM evaluations
GROUP BY submission_id;
