-----------------------------------------------------
--           EMPLOYEE SQL SCHEMA 
-----------------------------------------------------
CREATE TABLE "titles" (
    "title_id" VARCHAR(30) NOT NULL,
    "title" VARCHAR(40) NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(20) NOT NULL,
    "dept_name" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

CREATE TABLE "employees" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR(30) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "sex" VARCHAR(10) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY ("emp_title_id") REFERENCES "titles" ("title_id")
);

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(20) NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no"),
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(20) NOT NULL,
    "emp_no" INT NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no", "emp_no"),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-- In order to upload the CSV files to their respective tables
-- Drop all constraints in the specified order
-- Drop foreign key constraints first, then primary key constraints

-- Drop foreign key constraints
ALTER TABLE "dept_emp" DROP CONSTRAINT IF EXISTS "fk_dept_emp_emp_no";
ALTER TABLE "dept_emp" DROP CONSTRAINT IF EXISTS "fk_dept_emp_dept_no";
ALTER TABLE "dept_manager" DROP CONSTRAINT IF EXISTS "fk_dept_manager_dept_no";
ALTER TABLE "dept_manager" DROP CONSTRAINT IF EXISTS "fk_dept_manager_emp_no";
ALTER TABLE "employees" DROP CONSTRAINT IF EXISTS "fk_employees_emp_title_id";
ALTER TABLE "salaries" DROP CONSTRAINT IF EXISTS "fk_salaries_emp_no";

-- Drop primary key constraints
ALTER TABLE "titles" DROP CONSTRAINT IF EXISTS "pk_titles";
ALTER TABLE "departments" DROP CONSTRAINT IF EXISTS "pk_departments";
ALTER TABLE "employees" DROP CONSTRAINT IF EXISTS "pk_employees";
ALTER TABLE "salaries" DROP CONSTRAINT IF EXISTS "pk_salaries";
ALTER TABLE "dept_emp" DROP CONSTRAINT IF EXISTS "pk_dept_emp";
ALTER TABLE "dept_manager" DROP CONSTRAINT IF EXISTS "pk_dept_manager";

---------------------------------------------------------------------------------
-- Import the CSV files with the header option checked then...
---------------------------------------------------------------------------------
-- Verify that all the tables display accordingly
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

------------------------------------------------------------------------------
-- Add all the constraints(again) that were dropped after uploading the CSVs
-- After values display correctly
------------------------------------------------------------------------------
-- Re-add all constraints in the specified order
-- Re-add primary key constraints first, then foreign key constraints

-- Re-add primary key constraints
ALTER TABLE "titles" ADD CONSTRAINT "pk_titles" PRIMARY KEY ("title_id");
ALTER TABLE "departments" ADD CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no");
ALTER TABLE "employees" ADD CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no");
ALTER TABLE "salaries" ADD CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no");
ALTER TABLE "dept_emp" ADD CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no");
ALTER TABLE "dept_manager" ADD CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no", "emp_no");

-- Re-add foreign key constraints
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY ("emp_title_id") REFERENCES "titles" ("title_id");
ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

----------------------------------------------------------------------------------------------------------------
-- NOTE: This schema was originally created from exporting the ERD via https://app.quickdatabasediagrams.com/
-- We saw the development of the ERD in class, and I completed the PK and FK section with my instructor's guidance.
-- However, the order of the tables created here had to be rearranged to avoid errors with their relationship.
-- The Analysis SQL file starts with a VIEW created with JOINs to better use the values in each table to answer
-- the questions in the analysis section of this challenge.
----------------------------------------------------------------------------------------------------------------