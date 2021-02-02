SELECT COUNT(ar.*) AS "total_requests",
stu.name AS "name"
FROM students stu
  JOIN assistance_requests ar ON stu.id = ar.student_id
  WHERE name = 'Elliot Dickinson'
GROUP BY stu.name;
