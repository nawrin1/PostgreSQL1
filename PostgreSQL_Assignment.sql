

CREATE TABLE students(
student_id INTEGER PRIMARY KEY,
student_name VARCHAR(30),
age INTEGER,
email VARCHAR(30),
frontend_mark INTEGER,
backend_mark INTEGER,
status VARCHAR(20)

);
--Create table query is used to create a table under a particular database, Here the term students refers to the name of the table and after that the name of the column that the table will hold along with their datatype and the constraints are mentioned




CREATE TABLE courses (
course_id INTEGER PRIMARY KEY,
course_name VARCHAR(30),
credits INTEGER
);
--Create table query is used to create a table under a particular database, Here the term courses refers to the name of the table and after that the name of the column that the table will hold along with their datatype and the constraints are mentioned





CREATE  TABLE enrollment(
enrollment_id INTEGER PRIMARY KEY,
student_id INTEGER REFERENCES "students"(student_id),
course_id INTEGER REFERENCES "courses" (course_id)
);
--Create table query is used to create a table under a particular database, Here the term enrollment refers to the name of the table and after that the name of the column that the table will hold along with their datatype , the constraints and the foreign key reference is mentioned





-- insert data to student table:
INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark, status)
VALUES
(1, 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
(2, 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
(3, 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
(4, 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
(5, 'Sophia', 22, 'sophia@example.com', 50, 52, NULL),
(6, 'Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);
--Insert into query is used to insert data into a table..here the term students is referring to the table named students and the column names are mentioned . Then the term VALUES are referring to the values which are being inserted into the table students.





--insert data into courses:
INSERT INTO courses (course_id, course_name, credits)
VALUES
(1, 'Next.js', 3),
(2, 'React.js', 4),
(3, 'Databases', 3),
(4, 'Prisma', 3);

--Insert into query is used to insert data into a table..here the term courses is referring to the table named courses and the column names are mentioned . Then the term VALUES are referring to the values which are being inserted into the table courses.
-- 




--insert data into enrollment:
INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 2);
--Insert into query is used to insert data into a table..here the term enrollment is referring to the table named enrollment and the column names are mentioned . Then the term VALUES are referring to the values which are being inserted into the table enrollment.






--query1:
INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark, status)
VALUES
(7, 'Nawrin', 22, 'jannatulnawrin@gmail.com', 54, 59, NULL);
--Insert INTO query is used to insert data into a table..here the term students is referring to the table named students and the column names are mentioned . Then the term VALUES are referring to the values which are being inserted into the table students.





--query-2:
SELECT student_name FROM students INNER JOIN enrollment ON students.student_id=enrollment.student_id INNER JOIN courses ON courses.course_id=enrollment.course_id WHERE course_name='Next.js';

--as both the student_id and course_id are present in the table enrollment..so INNER JOIN is used to create a connection in between them. WHERE clause is used to filter out the course named "next.js" and SELECT clause is used to filter out the name of the students




--query-3:
UPDATE students SET status='Awarded' WHERE student_id=
(SELECT student_id FROM (SELECT (frontend_mark+backend_mark) AS total_marks,student_id FROM students) 
WHERE total_marks=

(SELECT max(total_marks) FROM 
(SELECT (frontend_mark+backend_mark) AS total_marks,student_id FROM students))) ;

--after first the total marks is calculated of individual students from the student table. then the max total is filtered out using MAX aggregate function. Afther that the student_id who got that highest mark is filtered out using WHERE clause. Finally the status is updated to 'Awarded' using UPDATE and SET clause. After UPDATE the table name is written and after SET the column name is defined






--query-4:

DELETE FROM courses WHERE course_id IN
(SELECT course_id FROM 
(SELECT courses.course_id,enrollment.enrollment_id FROM courses LEFT JOIN enrollment ON courses.course_id=enrollment.course_id) WHERE enrollment_id IS NULL);
-- at first LEFT JOIN is used to create a connection priotizing the courses table wiht the enrollment table. As I have used left join, I got to see which courses have null enrollment. Now I filter out those course susing WHERE clause and IS NULL clause. After that DELETE operator is used to delete those courses.




--query-5:

SELECT student_name FROM students LIMIT 2 OFFSET 2;
-- SELECT opeartor is used to select the student_name, LIMIT is used only to see the value of two students and OFFSET 2 is used to start selecting studnets from serial 3 exclusing the first 2 student





--query-6:
SELECT course_name,count(*) AS students_enrolled  FROM courses INNER JOIN enrollment ON courses.course_id=enrollment.course_id GROUP BY course_name;

--INNER JOIN is use dto find the common connection between the enrollment and courses table. GROUP BY is used to make group by course_name, and finally count(*) is used to count the total number of students. Select is shown to select the count and course_name





--query-7:
SELECT round(avg(age),2) AS average_age FROM students;
-- avg is used to calculate the avegare age and round () is used to round up upto two decimal vales




--query-8:
SELECT student_name FROM students WHERE email LIKE '%example.com%'
-- SELECT is used to fetch the student_name and LIKE operator is used to select those student whose email contains 'example.com''
