SELECT cohorts.name, 
AVG(ar.completed_at - ar.started_at) AS "average_assistance_time"
FROM assistance_requests ar
JOIN students stu ON ar.student_id = stu.id
JOIN cohorts ON cohorts.id = stu.cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;