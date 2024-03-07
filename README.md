Employee SQL Challenge (Using Postgres)<br/>
DU - DA Module 9
--------------------------------
--------------------------------
<h2>by Laura Vara</h2><br/>

![EmployeeSQL](https://github.com/vara-co/sql-challenge/assets/152572519/3a0253fc-3d83-4205-908f-dba7fb18beb6) <br/>
NOTE: Please be aware that while creating the ERD, there are no value length for the columns, defined. I completed the ERD with assistance from my instructor, whom adviced to remove the value lenght to avoid errors. Thus I removed them.
However, because these values are 10 points of the grade, I added them again in EmployeeSQL_Schema.sql file.

This repository consists of a challenge in which I created:
1. An ERD (Entity Relationship Diagram)
2. A SCHEMA sql file based on that ERD
3. A Query sql file to answer questions for Analysis

---------------------------------
INDEX
---------------------------------
1. Content of the repository
2. Instructions for the SQL Challenge
3. References

---------------------------------
Content of the repository
---------------------------------
- EmployeeSQL directory:
    - ERD_EmployeeSQL.png  <-- Image of the ERD (Entity Relationship Diagram) for the EmployeeSQL Database
    - ERD_PhysicalModule_DiagramCode.txt  <-- This is the code used to create the ERD above via https://app.quickdatabasediagrams.com/ NOTE: It does not contain the value length for columns as per my instructor's recommendation to avoid errors.
    - EmployeeSQL_Analysis.sql <-- SQL file with the Analysis, answering questions with the corresponding query for it
    - EmployeeSQL_Schema.sql <-- SQL file with the Schema used for the Analysis. NOTE: Follow commented sections to correctly run this schema. Value length for columns are defined in this schema, regardless of them not being in the ERD
    - EmployeeSQL_SchemaFROM_ERD.sql <-- SQL file with the original Schema exported from the creation of the ERD. NOTE: This had to be modified to work, which ended up being the 'EmployeeSQL_Schema.sql' file above, after such modifications.
      
- data directory:
    - departments.csv
    - dept_emp.csv
    - dept_manager.csv
    - employees.csv
    - salaries.csv
    - titles.csv

----------------------------------
Instructions for EmployeeSQL
----------------------------------
This Challenge is divided in three parts: data modeling, data engineering, and data analysis.

**Data Modeling**
  - Inspect the CSV files, and then sketch an Entity Relationship Diagram of the tables. To create the sketch, feel free to use a tool like https://app.quickdatabasediagrams.com/

**Data Engineering**
1. Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:
   - Remember to specify the data types, primary keys, foreign keys, and other constraints.
   - For the primary keys, verify that the column is unique. Otherwise, create a composite key, which takes two primary keys to uniquely identify a row.
   - Be sure to create the tables in the correct order to handle the foreign keys.
2. Import each CSV file into its corresponding SQL table

- HINT: To avoid errors, import the data in the same order as the corresponding tables got created. And, remember to account for the headers when doing the imports.

**Data Analysis**
1. List the employee number, last name, first name, sex, and salary of each employee.
2. List the first name, last name, and hire date for the employees who were hired in 1986.
3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
6. List each employee in the Sales department, including their employee number, last name, and first name.
7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

------------------------------------
References for EmployeeSQL
------------------------------------
Most of what's in this challenge, was covered in class.
The few things that either weren't or I had to reference to, are described
with it's source right below.

- Droping Constraints:
    - https://www.beekeeperstudio.io/blog/how-to-drop-a-constraint-in-postgresql
    - https://www.postgresql.org/message-id/3DFFB0670A395946974CE996C72073241C496AB2@NDHMC4SXCH.gdc4s.com

- Adding Constraints back:
    - https://www.postgresql.org/docs/current/sql-altertable.html

- Extracting the Year from the Hire Date column for a conditional type query
    - https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/
    - https://www.postgresql.org/docs/16/functions-datetime.html
