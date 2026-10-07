-- Lab Program 11
-- Create the StudentDetails view.
--
-- The view must display:
-- StudentName
-- CourseName
-- DepartmentName
--
-- Required view name:
-- StudentDetails

USE CollegeDB;

-- Write your solution below.

Since the view needs Department Name, the Department table is also included.

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics');
INSERT INTO Student VALUES
(101, 'Arun', 1),
(102, 'Priya', 1),
(103, 'Karthik', 2),
(104, 'Divya', 3);
INSERT INTO Course VALUES
(201, 'Database Management Systems'),
(202, 'Computer Networks'),
(203, 'Operating Systems'),
(204, 'Web Technology');

INSERT INTO Enrollment VALUES
(1, 101, 201),
(2, 101, 202),
(3, 102, 201),
(4, 103, 203),
(5, 104, 204);
CREATE VIEW StudentDetails AS
SELECT
    S.StudentName,
    C.CourseName,
    D.DepartmentName
FROM Student S
JOIN Enrollment E
    ON S.StudentID = E.StudentID
JOIN Course C
    ON E.CourseID = C.CourseID
JOIN Department D
    ON S.DepartmentID = D.DepartmentID;
SELECT * FROM StudentDetails;
