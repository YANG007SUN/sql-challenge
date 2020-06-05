SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employee
SELECT * FROM salaries
SELECT * FROM titles

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, (

	SELECT s.salary 
	FROM salaries AS s 
	WHERE e.emp_no = s.emp_no
), (
	SELECT t.title
	FROM titles AS t
	WHERE e.emp_title_id = t.title_id
	
)
FROM employee AS e
WHERE e.emp_no IN(

	SELECT s.emp_no
	FROM salaries AS s
)



--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee 
WHERE EXTRACT(YEAR FROM hire_date) = 1986

--List the manager of each department with the following information: 
--	department number, department name, the manager's employee number, last name, first name.

SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, d.dept_name
FROM employee AS e
INNER JOIN dept_manager as dm
ON dm.emp_no = e.emp_no
INNER JOIN departments as d
ON d.dept_no = dm.dept_no



-- List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
FROM employee AS e
INNER JOIN dept_emp as de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON d.dept_no = de.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employee
WHERE last_name LIKE 'B%' AND
first_name  = 'Hercules'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
FROM employee AS e
INNER JOIN dept_emp as de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
FROM employee AS e
INNER JOIN dept_emp as de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name,COUNT(last_name) AS frequency_of_lastname
FROM employee
GROUP BY last_name
ORDER BY frequency_of_lastname DESC





