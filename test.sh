#!/bin/bash

set -e

echo "=========================================="
echo "Lab Program 11 - StudentDetails View"
echo "=========================================="

DB="CollegeDB"
MYSQL="mysql -h 127.0.0.1 -u root -proot"

echo ""
echo "Loading database schema..."

$MYSQL < schema.sql

echo "Running student solution..."

$MYSQL "$DB" < solution.sql

PASS=0
FAIL=0

check() {
    TEST_NAME="$1"
    SQL="$2"
    EXPECTED="$3"

    RESULT=$($MYSQL -N -s "$DB" -e "$SQL" | tr -d '\r' | xargs)

    if [ "$RESULT" = "$EXPECTED" ]; then
        echo "PASS: $TEST_NAME"
        PASS=$((PASS+1))
    else
        echo "FAIL: $TEST_NAME"
        echo "  Expected: $EXPECTED"
        echo "  Actual:   $RESULT"
        FAIL=$((FAIL+1))
    fi
}

echo ""
echo "Checking tables..."

check "Department table exists" \
"SELECT COUNT(*)
 FROM information_schema.tables
 WHERE table_schema='$DB'
 AND table_name='Department';" "1"

check "Student table exists" \
"SELECT COUNT(*)
 FROM information_schema.tables
 WHERE table_schema='$DB'
 AND table_name='Student';" "1"

check "Course table exists" \
"SELECT COUNT(*)
 FROM information_schema.tables
 WHERE table_schema='$DB'
 AND table_name='Course';" "1"

check "Enrollment table exists" \
"SELECT COUNT(*)
 FROM information_schema.tables
 WHERE table_schema='$DB'
 AND table_name='Enrollment';" "1"

echo ""
echo "Checking StudentDetails view..."

check "StudentDetails view exists" \
"SELECT COUNT(*)
 FROM information_schema.views
 WHERE table_schema='$DB'
 AND table_name='StudentDetails';" "1"

echo ""
echo "Checking view columns..."

check "StudentName column exists" \
"SELECT COUNT(*)
 FROM information_schema.columns
 WHERE table_schema='$DB'
 AND table_name='StudentDetails'
 AND column_name='StudentName';" "1"

check "CourseName column exists" \
"SELECT COUNT(*)
 FROM information_schema.columns
 WHERE table_schema='$DB'
 AND table_name='StudentDetails'
 AND column_name='CourseName';" "1"

check "DepartmentName column exists" \
"SELECT COUNT(*)
 FROM information_schema.columns
 WHERE table_schema='$DB'
 AND table_name='StudentDetails'
 AND column_name='DepartmentName';" "1"

echo ""
echo "Checking view data..."

check "View returns 5 records" \
"SELECT COUNT(*) FROM StudentDetails;" "5"

check "Arun appears in view" \
"SELECT COUNT(*)
 FROM StudentDetails
 WHERE StudentName='Arun';" "2"

check "Bala appears in view" \
"SELECT COUNT(*)
 FROM StudentDetails
 WHERE StudentName='Bala';" "1"

check "Divya appears in view" \
"SELECT COUNT(*)
 FROM StudentDetails
 WHERE StudentName='Divya';" "1"

check "Meena appears in view" \
"SELECT COUNT(*)
 FROM StudentDetails
 WHERE StudentName='Meena';" "1"

echo ""
echo "Checking joins..."

check "Student-Enrollment-Course join produces records" \
"SELECT COUNT(*)
 FROM Student s
 JOIN Enrollment e ON s.StudentID=e.StudentID
 JOIN Course c ON e.CourseID=c.CourseID;" "5"

check "Student-Department join produces records" \
"SELECT COUNT(*)
 FROM Student s
 JOIN Department d ON s.DepartmentID=d.DepartmentID;" "4"

echo ""
echo "=========================================="
echo "RESULT"
echo "=========================================="

echo "Passed : $PASS"
echo "Failed : $FAIL"
echo "Total  : $((PASS+FAIL))"

if [ "$FAIL" -eq 0 ]; then
    echo ""
    echo "ALL TEST CASES PASSED"
    exit 0
else
    echo ""
    echo "SOME TEST CASES FAILED"
    exit 1
fi
