-- create a view that lists all students along with their respective classes and teachers
CREATE VIEW StudentsClassesTeachers AS
SELECT 
    Students.name AS student_name,
    Classes.name AS class_name,
    Teachers.name AS teacher_name
FROM 
    Enrollments
JOIN 
    Students ON Enrollments.studentID = Students.studentID
JOIN 
    Classes ON Enrollments.classID = Classes.classID
JOIN 
    Teachers ON Classes.teacherID = Teachers.teacherID;

-- Query the view to produce output
SELECT * FROM StudentsClassesTeachers;
