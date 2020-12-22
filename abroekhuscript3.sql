USE abroekhuassign2db;

/* Query #1 */
SELECT courseName FROM uwo;
/* Query #2 */
SELECT DISTINCT courseCode FROM course;
/* Query #3 */
SELECT * FROM uwo ORDER BY courseName ASC;
/* Query #4 */
SELECT courseNum, courseName FROM uwo WHERE courseWeight = 0.5;
/* Query #5 */
SELECT courseCode, courseName FROM course
    WHERE universityID in (
        SELECT universityID FROM university
        WHERE officialName = 'University Of Toronto'
    );
/* Query #6 */
SELECT course.courseName, university.nickname FROM course
    INNER JOIN university ON course.universityID = university.universityID
    WHERE course.courseName LIKE '%Introduction%';
/* Query #7 */
SELECT equivalentCourses.otherCourse, university.officialName, equivalentCourses.uwoCourse, equivalentCourses.dateEnacted FROM equivalentCourses
    INNER JOIN university ON university.universityID = equivalentCourses.universityID
    WHERE equivalentCourses.dateEnacted <= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
    ORDER BY equivalentCourses.dateEnacted ASC;
/* Query #8 */
SELECT equivalentCourses.otherCourse, university.nickname FROM equivalentCourses
    INNER JOIN university ON equivalentCourses.universityID = university.universityID
    WHERE equivalentCourses.uwoCourse = 'cs1026';
/* Query #9 */
SELECT COUNT(uwoCourse) FROM equivalentCourses WHERE uwoCourse = 'cs1026';
/* Query #10 */
SELECT uwo.courseName, course.courseName, university.nickname FROM uwo
    INNER JOIN equivalentCourses ON equivalentCourses.uwoCourse = uwo.courseNum
    INNER JOIN course ON equivalentCourses.otherCourse = course.courseCode
    INNER JOIN university ON university.universityID = equivalentCourses.universityID
    WHERE university.city = 'Waterloo'
    AND university.province = 'ON';
/* Query #11 */
SELECT officialName FROM university WHERE universityID NOT IN
    (SELECT universityID from equivalentCourses);
/* Query #12 */
SELECT uwo.courseName, uwo.courseNum FROM uwo
    INNER JOIN equivalentCourses ON uwo.courseNum = equivalentCourses.uwoCourse
    INNER JOIN course ON equivalentCourses.otherCourse = course.courseCode
    WHERE course.courseYear = 3 OR course.courseYear = 4;
/* Query #13 */
SELECT uwo.courseName FROM uwo
    INNER JOIN equivalentCourses ON uwo.courseNum = equivalentCourses.uwoCourse
    GROUP BY equivalentCourses.uwoCourse
    HAVING COUNT(equivalentCourses.uwoCourse) > 1;
/* Query #14 */
SELECT uwo.courseNum AS WesternCourseNumber,
    uwo.courseName AS WesternCourseName,
    uwo.courseWeight AS CourseWeight,
    course.courseName AS OtherUniversityCourseName,
    course.courseWeight AS OtherCourseWeight,
    university.officialName AS UniversityName FROM uwo, course, university
    WHERE EXISTS (SELECT * FROM equivalentCourses
    WHERE equivalentCourses.uwoCourse = uwo.courseNum
    AND course.universityID = university.universityID
    AND course.courseCode = equivalentCourses.otherCourse
    AND course.universityID = equivalentCourses.universityID
    AND course.courseWeight <> uwo.courseWeight);
