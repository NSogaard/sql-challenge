-- Query #1: List the employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no AS "Employee Number", emp.last_name AS "Last Name", emp.first_name AS "First Name", emp.sex AS "Sex", sal.salary AS "Salary"
FROM employees as emp
LEFT JOIN salaries AS sal ON sal.emp_no = emp.emp_no;

-- Query #2: List the first name, last name, and hire date for the employees who were hired in 1986]
-- 'extract' function from the following tutorial: https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees as emp
WHERE EXTRACT(YEAR FROM emp.hire_date) = 1986;

-- Query #3: List the manager of each department along with their department number, department name, employee number, last name, and first name
CREATE VIEW employee_personal_info AS
	SELECT emp_no, first_name, last_name
	FROM employees;

SELECT dept_man.dept_no, depts.dept_name, dept_man.emp_no, epi.last_name, epi.first_name
FROM department_managers AS dept_man
INNER JOIN departments AS depts ON depts.dept_no = dept_man.dept_no
INNER JOIN employee_personal_info AS epi ON epi.emp_no = dept_man.emp_no;

-- Query #4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, epi.last_name, epi.first_name, depts.dept_name
FROM department_employees AS dept_emp
INNER JOIN departments AS depts ON depts.dept_no = dept_emp.dept_no
INNER JOIN employee_personal_info AS epi ON epi.emp_no = dept_emp.emp_no;

-- Query #5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SElECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Query #6: List each employee in the Sales department, including their employee number, last name, and first name
SELECT dept_emp.emp_no, epi.last_name, epi.first_name, depts.dept_name
FROM department_employees AS dept_emp
INNER JOIN departments AS depts ON depts.dept_no = dept_emp.dept_no
INNER JOIN employee_personal_info AS epi ON epi.emp_no = dept_emp.emp_no
WHERE depts.dept_name = 'Sales';

-- Query #7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT dept_emp.emp_no, epi.last_name, epi.first_name, depts.dept_name
FROM department_employees AS dept_emp
INNER JOIN departments AS depts ON depts.dept_no = dept_emp.dept_no
INNER JOIN employee_personal_info AS epi ON epi.emp_no = dept_emp.emp_no
WHERE depts.dept_name = 'Sales' OR depts.dept_name = 'Development';

-- Query #8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC;


