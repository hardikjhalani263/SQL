drop database regex123;
create database regex123;

use regex123;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);


INSERT INTO Student (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Helen'),
(9, 'Ian'),
(10, 'Jack');


INSERT INTO Enrollment (EnrollmentID, StudentID, CourseName) VALUES
(101, 1, 'Math'),
(102, 2, 'Physics'),
(103, 3, 'Chemistry'),
(104, 1, 'English'),
(105, 5, 'Biology'),
(106, 7, 'History'),
(107, 10, 'Math');

select * from student;

select * from Enrollment;

select s.studentid , s.studentname ,e.enrollmentid from student as s
join enrollment as e where s.studentid=e.studentid;

select s.studentid , s.studentname ,e.enrollmentid from student as s
left join enrollment as e on s.studentid=e.studentid;

select s.studentid from student as s
inner join enrollment as e on s.studentid=e.studentid;

select s.studentid , s.studentname ,e.enrollmentid from student as s
left join enrollment as e on s.studentid=e.studentid where enrollmentid is null;

select s.studentid , count(e.enrollmentid) from student as s
left join enrollment as e on s.studentid=e.studentid 
group by s.studentid;

select e.coursename , count (s.studentid) ,count(e.coursename) from student as s
left join enrollment as e on s.studentid=e.studentid 
group by e.coursename;
 
 
 

