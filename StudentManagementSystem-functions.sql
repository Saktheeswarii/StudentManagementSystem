-- Function to Calculate Total Enrollments for a Specific Student
DELIMITER //

CREATE FUNCTION TotalEnrollmentsForStudent(student_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_enrollments INT;
    SELECT COUNT(*) INTO total_enrollments
    FROM Enrollments
    WHERE studentID = student_id;
    RETURN total_enrollments;
END //

DELIMITER ;

-- Usage
SELECT TotalEnrollmentsForStudent(1) AS total_enrollments;

-- Function to Calculate the Average Enrollment Date for a Specific Class
DELIMITER //

CREATE FUNCTION AverageEnrollmentDateForClass(class_id INT)
RETURNS DATE
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE avg_enrollment_date DATE;
    SELECT FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(enrollmentDate))) INTO avg_enrollment_date
    FROM Enrollments
    WHERE classID = class_id;
    RETURN avg_enrollment_date;
END //

DELIMITER ;

-- Usage
SELECT AverageEnrollmentDateForClass(1) AS avg_enrollment_date;
