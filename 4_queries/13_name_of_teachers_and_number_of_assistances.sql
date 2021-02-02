SELECT t.name AS "teacher",
cohorts.name AS "cohort",
COUNT(ar.*) AS "total_assistances"
FROM teachers t
JOIN assistance_requests ar ON t.id = ar.teacher_id
JOIN students stu ON stu.id = ar.student_id
JOIN cohorts ON cohorts.id = stu.cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher, cohort
ORDER BY teacher;