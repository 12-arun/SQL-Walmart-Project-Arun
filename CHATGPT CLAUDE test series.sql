-- Create Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    hire_date DATE
);

-- Insert data into Employees table
INSERT INTO Employees (employee_id, employee_name, department_id, hire_date) VALUES
(1, 'John', 1, '2023-01-15'),
(2, 'Alice', 1, '2022-05-20'),
(3, 'Bob', 2, '2022-11-10'),
(4, 'Sarah', 2, '2023-03-01');

-- Create Salaries table
CREATE TABLE Salaries (
    employee_id INT,
    salary_amount INT,
    salary_date DATE
);

-- Insert data into Salaries table
INSERT INTO Salaries (employee_id, salary_amount, salary_date) VALUES
(1, 60000, '2024-05-01'),
(2, 65000, '2024-06-01'),
(3, 55000, '2024-06-01'),
(4, 60000, '2024-06-01'),
(2, 62000, '2024-03-01'),
(3, 56000, '2024-02-01'),
(4, 58000, '2024-01-01');

-- Create Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert data into Departments table
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Sales'),
(2, 'Marketing');

select * from Employees;
select * from Salaries;
select * from Departments;

# Write a query to generate a report that shows the highest salary earned by each employee in their respective department. If an employee has not 
# received a salary within the last three months, display "No data" instead of the salary amount


SELECT 
    a.employee_name,
    c.department_name,
    MAX(b.salary_amount) AS max_salary,
    CASE 
        WHEN MAX(CASE WHEN b.salary_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH) THEN 1 ELSE 0 END) = 0
        THEN 'No data' 
        ELSE 'Regular income' 
    END AS income_proof
FROM 
    Employees a
INNER JOIN 
    Salaries b ON a.employee_id = b.employee_id
INNER JOIN 
    Departments c ON a.department_id = c.department_id
GROUP BY 
    a.employee_name,
    c.department_name;







CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

-- Insert data into Students table
INSERT INTO Students (student_id, student_name, age, gender) VALUES
(1, 'John', 20, 'Male'),
(2, 'Alice', 22, 'Female'),
(3, 'Bob', 21, 'Male'),
(4, 'Sarah', 19, 'Female');

-- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    department_id INT
);

-- Insert data into Courses table
INSERT INTO Courses (course_id, course_name, department_id) VALUES
(101, 'Biology', 1),
(102, 'Chemistry', 1),
(103, 'Physics', 1),
(104, 'Algebra', 2),
(105, 'Calculus', 2);

-- Create Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

-- Insert data into Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 101, '2024-05-01'),
(2, 2, 101, '2024-05-01'),
(3, 3, 102, '2024-05-02'),
(4, 4, 103, '2024-05-02'),
(5, 1, 104, '2024-05-03');

select * from Students;
select * from Courses;
select * from Enrollments;


# Write a query to find the number of male and female students enrolled in each course in the Science department. 
# If a course has no enrollments, display 0 for both male and female students.

select 
a.gender,
c.course_name,
count(*) as no_of_std,
case ()
from Students a
inner join Enrollments b
on a.student_id = b.student_id
inner join Courses c
on b.course_id = c.course_id
where c.course_name in ('Biology','Chemistry','Physics')
group by gender,
course_name;

select 
a.*,
b.*,
c.*
from Students a
inner join Enrollments b
on a.student_id = b.student_id
inner join Courses c
on b.course_id = c.course_id;


SELECT 
    c.course_id,
    c.course_name,
    COALESCE(SUM(CASE WHEN s.gender = 'Male' THEN 1 ELSE 0 END), 0) AS male_students,
    COALESCE(SUM(CASE WHEN s.gender = 'Female' THEN 1 ELSE 0 END), 0) AS female_students
FROM 
    Courses c
LEFT JOIN 
    Enrollments e ON c.course_id = e.course_id
LEFT JOIN 
    Students s ON e.student_id = s.student_id
# WHERE 
#    c.department_id = 1
GROUP BY 
    c.course_id, c.course_name;
    
    
 
 
 
 
 
 
Drop table Employees;
Drop table Departments; 
Drop table Salaries;

-- Create Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department_id INT
);

-- Insert data into Employees table
INSERT INTO Employees (employee_id, employee_name, age, gender, department_id) VALUES
(1, 'John', 30, 'Male', 1),
(2, 'Alice', 28, 'Female', 1),
(3, 'Bob', 35, 'Male', 2),
(4, 'Sarah', 25, 'Female', 2),
(5, 'Mike', 40, 'Male', 3),
(6, 'Anna', 32, 'Female', 3),
(7, 'Tom', 29, 'Male', 4);

-- Create Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert data into Departments table
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

-- Create Salaries table
CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary_amount DECIMAL(10,2),
    salary_date DATE
);

-- Insert data into Salaries table
INSERT INTO Salaries (salary_id, employee_id, salary_amount, salary_date) VALUES
(1, 1, 5000, '2024-01-15'),
(2, 2, 6000, '2024-02-15'),
(3, 3, 5500, '2024-03-15'),
(4, 4, 6200, '2024-04-15'),
(5, 5, 7000, '2023-05-15'),
(6, 6, 8000, '2024-05-15'),
(7, 7, 4500, '2023-06-15'),
(8, 1, 5200, '2024-06-15'),
(9, 2, 6100, '2024-07-15'),
(10, 3, 5700, '2024-08-15'),
(11, 4, 6300, '2024-09-15');


