CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(14) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    gender ENUM('M','F') NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no CHAR(4),
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
    emp_no INT,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE VIEW current_dept_emp AS
SELECT emp_no, dept_no, from_date, to_date
FROM dept_emp
WHERE to_date = '9999-01-01';

-- TESt
departmentsINSERT INTO departments VALUES 
('d001', 'Marketing'),
('d002', 'Finance'),
('d003', 'Human Resources'),
('d004', 'Production'),
('d005', 'Development'),
('d006', 'Quality Management'),
('d007', 'Sales'),
('d008', 'Research'),
('d009', 'Customer Service');
