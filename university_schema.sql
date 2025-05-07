
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(50),
    email VARCHAR(255),
    website VARCHAR(255),
    head_of_department VARCHAR(255)
);

CREATE TABLE degrees (
    id INT PRIMARY KEY,
    department_id INT,
    name VARCHAR(255),
    level VARCHAR(100),
    address VARCHAR(255),
    email VARCHAR(255),
    website VARCHAR(255),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE students (
    id INT PRIMARY KEY,
    degree_id INT,
    name VARCHAR(100),
    surname VARCHAR(100),
    date_of_birth DATE,
    fiscal_code VARCHAR(50),
    enrolment_date DATE,
    registration_number VARCHAR(50),
    email VARCHAR(255),
    FOREIGN KEY (degree_id) REFERENCES degrees(id)
);

CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    surname VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(255),
    office_address VARCHAR(255),
    office_number VARCHAR(20)
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    degree_id INT,
    name VARCHAR(255),
    description TEXT,
    period VARCHAR(50),
    year INT,
    cfu INT,
    website VARCHAR(255),
    FOREIGN KEY (degree_id) REFERENCES degrees(id)
);

CREATE TABLE exams (
    id INT PRIMARY KEY,
    course_id INT,
    date DATE,
    hour TIME,
    location VARCHAR(255),
    address VARCHAR(255),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE exam_results (
    student_id INT,
    exam_id INT,
    vote INT,
    PRIMARY KEY (student_id, exam_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (exam_id) REFERENCES exams(id)
);
