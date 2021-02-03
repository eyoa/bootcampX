const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const getTeachers = (cohortName) => {
  const name = "%" + cohortName + "%";

  const que = `SELECT DISTINCT t.name AS teacher,
  cohorts.name AS cohort
  FROM teachers t
  JOIN assistance_requests ar ON t.id = ar.teacher_id
  JOIN students stu ON stu.id = ar.student_id
  JOIN cohorts ON cohorts.id = stu.cohort_id
  WHERE cohorts.name LIKE $1
  ORDER BY teacher;`;
  
  pool.query(que, [name])
.then(res => {
  res.rows.forEach(data => {
    console.log(`${data.cohort} : ${data.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));
}

const cohortName = process.argv[2];
getTeachers(cohortName);