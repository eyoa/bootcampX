SELECT t.name AS "teacher",
stu.name AS "student",
assign.name AS "assignment",
(ar.completed_at - ar.started_at) AS "duration"
FROM teachers t
JOIN assistance_requests ar ON t.id = ar.teacher_id
JOIN students stu ON ar.student_id = stu.id
JOIN assignments assign ON ar.assignment_id = assign.id
ORDER BY duration;