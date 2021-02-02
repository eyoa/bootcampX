SELECT assign.id,
assign.name, 
assign.day,
assign.chapter,
COUNT(ar.*) AS total_requests
FROM assignments assign 
JOIN assistance_requests ar ON assign.id = ar.assignment_id
GROUP BY assign.id, assign.name, assign.day, assign.chapter
ORDER BY total_requests DESC;