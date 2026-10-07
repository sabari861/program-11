# Lab Program 11 – Startup Instructions

## Objective

Create a view named `StudentDetails` that displays:

```text
StudentName
CourseName
DepartmentName
```

using Student, Course, Enrollment, and Department tables.

## Step 1 – Understand the Tables

### Student

```text
StudentID
StudentName
DepartmentID
```

### Course

```text
CourseID
CourseName
```

### Enrollment

```text
EnrollmentID
StudentID
CourseID
```

### Department

```text
DepartmentID
DepartmentName
```

## Step 2 – Create the Tables

Use `schema.sql` as the database starting point.

## Step 3 – Insert Sample Data

Insert suitable values into all required tables.

At least:

* 4 students
* 3 courses
* 2 departments
* 5 enrollments

## Step 4 – Create the View

Create a view with the exact name:

```text
StudentDetails
```

The view must contain:

```text
StudentName
CourseName
DepartmentName
```

## Step 5 – Join the Tables

The required logical join is:

```text
Student
   ↓
Department

Student
   ↓
Enrollment
   ↓
Course
```

## Step 6 – Verify the View

Use:

```sql
SELECT * FROM StudentDetails;
```

## Submission

After completing `solution.sql`:

```bash
git add .
git commit -m "Completed Lab Program 11"
git push
```

Open the **Actions** tab in GitHub to check the automated result.

## Important

Do not modify:

```text
test.sh
.github/workflows/autograding.yml
```