select * from Employees;
select * from Departments;
select * from Salaries;

# Write a query to find the total salary paid to male and female employees in each department for the current year. 
# If a department has no employees or no salaries recorded, display 0 for both male and female total salaries.

SELECT 
    b.department_id,
    b.department_name,
    COALESCE(SUM(CASE WHEN a.gender = 'Male' THEN c.salary_amount ELSE 0 END), 0) AS total_salary_male,
    COALESCE(SUM(CASE WHEN a.gender = 'Female' THEN c.salary_amount ELSE 0 END), 0) AS total_salary_female
FROM 
    Departments b
LEFT JOIN 
    Employees a ON b.department_id = a.department_id
LEFT JOIN 
    Salaries c ON a.employee_id = c.employee_id AND YEAR(c.salary_date) = YEAR(CURDATE())
GROUP BY 
    b.department_id,
    b.department_name;







Drop table Employees;
Drop table Departments; 
Drop table Salaries;
drop table Projects;
drop table Assignments;


-- Create Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department_id INT
);

-- Insert data into Employees table
INSERT INTO Employees (employee_id, employee_name, age, gender, department_id) VALUES
(1, 'John', 30, 'Male', 1),
(2, 'Alice', 28, 'Female', 1),
(3, 'Bob', 35, 'Male', 2),
(4, 'Sarah', 25, 'Female', 2),
(5, 'Mike', 40, 'Male', 3),
(6, 'Anna', 32, 'Female', 3),
(7, 'Tom', 29, 'Male', 4);

-- Create Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert data into Departments table
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

-- Create Salaries table
CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary_amount DECIMAL(10,2),
    salary_date DATE
);

-- Insert data into Salaries table
INSERT INTO Salaries (salary_id, employee_id, salary_amount, salary_date) VALUES
(1, 1, 5000, '2024-01-15'),
(2, 2, 6000, '2024-02-15'),
(3, 3, 5500, '2024-03-15'),
(4, 4, 6200, '2024-04-15'),
(5, 5, 7000, '2023-05-15'),
(6, 6, 8000, '2024-05-15'),
(7, 7, 4500, '2023-06-15'),
(8, 1, 5200, '2024-06-15'),
(9, 2, 6100, '2024-07-15'),
(10, 3, 5700, '2024-08-15'),
(11, 4, 6300, '2024-09-15');

-- Create Projects table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    department_id INT
);

-- Insert data into Projects table
INSERT INTO Projects (project_id, project_name, department_id) VALUES
(101, 'Project A', 1),
(102, 'Project B', 2),
(103, 'Project C', 3);

-- Create Assignments table
CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    project_id INT,
    employee_id INT
);

-- Insert data into Assignments table
INSERT INTO Assignments (assignment_id, project_id, employee_id) VALUES
(1, 101, 1),
(2, 101, 2),
(3, 102, 3),
(4, 102, 4),
(5, 103, 5),
(6, 103, 6);



select * from Employees;
select * from Departments;
select * from Salaries;
select * from Projects;
select * from Assignments;

# write a query to find the total salary paid to male and female employees working on projects in each department for the current year. 
# If a department has no employees or no salaries recorded, display 0 for both male and female total salaries.


SELECT 
    a.department_id,
    a.department_name,
    b.project_name,
    COALESCE(SUM(CASE WHEN e.gender = 'Male' THEN d.salary_amount ELSE 0 END), 0) AS total_salary_male,
    COALESCE(SUM(CASE WHEN e.gender = 'Female' THEN d.salary_amount ELSE 0 END), 0) AS total_salary_female,
    COALESCE(SUM(CASE WHEN e.gender = 'Male' THEN 1 ELSE 0 END), 0) AS male_students,
    COALESCE(SUM(CASE WHEN e.gender = 'Female' THEN 1 ELSE 0 END), 0) AS female_students
FROM 
    Departments a
LEFT JOIN 
    Projects b ON a.department_id = b.department_id
LEFT JOIN 
    Assignments c ON b.project_id = c.project_id
LEFT JOIN 
    Employees e ON c.employee_id = e.employee_id
LEFT JOIN 
    Salaries d ON e.employee_id = d.employee_id AND YEAR(d.salary_date) = YEAR(CURDATE())
GROUP BY 
    a.department_id,
    a.department_name,
    b.project_name;
    
    
#Join Path and Conditions:
#Your query joins Employees directly with Departments, but to correctly capture the relationship between projects and employees, we need to go through the Assignments table.
#The Assignments table connects projects with employees, ensuring that we only consider employees who are actually working on the projects.

#Proper Linking of Projects to Employees:
#In your query, employees are joined directly to departments without considering their assignments to projects. This could result in including employees who are not assigned to any projects.
#The corrected query ensures that only employees assigned to projects are considered by joining the Assignments table with Projects and then linking to Employees.









drop table Books;
drop table Authors;
drop table Borrowers;
drop table Loans;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publication_year INT
);

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100)
);

CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY,
    borrower_name VARCHAR(100)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    loan_date DATE,
    return_date DATE
);

