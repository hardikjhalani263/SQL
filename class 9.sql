create database tushardb;
use tushardb;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    EnrollmentYear INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



-- Students Table
INSERT INTO Students VALUES
(1, 'Aditi Sharma', 'Computer Science', 2022),
(2, 'Rohan Patel', 'Mechanical', 2023),
(3, 'Sara Khan', 'Computer Science', 2022),
(4, 'Michael Brown', 'Civil', 2023),
(5, 'Neha Gupta', 'Mechanical', 2024),
(6, 'David Miller', 'Civil', 2022),
(7, 'Priya Verma', 'Computer Science', 2023);

-- Courses Table
INSERT INTO Courses VALUES
(101, 'Data Structures', 'Computer Science', 4),
(102, 'Thermodynamics', 'Mechanical', 3),
(103, 'Fluid Mechanics', 'Civil', 4),
(104, 'DBMS', 'Computer Science', 3),
(105, 'Machine Design', 'Mechanical', 4),
(106, 'Structural Analysis', 'Civil', 3),
(107, 'Operating Systems', 'Computer Science', 4);

-- Enrollments Table
INSERT INTO Enrollments VALUES
(1, 1, 101, '2025-01-10'),
(2, 1, 104, '2025-01-12'),
(3, 2, 102, '2025-01-11'),
(4, 2, 105, '2025-01-15'),
(5, 3, 101, '2025-01-13'),
(6, 3, 107, '2025-01-17'),
(7, 4, 103, '2025-01-16'),
(8, 5, 102, '2025-01-18'),
(9, 6, 103, '2025-01-19'),
(10, 7, 104, '2025-01-20'),
(11, 7, 107, '2025-01-21');
-- 1
select Department , count(studentid) as Totalstudent from students group by department 
order by department;
-- 1
select Department , count(courseid) as Totalcourses from courses group by department 
order by Department;
-- 2
select s.studentname, s.studentid , e.studentid , e. courseid , c.courseid ,c.coursename from students as s 
 join enrollments as e on s.studentid = e.studentid 
 join courses as c on c.courseid=e.courseid;
 -- 4
select s.StudentName ,c.coursename from Students as s 
join Enrollments as e on s.studentid=e.studentid 
join courses as c on c.courseid=e.courseid order by studentName;
-- 5
select c.coursename,s.studentname from courses as c 
join Enrollments as e on c.courseid=e.courseid
join students as s on e.studentid=s.studentid order by courseName ;
-- 6
select s.StudentName ,c.coursename from Students as s 
left join Enrollments as e on s.studentid=e.studentid 
left join courses as c on c.courseid=e.courseid order by studentName;
-- 7
select c.coursename,s.studentname from courses as c 
left join Enrollments as e on c.courseid=e.courseid
left join students as s on e.studentid=s.studentid order by courseName ;
-- 8 
select c.coursename , count(s.studentname) as totalstudent from courses as c 
left join Enrollments as e on e.courseid = c.courseid
left join students as s on e.studentid=s.studentid
group by c.coursename 
order by totalStudent desc;
-- 3 
select c.coursename , count(e.enrollmentid) as totalEnrollments from course as c
left join Enrollments as e on e.courseid = c.courseid
group by c.coursename ;
-- 9
select s.studentname,sum(c.credits) as totalCredits from students as s
join Enrollments as e on s.studentid=e.studentid
join courses as c on e.courseid=c.courseid group by studentName ;
-- 10
select c.department,c.coursename,count(s.studentname) as totalstudent from students as s 
join enrollments as e on s.studentid=e.studentid 
join courses as c on e.courseid=c.courseid 
group by c.department,c.coursename order by department;