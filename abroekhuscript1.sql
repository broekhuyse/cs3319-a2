SHOW DATABASES;
DROP DATABASE abroekhuassign2db;
CREATE DATABASE abroekhuassign2db;
USE abroekhuassign2db;
GRANT USAGE ON *.* TO 'ta'@'localhost';
DROP USER 'ta'@'localhost';
CREATE USER 'ta'@'localhost' IDENTIFIED BY 'cs3319';
GRANT ALL PRIVILEGES ON abroekhuassign2db.* TO 'ta'@'localhost';
FLUSH PRIVILEGES;

SHOW TABLES;
CREATE TABLE uwo (
    courseNum VARCHAR(6) NOT NULL,
    courseName VARCHAR(50) NOT NULL,
    courseWeight DECIMAL(2,1) NOT NULL,
    courseSuffix VARCHAR(4),
    PRIMARY KEY (courseNum)
);

CREATE TABLE university (
    universityID INT(2) NOT NULL,
    officialName VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province CHAR(2) NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    PRIMARY KEY (universityID)
);

CREATE TABLE course (
    courseCode VARCHAR(10) NOT NULL,
    courseName VARCHAR(50) NOT NULL,
    courseYear INT NOT NULL,
    courseWeight DECIMAL(2,1) NOT NULL,
    universityID INT(2) NOT NULL,
    PRIMARY KEY (courseCode, universityID),
    FOREIGN KEY (universityID)
        REFERENCES university(universityID)
        ON DELETE RESTRICT
);

CREATE TABLE equivalentCourses (
    uwoCourse VARCHAR(6) NOT NULL,
    otherCourse VARCHAR(10) NOT NULL,
    dateEnacted DATE NOT NULL,
    approvalName VARCHAR(30) NOT NULL,
    universityID INT(2) NOT NULL,
    PRIMARY KEY (uwoCourse, otherCourse, universityID),
    FOREIGN KEY (uwoCourse)
        REFERENCES uwo(courseNum)
        ON DELETE CASCADE,
    FOREIGN KEY (otherCourse)
        REFERENCES course(courseCode)
        ON DELETE CASCADE,
    FOREIGN KEY (universityID)
        REFERENCES course(universityID)
        ON DELETE CASCADE
);
SHOW TABLES;
