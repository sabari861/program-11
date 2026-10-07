DROP DATABASE IF EXISTS CollegeDB;
CREATE DATABASE CollegeDB;

USE CollegeDB;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Commerce');

INSERT INTO Student VALUES
(101, 'Arun', 1),
(102, 'Bala', 1),
(103, 'Divya', 1),
(104, 'Meena', 2);

INSERT INTO Course VALUES
(201, 'Database Management Systems'),
(202, 'Web Technology'),
(203, 'Python Programming');

INSERT INTO Enrollment VALUES
(301, 101, 201),
(302, 101, 202),
(303, 102, 201),
(304, 103, 203),
(305, 104, 201);
