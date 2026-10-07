# Lab Program 11 – Test Cases

## Total Marks: 15

| Test Case | Requirement                               | Marks |
| --------- | ----------------------------------------- | ----: |
| TC01      | Department table exists                   |     1 |
| TC02      | Student table exists                      |     1 |
| TC03      | Course table exists                       |     1 |
| TC04      | Enrollment table exists                   |     1 |
| TC05      | StudentDetails view exists                |     2 |
| TC06      | View contains StudentName                 |     1 |
| TC07      | View contains CourseName                  |     1 |
| TC08      | View contains DepartmentName              |     1 |
| TC09      | View returns student records              |     1 |
| TC10      | View returns course records               |     1 |
| TC11      | View returns department records           |     1 |
| TC12      | Student–Enrollment join is correctly used |     1 |
| TC13      | Enrollment–Course join is correctly used  |     1 |
| TC14      | Student–Department join is correctly used |     1 |

**Total = 15 Marks**

## Expected View

The view should provide information equivalent to:

```text
StudentName | CourseName | DepartmentName
```

## Manual Verification

The instructor may execute:

```sql
SELECT * FROM StudentDetails;
```

and verify that the returned information correctly combines:

* Student
* Course
* Department

through the Enrollment table.
