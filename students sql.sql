
CREATE TABLE student_table (
Student_ID INT PRIMARY KEY,
First_name VARCHAR(50),
Last_name VARCHAR(50),
GPA DECIMAL(10,2),
Enrollment_Date datetime,
Major VARCHAR(50)
);
INSERT INTO student_table
VALUES("202","Shahanaj","Parvin",8.44,"2021-09-01 08:30:00","Mathematics"),
("203","Tahmina","Yeasmin",5.06,"2021-09-01 10:00:00","Biology"),
("204","Samia","Siddike",9.2,"2021-09-01 12:45:00","Chemistry"),
("205","Sanjida","Sumi",7.85,"2021-09-01 08:30:00","Physics"),
("206","Shirin","Shila",9.56,"2021-09-01 09:24:00","History"),
("207","Tasnia","Tasnim",9.78,"2021-09-01 02:30:00","English" ),
("208","Sirajam","Munira",7.00,"2021-09-01 06:30:00","Mathematics");
CREATE TABLE programme_table (
Student_ID int,
Programme_name VARCHAR(50),
Programme_start_date datetime
);
INSERT INTO programme_table
VALUES("201","CSE","2021-09-01 00:00:00"),
("202","Mathematics","2021-09-01 00:00:00"),
("208","Mathematics","2021-09-01 00:00:00"),
("205","Physics","2021-09-01 00:00:00"),
("204","Chemistry","2021-09-01 00:00:00"),
("207","Psychology","2021-09-01 00:00:00"),
("206","History","2021-09-01 00:00:00"),
("203","Biology","2021-09-01 00:00:00");
CREATE TABLE Scholarship_table (
Student_Ref_ID INT PRIMARY KEY,
Scholarship_amount int,
Scholarship_Date datetime
);
INSERT INTO scholarship_table
VALUES("201",5000,"2021-10-15 00:00:00"),
("202",4500,"2022-08-18 00:00:00"),
("203",3000,"2022-01-25 00:00:00"),
("204",4000,"2021-10-15 00:00:00");
SELECT DISTINCT Major FROM student_table;
SELECT DISTINCT Major FROM student_table;
SELECT SUBSTRING(First_name, 1,3) from student_table;
SELECT INSTR(LOWER(First_name),'a') FROM student_table WHERE First_name = 'Shahanaj';
SELECT DISTINCT Major, LENGTH(Major) FROM student_table;
SELECT REPLACE(First_name,'a','A')FROM student_table;
SELECT CONCAT(First_name,'',Last_name)AS COMPLETE_NAME FROM student_table;
SELECT * FROM student_table ORDER BY First_name , Major DESC;
SELECT * FROM student_table WHERE First_name IN ('Sanjida','Rifa');
SELECT * FROM student_table WHERE First_name NOT IN ('Rifa','Sanjida');
SELECT * FROM student_table WHERE First_name LIKE '%a';
SELECT * FROM student_table WHERE First_name LIKE'_____a';
SELECT * FROM student_table WHERE GPA BETWEEN 9.00 AND 9.99;
SELECT Major, COUNT(*) as TOTAL_COUNT FROM student_table WHERE Major ='CSE';
SELECT CONCAT(First_name,'',Last_name) AS FULL_NAME FROM student_table WHERE GPA BETWEEN 8.5 AND 9.5;
SELECT Major, COUNT(Major) FROM student_table group by Major order by COUNT(Major) DESC;
SELECT
student_table.First_name,
student_table.Last_name,
scholarship_table. Scholarship_amount,
scholarship_table.Scholarship_date
FROM student_table
INNER JOIN scholarship_table ON student_table.Student_ID=scholarship_table.Student_Ref_ID;
SELECT * FROM student_table WHERE Student_ID % 2 !=0;
SELECT * FROM student_table WHERE Student_ID % 2 =0;
SELECT student_table.First_name,student_table.Last_name,
scholarship_table.Scholarship_amount,
scholarship_table.Scholarship_Date FROM student_table LEFT JOIN
scholarship_table ON student_table.Student_ID=
scholarship_table.Student_Ref_ID;
SELECT * FROM student_table ORDER BY GPA DESC LIMIT 5;
SELECT * FROM student_table ORDER BY GPA DESC LIMIT 4, 1;
SELECT * FROM student_table s1
Where 4=
(SELECT COUNT(DISTINCT(s2.GPA))
FROM student_table s2
WHERE s2.GPA >=s1.GPA
);
SELECT s1. * FROM student_table s1, student_table s2 WHERE s1.GPA = s2.GPA AND s1.Student_ID !=s2.Student_ID;
SELECT MAX(GPA) FROM student_table WHERE GPA NOT IN(SELECT MAX(GPA) FROM student_table);
SELECT * FROM student_table
UNION ALL
SELECT * FROM student_table ORDER BY Student_ID;
SELECT Student_ID FROM student_table
WHERE Student_ID NOT IN (SELECT Student_Ref_ID FROM scholarship_table);
SELECT Major, COUNT(Major) AS Major_COUNT FROM student_table GROUP BY Major HAVING COUNT(Major) <4;
SELECT Major, COUNT(Major) AS ALL_Major FROM student_table GROUP BY Major;
SELECT * FROM student_table WHERE Student_ID = (select MAX(Student_ID) FROM student_table);
SELECT * FROM student_table WHERE Student_ID = (SELECT min(Student_ID) FROM student_table);
SELECT *
FROM (
SELECT *
FROM student_table
ORDER BY Student_ID DESC
LIMIT 5)
AS subquery
ORDER BY Student_ID;
SELECT DISTINCT GPA FROM student_table S1
WHERE 3>=(SELECT COUNT(DISTINCT GPA) FROM student_table S2 WHERE S1.GPA<=S2.GPA)
ORDER BY S1.GPA DESC;
SELECT DISTINCT GPA FROM student_table S1
WHERE 3 >=(SELECT COUNT(DISTINCT GPA) FROM student_table S2 WHERE S1.GPA >=S2.GPA)
ORDER BY S1.GPA;
SELECT DISTINCT GPA FROM student_table S1
WHERE 5=(SELECT COUNT(DISTINCT GPA)FROM student_table S2 WHERE S1.GPA <=S2.GPA)
ORDER BY S1.GPA DESC;
SELECT Major, MAX(GPA) AS MAXGPA FROM student_table GROUP BY Major;
SELECT First_name, GPA FROM student_table WHERE GPA=(SELECT MAX(GPA) FROM student_table);
SELECT CURDATE();
SELECT NOW();
CREATE TABLE CloneTable AS SELECT * FROM student_table;
SELECT Major, AVG(GPA) AS AVERAGE_GPA FROM student_table GROUP BY Major;
SELECT * FROM student_table ORDER BY GPA DESC LIMIT 3;
SELECT Major, COUNT(Student_ID) AS HIGH_GPA_COUNT
FROM student_table
WHERE GPA>7.5
GROUP BY Major;
SELECT * FROM student_table WHERE GPA=(SELECT GPA FROM student_table WHERE Student_ID = 201);

