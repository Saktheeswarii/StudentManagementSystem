-- students table
CREATE TABLE Students (
    studentID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(40),
    class VARCHAR(50)
);

-- Teachers table
CREATE TABLE Teachers (
    teacherID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(40),
    subject VARCHAR(50)
);

-- classes table
CREATE TABLE Classes (
    classID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    teacherID INT,
    FOREIGN KEY (teacherID) REFERENCES Teachers(teacherID)
);

-- Enrollments Table
CREATE TABLE Enrollments (
    enrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    studentID INT,
    classID INT,
    enrollmentDate DATE,
    FOREIGN KEY (studentID) REFERENCES Students(studentID),
    FOREIGN KEY (classID) REFERENCES Classes(classID)
);

-- Insert Students
INSERT INTO Students (name, email, address, phone, class) VALUES
('Emily White', 'emily.white@example.com', '123 Elm Street', '555-1234', 'Math'),
('Michael Green', 'michael.green@example.com', '456 Oak Street', '555-5678', 'Science'),
('Alice Johnson', 'alice.johnson@example.com', '789 Pine Street', '555-9101', 'Math'),
('Bob Brown', 'bob.brown@example.com', '321 Maple Street', '555-1122', 'History'),
('Carol Black', 'carol.black@example.com', '654 Birch Street', '555-3344', 'Science'),
('David Miller', 'david.miller@example.com', '123 Elm Street', '555-1234', 'English'),
('Susan Davis', 'susan.davis@example.com', '456 Oak Street', '555-5678', 'Math'),
('James Wilson', 'james.wilson@example.com', '789 Pine Street', '555-9101', 'Science'),
('Mary Clark', 'mary.clark@example.com', '321 Maple Street', '555-1122', 'History'),
('John Lewis', 'john.lewis@example.com', '654 Birch Street', '555-3344', 'English');

-- Insert Teachers
INSERT INTO Teachers (name, email, address, phone, subject) VALUES
('Dr. Smith', 'smith@example.com', '123 Elm Street', '555-1234', 'Math'),
('Dr. Brown', 'brown@example.com', '456 Oak Street', '555-5678', 'Science'),
('Dr. White', 'white@example.com', '789 Pine Street', '555-9101', 'History'),
('Dr. Green', 'green@example.com', '321 Maple Street', '555-1122', 'English'),
('Dr. Black', 'black@example.com', '654 Birch Street', '555-3344', 'Math'),
('Dr. Miller', 'miller@example.com', '123 Elm Street', '555-1234', 'Science'),
('Dr. Davis', 'davis@example.com', '456 Oak Street', '555-5678', 'History'),
('Dr. Wilson', 'wilson@example.com', '789 Pine Street', '555-9101', 'English');

-- Insert Classes
INSERT INTO Classes (name, teacherID) VALUES
('Math 101', 1),
('Science 101', 2),
('History 101', 3),
('English 101', 4),
('Math 102', 5),
('Science 102', 6),
('History 102', 7),
('English 102', 8);

-- Insert Enrollments
INSERT INTO Enrollments (studentID, classID, enrollmentDate) VALUES
(1, 1, '2024-06-01'),
(2, 2, '2024-06-01'),
(3, 1, '2024-06-02'),
(4, 3, '2024-06-03'),
(5, 2, '2024-06-04'),
(6, 4, '2024-06-05'),
(7, 1, '2024-06-06'),
(8, 2, '2024-06-07'),
(9, 3, '2024-06-08'),
(10, 4, '2024-06-09'),
(1, 5, '2024-06-10'),
(2, 6, '2024-06-11'),
(3, 7, '2024-06-12'),
(4, 8, '2024-06-13'),
(5, 5, '2024-06-14'),
(6, 6, '2024-06-15'),
(7, 7, '2024-06-16'),
(8, 8, '2024-06-17'),
(9, 5, '2024-06-18'),
(10, 6, '2024-06-19');

