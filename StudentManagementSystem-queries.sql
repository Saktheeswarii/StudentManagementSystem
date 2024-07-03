-- 1. Retrieve all student details.
SELECT * FROM Students;

-- 2. Retrieve all teacher details.
SELECT * FROM Teachers;

-- 3. List all classes with their respective teacher names.
SELECT Classes.name AS class_name, Teachers.name AS teacher_name
FROM Classes
JOIN Teachers ON Classes.teacherID = Teachers.teacherID;

-- 4. Find all students enrolled in a specific class.
SELECT Students.name AS student_name
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
WHERE Enrollments.classID = 1; -- Replace 1 with the specific classID

-- 5. Find all classes taught by a specific teacher.
SELECT Classes.name AS class_name
FROM Classes
WHERE Classes.teacherID = 1; -- Replace 1 with the specific teacherID

-- 6. List the total number of students enrolled in each class.
SELECT Classes.name AS class_name, COUNT(Enrollments.studentID) AS total_students
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name;

-- 7. Retrieve the details of a specific student.
SELECT * FROM Students
WHERE studentID = 1; -- Replace 1 with the specific studentID

-- 8. Retrieve the details of a specific teacher.
SELECT * FROM Teachers
WHERE teacherID = 1; -- Replace 1 with the specific teacherID

-- 9. List all students along with the classes they are enrolled in.
SELECT Students.name AS student_name, Classes.name AS class_name
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
JOIN Classes ON Enrollments.classID = Classes.classID;

-- 10. Find the total number of classes taught by each teacher.
SELECT Teachers.name AS teacher_name, COUNT(Classes.classID) AS total_classes
FROM Classes
JOIN Teachers ON Classes.teacherID = Teachers.teacherID
GROUP BY Teachers.name;

-- 11. List the teachers who are not teaching any classes.
SELECT Teachers.name AS teacher_name
FROM Teachers
LEFT JOIN Classes ON Teachers.teacherID = Classes.teacherID
WHERE Classes.teacherID IS NULL;

-- 12. Find the average number of students per class.
SELECT AVG(student_count) AS average_students_per_class
FROM (
    SELECT COUNT(Enrollments.studentID) AS student_count
    FROM Enrollments
    GROUP BY Enrollments.classID
) AS class_counts;

-- 13. List all classes with more than 10 students enrolled.
SELECT Classes.name AS class_name, COUNT(Enrollments.studentID) AS total_students
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name
HAVING COUNT(Enrollments.studentID) > 10;

-- 14. Find the class with the maximum number of students.
SELECT Classes.name AS class_name, COUNT(Enrollments.studentID) AS total_students
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name
ORDER BY total_students DESC
LIMIT 1;

-- 15. Find the class with the minimum number of students.
SELECT Classes.name AS class_name, COUNT(Enrollments.studentID) AS total_students
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name
ORDER BY total_students ASC
LIMIT 1;

-- 16. List all students who have not enrolled in any class.
SELECT Students.name AS student_name
FROM Students
LEFT JOIN Enrollments ON Students.studentID = Enrollments.studentID
WHERE Enrollments.studentID IS NULL;

-- 17. List all students along with their respective classes and teachers.
SELECT Students.name AS student_name, Classes.name AS class_name, Teachers.name AS teacher_name
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
JOIN Classes ON Enrollments.classID = Classes.classID
JOIN Teachers ON Classes.teacherID = Teachers.teacherID;

-- 18. Find the most popular class (the class with the highest enrollment).
SELECT Classes.name AS class_name, COUNT(Enrollments.studentID) AS total_students
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name
ORDER BY total_students DESC
LIMIT 1;

-- 19. Find the least popular class (the class with the lowest enrollment).
SELECT Classes.name AS class_name, COUNT(Enrollments.studentID) AS total_students
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name
ORDER BY total_students ASC
LIMIT 1;

-- 20. List all students enrolled in multiple classes.
SELECT Students.name AS student_name, COUNT(Enrollments.classID) AS class_count
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
GROUP BY Students.name
HAVING COUNT(Enrollments.classID) > 1;

-- 21. List all classes that have no students enrolled.
SELECT Classes.name AS class_name
FROM Classes
LEFT JOIN Enrollments ON Classes.classID = Enrollments.classID
WHERE Enrollments.classID IS NULL;

-- 22. Find the teacher who teaches the most classes.
SELECT Teachers.name AS teacher_name, COUNT(Classes.classID) AS class_count
FROM Classes
JOIN Teachers ON Classes.teacherID = Teachers.teacherID
GROUP BY Teachers.name
ORDER BY class_count DESC
LIMIT 1;

-- 23. Find the teacher who teaches the fewest classes.
SELECT Teachers.name AS teacher_name, COUNT(Classes.classID) AS class_count
FROM Classes
JOIN Teachers ON Classes.teacherID = Teachers.teacherID
GROUP BY Teachers.name
ORDER BY class_count ASC
LIMIT 1;

-- 24. Retrieve the details of all students who have enrolled in classes after a specific date.
SELECT Students.name AS student_name, Enrollments.enrollmentDate
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
WHERE Enrollments.enrollmentDate > '2024-06-01'; -- Replace with the specific date

-- 25. Find the total number of students enrolled in each subject.
SELECT Teachers.subject, COUNT(Enrollments.studentID) AS total_students
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
JOIN Teachers ON Classes.teacherID = Teachers.teacherID
GROUP BY Teachers.subject;

-- 26. List all teachers along with the subjects they teach.
SELECT name, subject FROM Teachers;

