-- Create Database (run separately if needed)
CREATE DATABASE srms;

-- =========================
-- USERS TABLE
-- =========================
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Insert default admin user
INSERT INTO users(username, password)
VALUES ('admin', 'admin123');

-- =========================
-- STUDENTS TABLE
-- =========================
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    course VARCHAR(50)
);

-- =========================
-- RESULTS TABLE
-- =========================
CREATE TABLE results(
    result_id SERIAL PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,

    CONSTRAINT fk_student
    FOREIGN KEY(student_id)
    REFERENCES students(student_id)
    ON DELETE CASCADE
);

-- =========================
-- SAMPLE DATA (OPTIONAL)
-- =========================

-- Insert sample students
INSERT INTO students(name, email, course)
VALUES
('Rahul', 'rahul@gmail.com', 'BCA'),
('Priya', 'priya@gmail.com', 'BBA');

-- Insert sample results
INSERT INTO results(student_id, subject, marks)
VALUES
(1, 'Mathematics', 85),
(1, 'Physics', 78),
(2, 'Mathematics', 90);