----------------------------------------------------------------------------------
-- JOIN all the tables and create a VIEW of the JOIN, use ALIASes to avoid errors
-- This will allow for a better use of the columns at the moment of analysis
----------------------------------------------------------------------------------
CREATE VIEW employee_data AS
SELECT 
    t.title_id AS "Title ID",
    t.title AS "Title",
    d.dept_no AS "Department No",
    d.dept_name AS "Department Name",
    e.emp_no AS "Employee No",
    e.birth_date AS "Birth Date",
    e.first_name AS "First Name",
    e.last_name AS "Last Name",
    e.sex AS "Sex",
    e.hire_date AS "Hire Date",
    s.salary AS "Salary"
FROM titles AS t
JOIN employees AS e ON t.title_id = e.emp_title_id
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
LEFT JOIN dept_manager AS dm ON e.emp_no = dm.emp_no AND de.dept_no = dm.dept_no;

-- Show the VIEW of this newly JOINed table
SELECT * FROM employee_data;

-- Use this line, only if you need to drop the view to edit, and recreate it.
-- DROP VIEW employee_data;

-------------------------------------------------------------------
--          Start the Queries for Analysis
-------------------------------------------------------------------

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT "Employee No", "Last Name", "First Name", "Sex", "Salary"
FROM employee_data

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT "First Name", "Last Name", "Hire Date"
FROM employee_data
WHERE EXTRACT(YEAR FROM "Hire Date") = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT "Department No", "Department Name", "Employee No", "Last Name", "Last Name"
FROM employee_data
WHERE "Title" LIKE 'Manager';

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT "Employee No", "Last Name", "First Name", "Department No", "Department Name"
FROM employee_data

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT "First Name", "Last Name", "Sex"
FROM employee_data
WHERE "First Name" LIKE 'Hercules' AND "Last Name" LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT "Employee No", "Last Name", "First Name"
FROM employee_data
WHERE "Department Name" LIKE 'Sales'

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "Employee No", "Last Name", "First Name", "Department Name"
FROM employee_data
WHERE "Department Name" IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT "Last Name", COUNT("Last Name") AS "Frequency Count"
FROM employee_data
GROUP BY "Last Name"
ORDER BY "Frequency Count" DESC;

-----------------------------------------------------------------------------------