-- Insert data into Books table
INSERT INTO Books (book_id, title, author_id, publication_year) VALUES
(1, 'To Kill a Mockingbird', 101, 1960),
(2, 'Pride and Prejudice', 102, 1813),
(3, '1984', 103, 1949),
(4, 'The Great Gatsby', 104, 1925),
(5, 'Moby-Dick', 105, 1851),
(6, 'Animal Farm', 103, 1945),
(7, 'The Catcher in the Rye', 106, 1951),
(8, 'Harry Potter and the Philosopher''s Stone', 107, 1997),
(9, 'The Hobbit', 108, 1937),
(10, 'Jane Eyre', 109, 1847);

-- Insert data into Authors table
INSERT INTO Authors (author_id, author_name) VALUES
(101, 'Harper Lee'),
(102, 'Jane Austen'),
(103, 'George Orwell'),
(104, 'F. Scott Fitzgerald'),
(105, 'Herman Melville'),
(106, 'J.D. Salinger'),
(107, 'J.K. Rowling'),
(108, 'J.R.R. Tolkien'),
(109, 'Charlotte Brontë');

-- Insert data into Borrowers table
INSERT INTO Borrowers (borrower_id, borrower_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Emma'),
(6, 'Fred'),
(7, 'Grace'),
(8, 'Henry'),
(9, 'Isabel'),
(10, 'Jack');

-- Insert data into Loans table
INSERT INTO Loans (loan_id, book_id, borrower_id, loan_date, return_date) VALUES
(1, 1, 1, '2023-01-15', '2023-02-05'),
(2, 1, 2, '2023-02-01', '2023-03-02'),
(3, 2, 3, '2023-02-10', '2023-03-15'),
(4, 3, 4, '2023-03-01', '2023-03-25'),
(5, 4, 5, '2023-04-05', '2023-05-10'),
(6, 5, 6, '2023-05-15', '2023-06-20'),
(7, 6, 7, '2023-06-01', '2023-06-30'),
(8, 7, 8, '2023-07-05', '2023-08-10'),
(9, 8, 9, '2023-08-15', '2023-09-20'),
(10, 9, 10, '2023-09-25', '2023-10-30'),
(11, 10, 1, '2023-10-01', '2023-11-05'),
(12, 1, 3, '2023-11-10', '2023-12-15'),
(13, 2, 5, '2023-12-20', '2024-01-25'),
(14, 3, 7, '2024-01-01', '2024-02-05'),
(15, 4, 9, '2024-02-10', '2024-03-15'),
(16, 5, 2, '2024-03-20', '2024-04-25'),
(17, 6, 4, '2024-04-01', '2024-05-05'),
(18, 7, 6, '2024-05-10', '2024-06-15'),
(19, 8, 8, '2024-06-20', '2024-07-25'),
(20, 9, 10, '2024-07-05', '2024-08-10'),
(21, 10, 2, '2024-08-15', '2024-09-20'),
(22, 1, 5, '2024-09-25', '2024-10-30'),
(23, 2, 7, '2024-10-01', '2024-11-05'),
(24, 3, 9, '2024-11-10', '2024-12-15'),
(25, 4, 10, '2024-12-20', '2025-01-25');



select * from Books;
select * from Authors;
select * from Borrowers;
select * from Loans;


# Write a SQL query to find the top 3 authors with the highest average number of books borrowed per year. 
# Ensure that authors who haven't had any books borrowed are also considered, with their average set to 0. 
# Provide the author's name and the average number of books borrowed per year in the result set.

select 
	a.author_name,
	year(c.loan_date) as borrowed_year,
	count(c.book_id) as no_of_books_borrowed
from 
	authors a
left join 
	books b on a.author_id = b.author_id
left join 
	loans c on b.book_id = c.book_id
group by 
	a.author_name,
	borrowed_year
order by 
	no_of_books_borrowed desc;
    








CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2)
);

INSERT INTO Orders (order_id, customer_id, order_date, order_amount) VALUES
(1, 101, '2024-01-10', 150.50),
(2, 102, '2024-01-12', 200.75),
(3, 101, '2024-01-15', 75.25),
(4, 103, '2024-01-18', 300.00),
(5, 102, '2024-01-20', 180.00),
(6, 101, '2024-01-22', 250.30),
(7, 104, '2024-01-25', 120.80),
(8, 102, '2024-01-28', 90.50),
(9, 101, '2024-01-30', 175.60),
(10, 103, '2024-01-31', 220.40);


select * from Orders;


# Your task is to write a SQL query to find the top 3 customers who have spent the most amount of money on orders, 
# along with the total amount spent by each customer.

with temp as
(
select 
customer_id,
sum(order_amount) as total_amount,
row_number() over(order by sum(order_amount) desc)  as spending_rank
from Orders
group by 
customer_id
)
select 
customer_id,
total_amount
from temp
where spending_rank <= 3
order by 
total_amount desc;










drop table Employees;
drop table Departments;

CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO Employees (employee_id, employee_name, department_id, salary) VALUES
(1, 'Alice', 101, 50000.00),
(2, 'Bob', 102, 60000.00),
(3, 'Charlie', 101, 55000.00),
(4, 'David', 103, 62000.00),
(5, 'Emma', 102, 58000.00),
(6, 'Fred', 103, 63000.00),
(7, 'Grace', 101, 52000.00),
(8, 'Henry', 102, 61000.00),
(9, 'Isabel', 103, 64000.00),
(10, 'Jack', 101, 53000.00);

CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(50)
);

INSERT INTO Departments (department_id, department_name) VALUES
(101, 'Marketing'),
(102, 'Finance'),
(103, 'Human Resources');

