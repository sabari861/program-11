# Lab Program 11 – Create StudentDetails View

## Aim

To create a SQL view named `StudentDetails` using Student, Course, Enrollment, and Department tables.

## Problem Statement

Create a view named `StudentDetails` using the following tables:

### Student

```text
Student(StudentID, StudentName, DepartmentID)
```

### Course

```text
Course(CourseID, CourseName)
```

### Enrollment

```text
Enrollment(EnrollmentID, StudentID, CourseID)
```

### Department

```text
Department(DepartmentID, DepartmentName)
```

Insert suitable sample values and create a view to display:

```text
Student Name
Course Name
Department Name
```

## Required View

The view must be named:

```text
StudentDetails
```

The view should display:

```text
StudentName
CourseName
DepartmentName
```

## Required Relationships

The tables are related as follows:

```text
Student
   |
   | StudentID
   |
Enrollment
   |
   | CourseID
   |
Course
```

and:

```text
Student
   |
   | DepartmentID
   |
Department
```

## Student Tasks

1. Create the required tables.
2. Define appropriate primary keys.
3. Define foreign keys where appropriate.
4. Insert suitable sample records.
5. Create a view named `StudentDetails`.
6. Display Student Name, Course Name, and Department Name through the view.
7. Verify the view using a `SELECT` statement.

## Submission Files

Students must complete:

```text
solution.sql
```

The GitHub Actions workflow will automatically test the solution.

## Learning Outcome

After completing this practical, students will be able to:

* Create SQL views.
* Combine data from multiple tables using JOIN.
* Retrieve data through a view.
* Understand the purpose of database views.
