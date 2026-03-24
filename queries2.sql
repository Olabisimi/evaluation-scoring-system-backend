-- =========================================
-- STAGE 2 ANALYTICAL QUERIES
-- =========================================

-- =========================================
-- 1. STAGE CONVERSION RATE
-- Business Question:
-- How many participants progress from one stage to another?
-- Insight:
-- Shows participant movement across stages.
-- Decision:
-- Improve stages with low conversion to retain participants.

SELECT
t.stage_id,
COUNT(DISTINCT s.participant_id) AS participants
FROM submissions s
JOIN tasks t ON s.task_id = t.id
WHERE s.status = 'submitted'
GROUP BY t.stage_id
ORDER BY t.stage_id;

-- =========================================
-- 2. DROP-OFF RATE BETWEEN STAGES
-- Business Question:
-- At which stage do we lose the most participants?
-- Insight:
-- Calculates percentage drop between stages.
-- Decision:
-- Redesign or improve problematic stages.

WITH stage_counts AS (
SELECT
t.stage_id,
COUNT(DISTINCT s.participant_id) AS participants
FROM submissions s
JOIN tasks t ON s.task_id = t.id
WHERE s.status = 'submitted'
GROUP BY t.stage_id
)
SELECT
stage_id,
participants,
LAG(participants) OVER (ORDER BY stage_id) AS prev_stage,
ROUND(
(1 - participants::DECIMAL / LAG(participants) OVER (ORDER BY stage_id)) * 100, 2
) AS drop_off_percentage
FROM stage_counts;

-- =========================================
-- 3. DEADLINE COMPLIANCE
-- Business Question:
-- How many submissions are on time vs late?
-- Insight:
-- Shows deadline behavior.
-- Decision:
-- Adjust deadlines or improve reminders.

SELECT
status,
COUNT(*) AS total
FROM submissions
GROUP BY status;

-- =========================================
-- 4. TOP PERFORMING PARTICIPANTS
-- Business Question:
-- Who are the top-performing participants?
-- Insight:
-- Ranks participants by average score.
-- Decision:
-- Identify finalists and winners.

SELECT
p.full_name,
AVG(e.score) AS avg_score
FROM evaluations e
JOIN submissions s ON e.submission_id = s.id
JOIN participants p ON s.participant_id = p.id
GROUP BY p.full_name
ORDER BY avg_score DESC
LIMIT 10;

-- =========================================
-- 5. JUDGE WORKLOAD DISTRIBUTION
-- Business Question:
-- How are evaluations distributed among judges?
-- Insight:
-- Counts evaluations per judge.
-- Decision:
-- Balance workload among judges.

SELECT
j.full_name,
COUNT(e.id) AS evaluations_done
FROM evaluations e
JOIN judges j ON e.judge_id = j.id
GROUP BY j.full_name
ORDER BY evaluations_done DESC;

-- =========================================
-- 6. CATEGORY PERFORMANCE
-- Business Question:
-- Which categories perform better?
-- Insight:
-- Average score per category.
-- Decision:
-- Improve weaker categories.

SELECT
c.name,
AVG(e.score) AS avg_score
FROM evaluations e
JOIN submissions s ON e.submission_id = s.id
JOIN tasks t ON s.task_id = t.id
JOIN categories c ON t.category_id = c.id
GROUP BY c.name
ORDER BY avg_score DESC;

-- =========================================
-- 7. SUBMISSION TREND ACROSS STAGES
-- Business Question:
-- How does submission volume change across stages?
-- Insight:
-- Tracks engagement trend.
-- Decision:
-- Forecast participation and plan resources.

SELECT
t.stage_id,
COUNT(*) AS total_submissions
FROM submissions s
JOIN tasks t ON s.task_id = t.id
GROUP BY t.stage_id
ORDER BY t.stage_id;

-- =========================================
-- 8. JUDGE SCORING CONSISTENCY
-- Business Question:
-- Are judges scoring consistently?
-- Insight:
-- Compares min, max, and average scores.
-- Decision:
-- Ensure fair evaluation standards.

SELECT
j.full_name,
MIN(e.score) AS min_score,
MAX(e.score) AS max_score,
AVG(e.score) AS avg_score
FROM evaluations e
JOIN judges j ON e.judge_id = j.id
GROUP BY j.full_name;

-- =========================================
-- 9. FULL FUNNEL ANALYSIS
-- Business Question:
-- What is the participant flow from registration to final stage?
-- Insight:
-- Tracks full participant journey.
-- Decision:
-- Improve conversion across funnel.

SELECT
COUNT(DISTINCT p.id) AS total_registered,
COUNT(DISTINCT s.participant_id) FILTER (WHERE s.status = 'submitted') AS total_submitted,
COUNT(DISTINCT s.participant_id) FILTER (WHERE t.stage_id = 5 AND s.status = 'submitted') AS finalists
FROM participants p
LEFT JOIN submissions s ON p.id = s.participant_id
LEFT JOIN tasks t ON s.task_id = t.id;

-- =========================================
-- 10. FINAL STAGE PARTICIPANTS
-- Business Question:
-- Who reached the final stage?
-- Insight:
-- Identifies final qualified participants.
-- Decision:
-- Focus final evaluation on this group.

SELECT
p.full_name
FROM submissions s
JOIN tasks t ON s.task_id = t.id
JOIN participants p ON s.participant_id = p.id
WHERE t.stage_id = 5
AND s.status = 'submitted';
