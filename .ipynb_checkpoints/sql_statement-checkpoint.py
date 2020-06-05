sql_query = """

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


"""