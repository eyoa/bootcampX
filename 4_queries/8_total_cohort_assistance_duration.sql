SELECT cohorts.name AS "cohort", 
SUM(ar.completed_at - ar.started_at) AS "total_duration"
FROM assistance_requests ar
JOIN students stu ON ar.student_id = stu.id
JOIN cohorts ON cohorts.id = stu.cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;