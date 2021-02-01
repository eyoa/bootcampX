SELECT students.name,
cohorts.name,
cohorts.start_date AS "cohort start date",
students.start_date AS "student start date"
FROM students JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE students.start_date != cohorts.start_date
ORDER BY cohorts.start_date;