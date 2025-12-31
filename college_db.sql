-- 1. Setup Database
DROP DATABASE IF EXISTS college_db;
CREATE DATABASE college_db;
USE college_db;

-- 2. Create Students Table
-- Fixed: Removed internal semicolon
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    year INT,
    phone VARCHAR(15)
);

-- 3. Insert Student Data
INSERT INTO students (student_id, student_name, department, year, phone) VALUES
(1, 'Ravi', 'CSE', 2, '9876543210'),
(2, 'Sita', 'ECE', 3, '9876543220'),
(3, 'Kiran', 'CSE', 1, '9876543230'),
(4, 'Anjali', 'EEE', 4, '9876543240');

-- 4. Create Marks Table
-- Fixed: Removed internal semicolon before closing parenthesis
CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(30),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 5. Insert Marks Data
INSERT INTO marks (mark_id, student_id, subject, marks) VALUES
(101, 1, 'DBMS', 85),
(102, 1, 'OS', 78),
(103, 2, 'DBMS', 88),
(104, 3, 'DBMS', 72),
(105, 4, 'Networks', 90);

-- --- 6. Verification Queries ---

-- Basic Check
SELECT * FROM students;

-- Join Query: See student names alongside their marks
SELECT s.student_name, m.subject, m.marks
FROM students s
INNER JOIN marks m ON s.student_id = m.student_id;

-- Filtered Join: Only CSE department marks
SELECT s.student_name, m.subject, m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE s.department = 'CSE';