select * from Employees ;
select * from  Departments;

#Your task is to write a SQL query to find the names of all employees who belong to departments with the highest average salary.

SELECT 
    employee_name
FROM 
    employees
WHERE 
    department_id = (
        SELECT 
            e.department_id
        FROM 
            employees e
        GROUP BY 
            e.department_id
        ORDER BY 
            AVG(e.salary) DESC
        LIMIT 1
);





drop table Students;
drop table Courses;

CREATE TABLE Students (
    student_id INT,
    student_name VARCHAR(50),
    grade_level INT,
    GPA DECIMAL(3, 2)
);

INSERT INTO Students (student_id, student_name, grade_level, GPA) VALUES
(1, 'Alice', 9, 3.75),
(2, 'Bob', 9, 3.80),
(3, 'Charlie', 10, 3.90),
(4, 'David', 10, 3.85),
(5, 'Emma', 11, 3.95),
(6, 'Fred', 11, 4.00),
(7, 'Grace', 12, 3.70),
(8, 'Henry', 12, 3.75),
(9, 'Isabel', 12, 3.80);

CREATE TABLE Courses (
    course_id INT,
    course_name VARCHAR(50),
    instructor_id INT
);

INSERT INTO Courses (course_id, course_name, instructor_id) VALUES
(1, 'Mathematics', 101),
(2, 'Science', 102),
(3, 'History', 103),
(4, 'English', 104);


select * from students;
select * from Courses;

-- First, create a CTE to calculate the average GPA for each grade level
WITH GradeLevelAvgGPA AS (
    SELECT
        grade_level,
        AVG(GPA) AS avg_gpa
    FROM
        Students
    GROUP BY
        grade_level
),

-- Next, create a CTE to calculate the average GPA for each course
CourseAvgGPA AS (
    SELECT
        c.course_id,
        c.course_name,
        c.instructor_id,
        AVG(s.GPA) AS avg_course_gpa
    FROM
        Courses c
    JOIN
        Students s ON c.course_id = s.student_id -- Assuming a join condition for sample data
    GROUP BY
        c.course_id, c.course_name, c.instructor_id
),

-- Finally, create a CTE to find the course with the highest average GPA
MaxCourseAvgGPA AS (
    SELECT
        course_id,
        course_name,
        instructor_id,
        avg_course_gpa
    FROM
        CourseAvgGPA
    ORDER BY
        avg_course_gpa DESC
    LIMIT 1
)

-- Select the average GPA of students in each grade level and the instructor who teaches the course with the highest average GPA
SELECT
    g.grade_level,
    g.avg_gpa,
    m.course_name,
    m.instructor_id
FROM
    GradeLevelAvgGPA g,
    MaxCourseAvgGPA m;
    
    
    




use sys;

drop table if exists Customers;
drop table if exists  Orders;
drop table if exists  Products;
drop table if exists  OrderDetails;

CREATE TABLE Customers (
    customer_id INT,
    customer_name VARCHAR(50)
);

INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Emma');

CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT INTO Orders (order_id, customer_id, order_date) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-03-10'),
(3, 3, '2024-05-20'),
(4, 4, '2024-07-30'),
(5, 5, '2024-09-25'),
(6, 1, '2024-11-05');

CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 500.00),
(4, 'Monitor', 150.00),
(5, 'Keyboard', 50.00);

CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 4, 4),
(4, 5, 10),
(5, 1, 1),
(6, 2, 2);

select * from  Customers;
select * from  Orders;
select * from  Products;
select * from  OrderDetails;


# Write a SQL query to find the top 3 customers who have spent the most on orders in the current year.

select 
a.customer_name,
sum(c.quantity * d.price) as total_spent
from customers a
inner join orders b
on a.customer_id = b.customer_id and year(order_date) = year(curdate())
inner join orderdetails c
on b.order_id = c.order_id
inner join products d
on c.product_id = d.product_id
group by 
a.customer_name
order by total_spent desc 
limit 3;







use sys;

drop table if exists Customers;
drop table if exists  Orders;
drop table if exists  Products;
drop table if exists  OrderDetails;

CREATE TABLE Customers (
    customer_id INT,
    customer_name VARCHAR(50)
);

INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Emma');

CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT INTO Orders (order_id, customer_id, order_date) VALUES
(1, 1, '2024-05-15'),
(2, 2, '2024-05-20'),
(3, 3, '2024-05-20'),
(4, 1, '2024-05-25'),
(5, 1, '2024-05-28'),
(6, 2, '2024-06-05');

CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 500.00),
(4, 'Monitor', 150.00),
(5, 'Keyboard', 50.00);

CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 4, 4),
(4, 5, 10),
(5, 1, 1),
(6, 2, 2);



select * from  Customers;
select * from  Orders;
select * from  Products;
select * from  OrderDetails;

# Write a SQL query to find the customer who placed the maximum number of orders in the last month. If there is a tie, return all such customers.


select 
a.customer_name,
count(b.order_id) as max_orders
from customers a
inner join orders b
on a.customer_id = b.customer_id 
where month(order_date) = month(date_sub(curdate(), interval 1 month))
group by 
a.customer_name
order by max_orders desc
limit 1;





CREATE TABLE EmployeeSalaries (
    employee_id INT,
    salary DECIMAL(10, 2),
    effective_date DATE
);

