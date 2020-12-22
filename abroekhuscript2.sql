USE abroekhuassign2db;

SELECT * FROM university;
LOAD DATA LOCAL INFILE 'loaddatafall2020.txt' 
	INTO TABLE university
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n';
SELECT * FROM university;

SELECT * FROM uwo;
INSERT INTO uwo (courseNum, courseName, courseWeight, courseSuffix) VALUES
    ('cs1026', 'Computer Science Fundamentals I', 0.5, 'A/B'),
    ('cs1027', 'Computer Science Fundamentals II', 0.5, 'A/B'),
    ('cs2210', 'Algorithms and Data Structures', 1.0, 'A/B'),
    ('cs3319', 'Databases I', 0.5, 'A/B'),
    ('cs2120', 'Modern Survival Skills I: Coding Essentials', 0.5, 'A/B'),
    ('cs4490', 'Thesis', 0.5, 'Z'),
    ('cs0020', 'Intro to Coding using Pascal and Fortran', 1.0, ''),
    ('cs3337', 'Front-End Web Development', 0.5, 'A/B');
SELECT * FROM uwo;

INSERT INTO university (universityID, officialName, nickname, city, province) VALUES
    (15, "Hamilton University", "U of H", "Hamilton", "ON");

SELECT * FROM course;
INSERT INTO course (universityID, courseCode, courseName, courseYear, courseWeight) VALUES
    (2, 'CompSci022','Introduction to Programming', 1, 0.5),
    (2, 'CompSci033','Intro to Programming for Med students', 3, 0.5),
    (2, 'CompSci021','Packages', 1, 0.5),
    (2, 'CompSci222','Introduction to Databases', 2, 1.0),
    (2, 'CompSci023','Advanced Programming', 1, 0.5),
    (4, 'CompSci011','Intro to Computer Science', 2, 0.5),
    (4, 'CompSci123','Using UNIX', 2, 0.5),
    (66, 'CompSci021','Intro Programming', 1, 1.0),
    (66, 'CompSci022','Advanced Programming', 1, 0.5),
    (66, 'CompSci319','Using Databases', 3, 0.5),
    (55, 'CompSci333','Graphics', 3, 0.5),
    (55, 'CompSci444','Networks', 4, 0.5),
    (77, 'CompSci022','Using Packages', 1, 0.5),
    (77, 'CompSci101','Introduction to Using Data Structures', 2, 0.5),
    (15, 'CompSci345','Front-End Frameworks', 3, 0.5),
    (15, 'Compsci401','Artificial Intelligence II', 4, 0.5);
SELECT * FROM course;

SELECT * FROM equivalentCourses;
INSERT INTO equivalentCourses (universityID, uwoCourse, otherCourse, dateEnacted, approvalName) VALUES
    (2, 'cs1026', 'CompSci022','2015-05-12', 'Dr. El-Sakka'),
    (2, 'cs1026', 'CompSci033','2013-01-02', 'Dr. El-Sakka'),
    (4, 'cs1026', 'CompSci011','1997-02-09', 'Dr. El-Sakka'),
    (66, 'cs1026', 'CompSci021','2010-01-12', 'Dr. El-Sakka'),
    (2, 'cs1027', 'CompSci023','2017-06-22', 'Dr. El-Sakka'),
    (66, 'cs1027', 'CompSci022', '2019-09-01', 'Dr. El-Sakka'),
    (77, 'cs2210', 'CompSci101', '1998-07-12', 'Dr. El-Sakka'),
    (2, 'cs3319', 'CompSci222', '1990-09-13', 'Dr. El-Sakka'),
    (66, 'cs3319', 'CompSci319', '1987-09-21', 'Dr. El-Sakka'),
    (2, 'cs2120', 'CompSci022', '2018-12-10', 'Dr. El-Sakka'),
    (2, 'cs0020', 'CompSci022', '1999-09-17', 'Dr. El-Sakka');
SELECT * FROM equivalentCourses;
UPDATE equivalentCourses SET dateEnacted = '2018-09-19' WHERE uwoCourse = "cs0020";
SELECT * FROM equivalentCourses;

SELECT * FROM course;
UPDATE course SET courseYear = 1 WHERE courseName LIKE 'Intro%';
SELECT * FROM course;
