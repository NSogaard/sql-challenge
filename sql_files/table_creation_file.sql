-- Creating all of the tables necessary for this assignment
-- These first two tables are the only two with no foreign keys, so they are declared first
-- departments (from 'departments.csv')
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

-- titles (from 'titles.csv')
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

-- employees (from 'employees.csv')
-- 'emp_title_id' is a foreign key from the 'titles' table (title_id)
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL REFERENCES titles (title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

-- salaries (from 'salaries.csv')
-- 'emp_no' is a foreign key from the 'employees' table (emp_no)
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY REFERENCES employees (emp_no),
	salary INT NOT NULL
);

-- department_employees (from 'dept_emp.csv')
-- employees can be in more than one department, so emp_no is not made a primary key (and thus a composite key is used)
-- 'emp_no' is a foreign key from the 'employees' table (emp_no)
-- 'dept_no' is a foreign key from the 'departments' table (dept_no)
CREATE TABLE department_employees (
	emp_no INT NOT NULL REFERENCES employees (emp_no),
	dept_no VARCHAR(4) NOT NULL REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- department_managers (from 'dept_manager.csv')
-- managers can be in more than one department, so emp_no is not made a primary key (and thus a composite key is used)
-- 'emp_no' is a foreign key from the 'employees' table (emp_no)
-- 'dept_no' is a foreign key from the 'departments' table (dept_no)
CREATE TABLE department_managers (
	dept_no VARCHAR(4) NOT NULL REFERENCES departments (dept_no),
	emp_no INT NOT NULL REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, dept_no)
);