INSERT INTO EmployeeSalaries (employee_id, salary, effective_date) VALUES
(1, 50000.00, '2023-01-01'),
(1, 55000.00, '2023-07-01'),
(2, 60000.00, '2023-01-01'),
(2, 63000.00, '2023-07-01'),
(2, 65000.00, '2024-01-01'),
(3, 70000.00, '2023-01-01'),
(3, 70000.00, '2023-07-01');

select * from EmployeeSalaries;

# Write a SQL query to find the percentage increase in salary for each employee from their previous salary to their current salary. 
# Exclude any employees whose salary has remained the same over consecutive effective dates.


select 
a.employee_id,
((b.salary - a.salary)/a.salary) * 100 as percentage_change
from EmployeeSalaries a
inner join EmployeeSalaries b
on  a.employee_id = b.employee_id
and a.effective_date < b.effective_date;



WITH cte AS (
    SELECT
        es1.employee_id,
        es1.salary AS prev_salary,
        es2.salary AS curr_salary,
        es1.effective_date AS prev_effective_date,
        es2.effective_date AS curr_effective_date,
        ROW_NUMBER() OVER (PARTITION BY es1.employee_id ORDER BY es2.effective_date DESC) AS rn
    FROM
        EmployeeSalaries es1
        JOIN EmployeeSalaries es2 ON es1.employee_id = es2.employee_id
            AND es1.effective_date < es2.effective_date
)
SELECT
    employee_id,
    prev_salary,
    curr_salary,
    prev_effective_date,
    curr_effective_date,
    CASE
        WHEN prev_salary != curr_salary THEN
            ROUND(100.0 * (curr_salary - prev_salary) / prev_salary, 2)
        ELSE
            NULL
    END AS percentage_increase
FROM
    cte
WHERE
    rn = 1
ORDER BY
    employee_id;
                      
                      
                      

use sys;
drop table Orders;
drop table Order_Items;
drop table Products;

CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2)
);

CREATE TABLE Products1 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

INSERT INTO Orders1 (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 101, '2023-05-01', 250.75),
    (2, 102, '2023-05-02', 379.80),
    (3, 103, '2023-05-03', 126.20),
    (4, 101, '2023-05-04', 594.35),
    (5, 104, '2023-05-05', 168.90);

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 1, 2, 99.99),
    (2, 1, 3, 1, 49.99),
    (3, 2, 2, 3, 89.99),
    (4, 2, 4, 1, 109.99),
    (5, 3, 5, 2, 62.99),
    (6, 4, 1, 3, 99.99),
    (7, 4, 2, 2, 89.99),
    (8, 4, 6, 1, 149.99),
    (9, 5, 3, 2, 49.99),
    (10, 5, 4, 1, 109.99);

INSERT INTO Products1 (product_id, product_name, category, unit_price)
VALUES
    (1, 'Laptop', 'Electronics', 99.99),
    (2, 'Smartphone', 'Electronics', 89.99),
    (3, 'Headphones', 'Electronics', 49.99),
    (4, 'Smartwatch', 'Electronics', 109.99),
    (5, 'Book', 'Books', 62.99),
    (6, 'Tablet', 'Electronics', 149.99);
    
    
select * from Orders1;
select * from Order_Items;
select * from Products1;

# Write a SQL query to find the top 3 customers who have made the highest total purchases (based on the sum of total_amount from the Orders table), 
# and for each of those customers, retrieve their customer_id, the total amount spent, and the list of products they have purchased (product_name from the Products table) 
# along with the total quantity of each product.

with temp as
(select 
a.customer_id,
sum(a.total_amount) as total_amount_spent,
b.product_id,
sum(b.quantity) as total_quantity
from orders1 a 
inner join order_items b
on a.order_id = b.order_id
group by a.customer_id,
b.product_id
)
select 
customer_id,
total_amount_spent,
group_concat(distinct concat(product_name, '(',total_quantity,')')) as all_products
from temp a
inner join 
products b
on a.product_id = b.product_id
group by customer_id,
total_amount_spent
order by total_amount_spent desc limit 3;




use pizzahut;

CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

CREATE TABLE Order_Items1 (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2)
);

CREATE TABLE Products1 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

INSERT INTO Orders1 (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 101, '2023-05-01', 250.75),
    (2, 102, '2023-05-02', 379.80),
    (3, 103, '2023-05-03', 126.20),
    (4, 101, '2023-05-04', 594.35),
    (5, 104, '2023-05-05', 168.90);

INSERT INTO Order_Items1 (order_item_id, order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 1, 2, 99.99),
    (2, 1, 3, 1, 49.99),
    (3, 2, 2, 3, 89.99),
    (4, 2, 4, 1, 109.99),
    (5, 3, 5, 2, 62.99),
    (6, 4, 1, 3, 99.99),
    (7, 4, 2, 2, 89.99),
    (8, 4, 6, 1, 149.99),
    (9, 5, 3, 2, 49.99),
    (10, 5, 4, 1, 109.99);

INSERT INTO Products1 (product_id, product_name, category, unit_price)
VALUES
    (1, 'Laptop', 'Electronics', 99.99),
    (2, 'Smartphone', 'Electronics', 89.99),
    (3, 'Headphones', 'Electronics', 49.99),
    (4, 'Smartwatch', 'Electronics', 109.99),
    (5, 'Book', 'Books', 62.99),
    (6, 'Tablet', 'Electronics', 149.99);


