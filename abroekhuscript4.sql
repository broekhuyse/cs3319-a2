/* CS3319 Assignment 2 | abroekhu | 250978523 */
USE abroekhuassign2db;

CREATE VIEW assignment4 AS
SELECT course.courseName AS OutsideCourse, officialName, nickname, city, uwo.courseName AS UWOCourse FROM course, university, uwo
WHERE EXISTS (SELECT * FROM equivalentCourses
WHERE uwo.courseNum = equivalentCourses.uwoCourse
AND course.courseName = equivalentCourses.otherCourse
AND university.universityID = equivalentCourses.universityID
AND university.universityID = course.universityID
AND course.courseYear = 1);

/* Display view */
SELECT * FROM assignment4;

/* Display UofT rows */
SELECT * FROM assignment4 WHERE nickname='UofT' ORDER BY uwoCourse;

/* Display universities */
SELECT * FROM university;

/* Delete universities */
DELETE FROM university WHERE nickname LIKE '%cord%';

/* Display universities */
SELECT * FROM university;

/* Try deleting university */
DELETE FROM university WHERE province = 'ON';

/* Not possible, all universities are in 'course' table */

SELECT * FROM university;

SELECT * FROM course, university 
    WHERE course.universityID = university.universityID;

/* Delete city of Waterloo courses */
DELETE FROM course WHERE EXISTS (
    SELECT * FROM university
    WHERE course.universityID = university.universityID
    AND university.city = 'Waterloo');

SELECT * FROM course, university WHERE course.universityID = university.universityID;

SELECT * FROM asssignment4;
