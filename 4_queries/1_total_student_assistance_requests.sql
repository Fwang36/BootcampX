SELECT count(assistance_requests.student_id) as total_assistances, students.name
FROM students 
JOIN assistance_requests ON student_id = students.id
WHERE name = 'Elliot Dickinson'
GROUP BY name;