select * from Orders1;
select * from Order_Items1;
select * from Products1;


# Write a SQL query to find the most popular product category based on the total quantity sold. 
# The query should return the category name and the total quantity sold for that category.

select 
category,
sum(quantity) as total_quantitiy_sold
from
products1 a
inner join order_items1 b
on a.product_id = b.product_id
group by 
category
order by total_quantitiy_sold desc limit 1;






use pizzahut;
drop table Customers;
drop table Orders;
#drop table Order_Items;
#drop table Products;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(4, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Customers (customer_id, first_name, last_name, email, city, country)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', 'New York', 'USA'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', 'London', 'UK'),
    (3, 'Michael', 'Johnson', 'michael.johnson@example.com', 'Paris', 'France'),
    (4, 'Emily', 'Williams', 'emily.williams@example.com', 'Tokyo', 'Japan'),
    (5, 'David', 'Brown', 'david.brown@example.com', 'Sydney', 'Australia');

INSERT INTO Orders (order_id, customer_id, order_date, ship_date, ship_mode)
VALUES
    (1, 1, '2023-04-01', '2023-04-05', 'Standard'),
    (2, 2, '2023-04-02', '2023-04-07', 'Express'),
    (3, 3, '2023-04-03', '2023-04-08', 'Standard'),
    (4, 4, '2023-04-04', '2023-04-10', 'Express'),
    (5, 5, '2023-04-05', '2023-04-12', 'Standard');

INSERT INTO Products (product_id, product_name, category, subcategory, unit_price)
VALUES
    (1, 'Laptop', 'Electronics', 'Computers', 999.99),
    (2, 'Smartphone', 'Electronics', 'Phones', 699.99),
    (3, 'Headphones', 'Electronics', 'Audio', 99.99),
    (4, 'Book', 'Books', 'Fiction', 19.99),
    (5, 'T-Shirt', 'Apparel', 'Clothing', 29.99);

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, discount)
VALUES
    (1, 1, 1, 1, 0.10),
    (2, 1, 3, 2, 0.00),
    (3, 2, 2, 1, 0.15),
    (4, 2, 4, 3, 0.00),
    (5, 3, 1, 1, 0.20),
    (6, 3, 5, 2, 0.00),
    (7, 4, 2, 1, 0.10),
    (8, 4, 3, 1, 0.00),
    (9, 5, 4, 2, 0.05),
    (10, 5, 5, 1, 0.00);
    
    
select * from Customers;
select * from Orders;
select * from Order_Items;
select * from Products; 

# Write a SQL query to find the top 3 customers who have made the most orders (based on the number of orders placed), 
# and for each of those customers, retrieve their full name, email, city, country, and the total revenue generated from their orders (considering discounts).

with tmp as (
select 
customer_id,
count(a.order_id) as total_no_order_plcd,
((unit_price * quantity) - (unit_price * quantity * discount)) as rvnue_gnrt_wth_dscnt
from orders a
inner join order_items b
on a.order_id = b.order_id
inner join products c
on b.product_id = c.product_id
group by 
customer_id,
unit_price,
quantity,
discount
)
select 
b.customer_id,
first_name,
last_name,email,
city,country,
sum(total_no_order_plcd) as total_order_placed,
sum(rvnue_gnrt_wth_dscnt) as total_rvnue_gnrt_wth_dscnt
from tmp a inner join customers b
on a.customer_id = b.customer_id
group by 
b.customer_id,
first_name,
last_name,email,
city,country
order by total_order_placed desc limit 3;







CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2)
);

CREATE TABLE Employee_Projects (
    employee_id INT,
    project_id INT,
    start_date DATE,
    end_date DATE,
    allocation_percentage DECIMAL(5, 2),
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);


