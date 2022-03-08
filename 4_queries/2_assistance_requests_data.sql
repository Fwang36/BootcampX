SELECT teachers.name as teacher, students.name as teacher, assignments.name as assignment, (
  SELECT assistance_requests.completed_at - assistance_requests.started_at
) as duration
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
JOIN teachers ON teacher_id = teachers.id
ORDER BY duration;