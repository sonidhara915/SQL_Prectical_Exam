CREATE DATABASE db;
USE db;

-- Student table

Drop TABLE Students;

CREATE TABLE Students(
    std_id INT PRIMARY KEY,
    f_name VARCHAR(20),
    l_name VARCHAR(30) ,
    email VARCHAR(50),
    bd DATE,
    E_Date DATE
);

-- Department Table

CREATE TABLE Departments(
    dept_id INT PRIMARY Key,
    dept_name VARCHAR(20)
);

-- Course table 


CREATE TABLE Courses(

    co_id INT PRIMARY KEY,
    co_name VARCHAR(30),
    dept_id INT,
    credits INT,
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);

-- Instructor Table

CREATE TABLE Instructors(

    Instructor_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    Last_name VARCHAR(30),
    Email VARCHAR(50),
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES Departments(dept_id)
);

-- Enrollment Table

CREATE Table Enrollments(

    enroll_id INT PRIMARY KEY,
    std_id INT,
    co_id INT,
    Enrollment_date DATE,
    FOREIGN KEY(std_id) REFERENCES Students(std_id),
    FOREIGN KEY(co_id) REFERENCES Courses(co_id)
);

INSERT INTO Students VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Alice', 'Johnson', 'alice@gmail.com', '2001-03-10', '2022-08-05'),
(4, 'Bob', 'Lee', 'bob.lee@gmail.com', '2000-07-20', '2023-08-01'),
(5, 'David', 'Brown', 'david.brown@gmail.com', '2002-11-12', '2023-08-10');

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Electrical');

INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Python Programming', 1, 3),
(104, 'Engineering Maths', 3, 4),
(105, 'Database Management', 2, 3);

INSERT INTO Instructors VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2),
(3, 'David', 'Brown', 'david@univ.com', 3),
(4, 'Emma', 'Wilson', 'emma@univ.com', 4),
(5, 'James', 'Taylor', 'james@univ.com', 5);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-08-05'),
(2, 2, 102, '2022-08-10'),
(3, 3, 103, '2023-08-01'),
(4, 4, 104, '2023-08-05'),
(5, 5, 105, '2023-08-10');

SELECT * FROM Students;

SELECT * FROM Departments;

SELECT * FROM Courses;

SELECT * FROM Instructors;

SELECT * FROM Enrollments;


-- CRUD

Insert Into Students VALUES
(6,"Minal","Green","minal312@gmail.com","2001-04-12","2024-08-15");

SELECT * FROM Students;

UPDATE Students SET f_name = "Mike" WHERE std_id = 6;

DELETE FROM students WHERE std_id = 6;

SELECT * FROM Students WHERE E_Date >2022-12-31;

SELECT * FROM Departments WHERE dept_name = "Mathematics" LIMIT 5;

SELECT co_id,COUNT(std_id) as Total_Students FROM Enrollments GROUP BY co_id HAVING COUNT(std_id) > 5;

SELECT AVG(Credits) AS Average_Credits FROM Course;

ALTER TABLE Instructors ADD Salary DECIMAL(10,2);

SELECT Max(s.Salary) AS Maximum_salary FROM Instructors s
JOIN Departments d ON s.dept_name = d.dept_name
WHERE d.dept_name = "Comupter Science";

SELECT d.dept_name,COUNT(DISTINCT e.std_id) AS Total_Students FROM Departments d
JOIN Courses c ON d.dept_id = c.dept_id
JOIN Enrollments e on c.co_id = e.co_id
GROUP BY d.dept_name;


SELECT s.f_name,s.l_name,c.co_name FROM Students s
INNER JOIN Enrollments e ON s.std_id = e.std_id;
INNER JOIN Courses c ON e.co_id = c.co_id;

SELECT s.f_name,s.l_name,FROM Students s
LEFT JOIN Enrollments e On s.std_id = e.std_id;

SELECT * FROM Students WHERE std_id IN(SELECT std_id FROM Enrollments COUNT(std_id)>10);

SELECT std_id ,f_name,l_name,YEAR(E_Date)AS Enrollment_year FROM Students;

SELECT Instructor_id,CONCAT(first_name,Last_name) AS Full_name FROM Instructors;

SELECT enroll_id,co_id,COUNT(std_id) OVER (ORDER BY enroll_id) AS Running_Total FROM Enrollments;