INSERT INTO Employees (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES
    (1, 'John', 'Doe', 1, 80000.00, '2019-01-01'),
    (2, 'Jane', 'Smith', 2, 75000.00, '2020-03-15'),
    (3, 'Michael', 'Johnson', 1, 90000.00, '2018-07-20'),
    (4, 'Emily', 'Williams', 3, 85000.00, '2021-11-05'),
    (5, 'David', 'Brown', 2, 70000.00, '2022-09-25');

INSERT INTO Departments (department_id, department_name, location)
VALUES
    (1, 'IT', 'New York'),
    (2, 'Marketing', 'London'),
    (3, 'Finance', 'Paris');

INSERT INTO Projects (project_id, project_name, start_date, end_date, budget)
VALUES
    (1, 'Project Alpha', '2023-01-01', '2023-12-31', 500000.00),
    (2, 'Project Bravo', '2023-03-01', '2024-06-30', 750000.00),
    (3, 'Project Charlie', '2023-07-01', '2024-03-31', 1000000.00);

INSERT INTO Employee_Projects (employee_id, project_id, start_date, end_date, allocation_percentage)
VALUES
    (1, 1, '2023-01-01', '2023-06-30', 50.00),
    (1, 2, '2023-07-01', '2024-06-30', 75.00),
    (2, 1, '2023-01-01', '2023-12-31', 100.00),
    (3, 2, '2023-03-01', '2024-06-30', 25.00),
    (3, 3, '2023-07-01', '2024-03-31', 50.00),
    (4, 3, '2023-07-01', '2024-03-31', 100.00),
    (5, 1, '2023-01-01', '2023-06-30', 75.00),
    (5, 2, '2023-07-01', '2024-06-30', 50.00);
    
select * from Employees;
select * from Departments;
select * from Projects;
select * from Employee_Projects;


# Question: Write a SQL query to find the top 3 projects with the highest total allocated salary cost. 
# For each project, retrieve the project name, start date, end date, budget, total allocated salary cost, 
# and the percentage of the total allocated salary cost compared to the project budget.
# The total allocated salary cost for a project should be calculated as the sum of the proportional salaries of all employees 
# assigned to that project based on their allocation percentage and the duration of their assignment.
# For example, if an employee with a salary of $100,000 is allocated 50% to a project for 6 months, 
# their allocated salary cost for that project would be: $100,000 * 0.5 * (6/12) = $25,000.

with tmp as
(
select 
a.employee_id,
a.start_date,a.end_date,a.project_id,
sum((salary * (allocation_percentage / 100) * (TIMESTAMPDIFF(MONTH, start_date, end_date) / 12 ))) as allocated_salary_cost
from 
employee_projects a
inner join employees b
on a.employee_id = b.employee_id
group by 
a.employee_id,a.start_date,a.end_date,a.project_id
)
select a.employee_id,
a.start_date,a.end_date,b.budget,b.project_name,
a.allocated_salary_cost,
((allocated_salary_cost/budget)*100) as prcntg_allctd_slry_cst
from tmp a
inner join projects b
on a.project_id = b.project_id
order by a.allocated_salary_cost desc limit 3
;


# optimized version 

SELECT
    p.project_name,
    p.start_date,
    p.end_date,
    p.budget,
    SUM(e.salary * ep.allocation_percentage / 100 * DATEDIFF(LEAST(ep.end_date, p.end_date), GREATEST(ep.start_date, p.start_date)) / 365.25) AS total_allocated_salary_cost,
    ROUND(100.0 * SUM(e.salary * ep.allocation_percentage / 100 * DATEDIFF(LEAST(ep.end_date, p.end_date), GREATEST(ep.start_date, p.start_date)) / 365.25) / p.budget, 2) AS percentage_of_budget
FROM
    Projects p
    INNER JOIN Employee_Projects ep ON p.project_id = ep.project_id
    INNER JOIN Employees e ON ep.employee_id = e.employee_id
GROUP BY
    p.project_id
ORDER BY
    total_allocated_salary_cost DESC
LIMIT 3;






-- Create the sales table
CREATE TABLE sales (
    salesperson_id INT,
    sale_amount DECIMAL(10, 2),
    sale_date DATE
);

-- Insert sample data into the sales table
INSERT INTO sales (salesperson_id, sale_amount, sale_date) VALUES 
(1, 100, '2023-01-01'),
(1, 150, '2023-01-02'),
(1, 200, '2023-01-03'),
(2, 300, '2023-01-01'),
(2, 100, '2023-01-02');

select * from sales;

# Write a Hive query to calculate the running total of sales for each salesperson.


SELECT 
    salesperson_id, 
    sale_amount, 
    sale_date,
    SUM(sale_amount) OVER (PARTITION BY salesperson_id ORDER BY sale_date) AS running_total
FROM 
    sales;





drop table sales;

-- Create the sales table
CREATE TABLE sales (
    product_id INT,
    sale_amount DECIMAL(10, 2),
    sale_date DATE
);

-- Insert sample data into the sales table
INSERT INTO sales (product_id, sale_amount, sale_date) VALUES 
(1, 100, '2023-01-01'),
(1, 150, '2023-01-02'),
(1, 200, '2023-01-03'),
(1, 250, '2023-01-04'),
(2, 300, '2023-01-01'),
(2, 100, '2023-01-02'),
(2, 200, '2023-01-03');

select * from sales;

#Write a Hive query to calculate the 3-day moving average of sales for each product.

SELECT product_id, sale_amount, sale_date,
AVG(sale_amount) OVER (PARTITION BY product_id ORDER BY sale_date ROWS BETWEEN 2 PRECEDING AND CURRENT
ROW) as moving_avg
FROM sales;


# find first and last element of each product

with tmp as
(
select product_id,
sale_amount,
row_number() over(partition by product_id order by sale_date) as rn
from sales
)
select product_id,
sale_amount  from tmp where rn in(1,3);



select 
	product_id,
    sale_amount,
    sale_date,
	first_value(sale_amount) over(partition by product_id order by sale_date) as first_sale,
	last_value(sale_amount) over(partition by product_id order by sale_date rows between unbounded preceding and unbounded following) as last_sale
from 
	sales;
    
/* The LAST_VALUE function is a window function in Hive that returns the last value in the specified window. 
It's commonly used to retrieve the last value of a particular column, partitioned by another column, and ordered by a specific column or expression.
Here's an example to illustrate how LAST_VALUE works:
Suppose we have a table orders with the following data:
Copy+------------+------------+------------+
| order_date | product_id | sale_amount|
+------------+------------+------------+
| 2023-05-01 |          1 |     100.00 |
| 2023-05-02 |          1 |     200.00 |
| 2023-05-03 |          1 |     150.00 |
| 2023-05-01 |          2 |     300.00 |
| 2023-05-02 |          2 |     250.00 |
| 2023-05-03 |          2 |     180.00 |
+------------+------------+------------+
If we want to find the last sale amount for each product, we can use the following query:
sqlCopySELECT 
    product_id,
    sale_amount,
    order_date,
    LAST_VALUE(sale_amount) OVER (
        PARTITION BY product_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_sale_amount
FROM orders;
This query will produce the following output:
Copy+------------+------------+------------+----------------+
| product_id | sale_amount| order_date | last_sale_amount|
+------------+------------+------------+----------------+
|          1 |     100.00 | 2023-05-01 |          150.00|
|          1 |     200.00 | 2023-05-02 |          150.00|
|          1 |     150.00 | 2023-05-03 |          150.00|
|          2 |     300.00 | 2023-05-01 |          180.00|
|          2 |     250.00 | 2023-05-02 |          180.00|
|          2 |     180.00 | 2023-05-03 |          180.00|
+------------+------------+------------+----------------+
Here's how the LAST_VALUE function works:

The PARTITION BY clause divides the rows into partitions based on the product_id column.
The ORDER BY clause sorts the rows within each partition by the order_date column.
The ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING clause specifies that the window should include all rows before and after the current row, within each partition.
The LAST_VALUE function calculates the last value of the sale_amount column within the specified window (i.e., all rows for each product).

In the output, you can see that the last_sale_amount column contains the last sale amount for each product, regardless of the order_date. For product 1, the last sale amount is 150.00, and for product 2, the last sale amount is 180.00.
The ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING clause is crucial for getting the correct last value when the rows are not sorted in the desired order. If you omit this clause, the LAST_VALUE function will return the last value based on the current row's position in the sorted window, which may not be the desired result.
    
*/






use pizzahut;

drop table sales;

CREATE TABLE sales (
    salesperson_id INT,
    sale_amount DECIMAL(10,2), 
    sale_date DATE
);

INSERT INTO sales (salesperson_id, sale_amount, sale_date) VALUES
    (1, 1000.00, '2023-05-01'),
    (1, 2000.00, '2023-05-02'),
    (2, 3000.00, '2023-05-01'), 
    (2, 2500.00, '2023-05-02'),
    (3, 4000.00, '2023-05-01'),
    (3, 1500.00, '2023-05-03');
    
select * from sales; 
    
# Rank the salespersons based on their total sales in descending order.

SELECT 
    salesperson_id,
    SUM(sale_amount) AS total_sales, 
    RANK() OVER (ORDER BY SUM(sale_amount) DESC) AS sales_rank
FROM 
    sales
GROUP BY
    salesperson_id
ORDER BY
    total_sales DESC;



drop table sales;

CREATE TABLE sales (
    product_id INT,
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (product_id, sale_amount, sale_date) VALUES
    (1, 1000.00, '2023-05-01'),
    (1, 2000.00, '2023-05-02'),
    (1, 1500.00, '2023-05-03'),
    (2, 3000.00, '2023-05-01'),
    (2, 2500.00, '2023-05-02'),
    (2, 1800.00, '2023-05-03');

select * from sales;

# calculate the 60th percentile of sale amounts for each product in the sales table.

# in mySql

SELECT  
	SUBSTRING_INDEX(SUBSTRING_INDEX( GROUP_CONCAT( sale_amount ORDER BY sale_amount SEPARATOR ','), ',', 60/100 * COUNT(*) + 1 ), ',', -1 ) AS `90th Percentile`
FROM    
	sales;

SELECT SUBSTRING_INDEX("www.w3schools.com", ".", 2);

select GROUP_CONCAT( sale_amount ORDER BY sale_amount SEPARATOR ',') from sales;
select SUBSTRING_INDEX( GROUP_CONCAT( sale_amount ORDER BY sale_amount SEPARATOR ','), ',', 60/100 * COUNT(*) + 1 ) from sales;



# In HQL

SELECT product_id, 
       PERCENTILE_APPROX(sale_amount, 0.6) OVER (PARTITION BY product_id) AS percentile_60  
FROM sales;





drop table sales;

CREATE TABLE sales (
    product_id INT,
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (product_id, sale_amount, sale_date) VALUES
    (1, 1000.00, '2023-05-01'),
    (1, 2000.00, '2023-05-02'),
    (1, 1500.00, '2023-05-03'),
    (2, 3000.00, '2023-05-01'),
    (2, 2500.00, '2023-05-02'),
    (2, 1800.00, '2023-05-03');

select * from sales;

# find the sale amount of the previous and next sale for each product in the sales table.

select 
product_id,
sale_date,
lead (sale_amount) over (partition by product_id order by sale_date) as next_sale,
lag (sale_amount) over (partition by product_id order by sale_date) as previous_sale
from sales;






drop table sales;

CREATE TABLE sales (
    product_id INT,
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (product_id, sale_amount, sale_date) VALUES
    (1, 1000.00, '2023-05-01'),
    (1, 2000.00, '2023-05-02'),
    (1, 1500.00, '2023-05-03'),
    (2, 3000.00, '2023-05-01'),
    (2, 2500.00, '2023-05-02'),
    (2, 1800.00, '2023-05-03');
    
select * from sales;

# find the top 2 sale amounts for each product in the sales table.

with tmp as
(
select 
product_id,
sale_amount,
row_number() over(partition by product_id order by sale_amount desc) as rn
from sales
)
select 
product_id,
sale_amount
from tmp 
where rn = 3;


# in sql

SELECT product_id, 
       NTH_VALUE(sale_amount, 3) OVER (PARTITION BY product_id ORDER BY sale_amount DESC) AS third_highest
FROM sales;