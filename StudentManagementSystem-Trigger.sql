-- Create a trigger that automatically updates the enrollmentDate to the current date when a new enrollment is inserted into the Enrollments table.
DELIMITER //

CREATE TRIGGER BeforeInsertEnrollment
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    SET NEW.enrollmentDate = CURDATE();
END //

DELIMITER ;

-- Insert a new enrollment without specifying the enrollmentDate
INSERT INTO Enrollments (studentID, classID) VALUES (1, 2);

-- Verify the insertion
SELECT * FROM Enrollments WHERE studentID = 1 AND classID = 2;
