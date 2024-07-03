--  Create a stored procedure named GetStudentsInClass that takes a parameter class_id INT and retrieves the names of all students enrolled in the specified class.
-- Create the stored procedure
DELIMITER //

CREATE PROCEDURE GetStudentsInClass(IN class_id INT)
BEGIN
    SELECT Students.name AS student_name
    FROM Students
    JOIN Enrollments ON Students.studentID = Enrollments.studentID
    WHERE Enrollments.classID = class_id;
END //

DELIMITER ;

-- Call the stored procedure to retrieve students enrolled in Class ID 1
CALL GetStudentsInClass(1);