-- 27. Find all students enrolled in classes taught by a specific teacher.
SELECT Students.name AS student_name
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
JOIN Classes ON Enrollments.classID = Classes.classID
WHERE Classes.teacherID = 1; -- Replace 1 with the specific teacherID

-- 28. List all students who share the same address.
SELECT address, GROUP_CONCAT(name) AS students
FROM Students
GROUP BY address
HAVING COUNT(studentID) > 1;

-- 29. Find the total number of students from each address.
SELECT address, COUNT(studentID) AS total_students
FROM Students
GROUP BY address;

-- 30. List all teachers who share the same address.
SELECT address, GROUP_CONCAT(name) AS teachers
FROM Teachers
GROUP BY address
HAVING COUNT(teacherID) > 1;

-- 31. Find the total number of teachers from each address.
SELECT address, COUNT(teacherID) AS total_teachers
FROM Teachers
GROUP BY address;

-- 32. List all students along with their phone numbers and email addresses.
SELECT name, phone, email FROM Students;

-- 33. List all teachers along with their phone numbers and email addresses.
SELECT name, phone, email FROM Teachers;

-- 34. Find all students who have the same phone number.
SELECT phone, GROUP_CONCAT(name) AS students
FROM Students
GROUP BY phone
HAVING COUNT(studentID) > 1;

-- 35. Find all teachers who have the same phone number.
SELECT phone, GROUP_CONCAT(name) AS teachers
FROM Teachers
GROUP BY phone
HAVING COUNT(teacherID) > 1;

-- 36. List all students along with their enrollment dates.
SELECT Students.name, Enrollments.enrollmentDate
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID;

-- 37. List all teachers along with the classes they teach and the number of students in each class.
SELECT Teachers.name AS teacher_name, Classes.name AS class_name, COUNT(Enrollments.studentID) AS total_students
FROM Classes
JOIN Teachers ON Classes.teacherID = Teachers.teacherID
LEFT JOIN Enrollments ON Classes.classID = Enrollments.classID
GROUP BY Teachers.name, Classes.name;

-- 38. Find the average enrollment date for each class.
SELECT Classes.name AS class_name, AVG(DATEDIFF(enrollmentDate, '2024-01-01')) AS average_days_since_start
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name;

-- 39. Find the most recent enrollment date for each class.
SELECT Classes.name AS class_name, MAX(enrollmentDate) AS latest_enrollment
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name;

-- 40. Find the earliest enrollment date for each class.
SELECT Classes.name AS class_name, MIN(enrollmentDate) AS earliest_enrollment
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name;

-- 41. List all students who enrolled in a specific class within the last month.
SELECT Students.name AS student_name
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
WHERE Enrollments.classID = 1 -- Replace 1 with the specific classID
AND Enrollments.enrollmentDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 42. Find the total number of students enrolled in each class per month.
SELECT Classes.name AS class_name, DATE_FORMAT(Enrollments.enrollmentDate, '%Y-%m') AS month, COUNT(Enrollments.studentID) AS total_students
FROM Enrollments
JOIN Classes ON Enrollments.classID = Classes.classID
GROUP BY Classes.name, month;

-- 43. List all teachers who have been assigned to a new class within the last month.
SELECT Teachers.name AS teacher_name
FROM Classes
JOIN Teachers ON Classes.teacherID = Teachers.teacherID
WHERE Classes.classID IN (
    SELECT classID FROM Classes WHERE DATE_FORMAT(CURDATE(), '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')
);

-- 44. Find the total number of classes taught by each teacher per month.
SELECT Teachers.name AS teacher_name, DATE_FORMAT(Classes.classID, '%Y-%m') AS month, COUNT(Classes.classID) AS total_classes
FROM Classes
JOIN Teachers ON Classes.teacherID = Teachers.teacherID
GROUP BY Teachers.name, month;

-- 45. List all students along with the number of classes they are enrolled in.
SELECT Students.name AS student_name, COUNT(Enrollments.classID) AS class_count
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
GROUP BY Students.name;

-- 46. Find the student who is enrolled in the highest number of classes.
SELECT Students.name AS student_name, COUNT(Enrollments.classID) AS class_count
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
GROUP BY Students.name
ORDER BY class_count DESC
LIMIT 1;

-- 47. Find the student who is enrolled in the fewest number of classes.
SELECT Students.name AS student_name, COUNT(Enrollments.classID) AS class_count
FROM Enrollments
JOIN Students ON Enrollments.studentID = Students.studentID
GROUP BY Students.name
ORDER BY class_count ASC
LIMIT 1;

-- 48. List all classes along with the number of students and teachers for each class.
SELECT Classes.name AS class_name, COUNT(Enrollments.studentID) AS total_students, COUNT(DISTINCT Teachers.teacherID) AS total_teachers
FROM Classes
LEFT JOIN Enrollments ON Classes.classID = Enrollments.classID
LEFT JOIN Teachers ON Classes.teacherID = Teachers.teacherID
GROUP BY Classes.name;

-- 49. Find the average class size for each subject.
SELECT subject, AVG(student_count) AS average_class_size
FROM (
    SELECT Teachers.subject, COUNT(Enrollments.studentID) AS student_count
    FROM Enrollments
    JOIN Classes ON Enrollments.classID = Classes.classID
    JOIN Teachers ON Classes.teacherID = Teachers.teacherID
    GROUP BY Teachers.subject, Classes.classID
) AS class_sizes
GROUP BY subject;


-- 50. List all students and teachers who have the same email domain (e.g., '@example.com').
SELECT 'Student' AS type, name, email
FROM Students
WHERE email LIKE '%@example.com'
UNION
SELECT 'Teacher' AS type, name, email
FROM Teachers
WHERE email LIKE '%@example.com';
