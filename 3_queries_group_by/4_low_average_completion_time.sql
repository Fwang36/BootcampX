SELECT students.name, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignment_id = assignments.id
WHERE end_date IS NULL
GROUP BY students.name
HAVING avg(assignments.duration) > avg(assignment_submissions.duration)
ORDER BY average_assignment_duration ASC;
