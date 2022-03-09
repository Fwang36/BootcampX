const { Pool } = require('pg');
const arg = process.argv.slice(2)

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const queryString = `
SELECT students.id, students.name as student, cohorts.name as cohort
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2
`
const cohortName = arg[0]
const limit = arg[1]
const values = [`${cohortName}%`, limit]
pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.student} has an id of ${user.id} and was in the ${user.cohort} cohort`)
  });
})
.catch(err => console.error('query error', err.stack));
