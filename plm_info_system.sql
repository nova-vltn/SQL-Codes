-- COLLEGE table
CREATE TABLE college (
      college_code VARCHAR2(10) NOT NULL
    , description VARCHAR2(50) DEFAULT ' '
    , status VARCHAR(1) DEFAULT 'A'
    , CONSTRAINT college PRIMARY KEY (college_code)
    );
SAVEPOINT B;
-- COURSE table
CREATE TABLE course (
      course_code  VARCHAR(10) NOT NULL
    , description  VARCHAR(50) DEFAULT ' '
    , status       VARCHAR(1)  DEFAULT 'A'
    , college_code VARCHAR(10)
    , CONSTRAINT course_code_pk PRIMARY KEY (course_code)
    , CONSTRAINT college_code_fk FOREIGN KEY (college_code)
    REFERENCES college(college_code)    
    );
SAVEPOINT C;
-- FACULTY table
CREATE TABLE FACULTY (
      faculty_no    VARCHAR(11) NOT NULL
    , lastname      VARCHAR(50) DEFAULT ' '
    , firstname     VARCHAR(50)
    , address       VARCHAR(50)
    , email_address VARCHAR(50)
    , gender        VARCHAR(1) DEFAULT 'M'
    , birthday      VARCHAR(30)
    , college_code  VARCHAR(10)
    , status        VARCHAR(1) DEFAULT 'A'
    , CONSTRAINT faculty_no_pk PRIMARY KEY(faculty_no)
    , CONSTRAINT college_code_fk FOREIGN KEY (college_code)REFERENCES college(college_code)   
    );
SAVEPOINT D;
-- SUBJECT table
CREATE TABLE SUBJECT (
      subject_code    VARCHAR(10) NOT NULL
    , description     VARCHAR(50) DEFAULT ''
    , units           VARCHAR(10) NOT NULL
    , lec_lab         VARCHAR(10)
    , college_code    VARCHAR(10)
    , status          VARCHAR(1) DEFAULT 'A'
    , CONSTRAINT subject_code_pk PRIMARY KEY (subject_code)
    , CONSTRAINT college_code_fk FOREIGN KEY (college_code)REFERENCES college(college_code)   
    );
SAVEPOINT E;
-- STUDENT table
CREATE TABLE student (
    student_no     VARCHAR(11) NOT NULL
    , lastname      VARCHAR(50) DEFAULT ' '
    , firstname     VARCHAR(50)
    , address       VARCHAR(50)
    , email_address VARCHAR(50)
    , gender        VARCHAR(1) DEFAULT 'M'
    , birthday      VARCHAR(30)
    , course_code   VARCHAR(10)
    , status        VARCHAR(1) DEFAULT 'A'
    , cellno        VARCHAR(11) DEFAULT ' '
    , cellno1       VARCHAR(11)
    , CONSTRAINT student_no_pk PRIMARY KEY (student_no)
    , CONSTRAINT course_code_fk FOREIGN KEY (course_code)REFERENCES course(course_code)
    );
SAVEPOINT F;

--Add a new column (status) in SUBJECT table
ALTER TABLE subject
    ADD status VARCHAR(1);

--Delete the column cellno1 in STUDENT table
ALTER TABLE student
    DROP COLUMN cellno1;
SAVEPOINT G;

--Change the column width of lastname and firstname to 200 characters.
ALTER TABLE student MODIFY (
      lastname VARCHAR(200)
    , firstname VARCHAR(200)
    ); 
ALTER TABLE faculty MODIFY (
        lastname VARCHAR(200)
      , firstname VARCHAR(200)
      );
SAVEPOINT H;


--C.DML

--1. Insert at least 20 records in STUDENT table.
INSERT INTO student VALUES ('2024-0001', 'Maximoff', 'Wanda', 'Westview', 'wandamaximoff@avengers.com', 'F', 'October 2, 1990', 'BSCS', 'A', '09171234567');
INSERT INTO student VALUES ('2024-0002', 'Odinson', 'Thor', 'New York', 'thorodinson@avengers.com', 'M', 'August 11, 1964', 'BSCS', 'A', '09181234567');
INSERT INTO student VALUES ('2024-0003', 'Danvers', 'Carol', ' Cosmic Ave ', 'caroldanvers@avengers.com', 'F', 'May 29, 1966', 'BSIT', 'A', '09191234567');
INSERT INTO student VALUES ('2024-0004', 'Strange', 'Stephen', 'New York', 'stephenstrange@avengers.com', 'M', 'November 18, 1976', 'BSIT', 'A', '09201234567');
INSERT INTO student VALUES ('2024-0005', 'Stark', 'Tony', 'California', 'tonystark@avengers.com', 'M', 'May 29, 1970', 'BSIT', 'D', '09211234567');
INSERT INTO student VALUES ('2024-0006', 'Banner', 'Bruce', 'New York', 'brucebanner@avengers.com', 'M', 'December 18, 1969', 'BSIT', 'A', '09221234567');
INSERT INTO student VALUES ('2024-0007', 'T\Challa', 'Wakanda', 'Wakanda', 'tchalla@avengers.com', 'M', 'November 21, 1980', 'BSIT', 'D', '09231234567');
INSERT INTO student VALUES ('2024-0008', 'Vision', 'Super', 'Earth', 'vision@avengers.com', 'M', 'August 23, 2015', 'BSCS', 'D', '09241234567');
INSERT INTO student VALUES ('2024-0009', 'Parker', 'Peter', 'Queens', 'peterparker@avengers.com', 'M', 'August 10, 2001', 'BSIT', 'A', '09251234567');
INSERT INTO student VALUES ('2024-0010', 'Romanoff', 'Natasha', 'Moscow', 'natasharomanoff@avengers.com', 'F', 'November 22, 1984', 'BSN', 'D', '09261234567');
INSERT INTO student VALUES ('2024-0011', 'Wilson', 'Sam', 'Louisiana', 'samwilson@avengers.com', 'M', 'April 13, 1978', 'BSCS', 'A', '09271234567');
INSERT INTO student VALUES ('2024-0012', 'Barnes', 'Bucky', 'New York', 'buckybarnes@avengers.com', 'M', 'March 10, 1917', 'BSCS', 'A', '09281234567');
INSERT INTO student VALUES ('2024-0013', 'Barton', 'Clint', 'Iowa', 'clintbarton@avengers.com', 'M', 'June 18, 1971', 'BSCS', 'A', '09291234567');
INSERT INTO student VALUES ('2024-0014', 'Lang', 'Scott', 'San Francisco', 'scottlang@avengers.com', 'M', 'April 6, 1969', 'BSIT', 'A', '09301234567');
INSERT INTO student VALUES ('2024-0015', 'Van Dyne', 'Hope', 'San Francisco', 'hopevandyne@avengers.com', 'F', 'July 17, 1978', 'BSCS', 'A', '09311234567');
INSERT INTO student VALUES ('2024-0016', 'Shuri', 'Wakanda', 'Wakanda', 'shuri@avengers.com', 'F', 'October 10, 1998', 'BSCS', 'A', '09321234567');
INSERT INTO student VALUES ('2024-0017', 'Rhodes', 'James', 'Washington D.C.', 'jamesrhodes@avengers.com', 'M', 'October 6, 1968', 'BSIT', 'A', '09331234567');
INSERT INTO student VALUES ('2024-0018', 'Groot', 'Groot', 'Planet X', 'groot@avengers.com', 'G', 'June 15, 2000', 'BSN', 'A', '09341234567');
INSERT INTO student VALUES ('2024-0019', 'Raccoon', 'Rocket', 'Knowhere', 'rocketraccoon@avengers.com', 'G', 'September 12, 1989', 'BSIT', 'A', '09351234567');
INSERT INTO student VALUES ('2024-0020', 'Valkyrie', 'Warrior', 'New Asgard', 'valkyrie@avengers.com', 'F', 'May 30, 1970', 'BSN', 'A', '09361234567');
SAVEPOINT O;

--2. Insert all the courses in PLM to COURSE table.
INSERT INTO course VALUES ('BS ARCH', 'Bachelor of Science in Architecture', 'Y', 'CAUP');
INSERT INTO course VALUES ('BS ACCIG', 'Bachelor of Science in Accountancy', 'Y', 'CBGM');
INSERT INTO course VALUES ('BSBA', 'Bachelor of Science in Business Administration', 'Y', 'CBGM');
INSERT INTO course VALUES ('BS BE', 'Bachelor of Science in Business Economics', 'Y', 'CBGM');
INSERT INTO course VALUES ('BS ENTRE', 'Bachelor of Science in Entrepreneurship', 'Y', 'CBGM');
INSERT INTO course VALUES ('BSHM', 'Bachelor of Science in Hospitality Management', 'Y', 'CBGM');
INSERT INTO course VALUES ('BSTM', 'Bachelor of Science in Tourism Management', 'Y', 'CBGM');
INSERT INTO course VALUES ('BREM', 'Bachelor in Real Estate Management', 'Y', 'CBGM');
INSERT INTO course VALUES ('BEEd', 'Bachelor of Elementary Education', 'Y', 'CEd');
INSERT INTO course VALUES ('BPE', 'Bachelor of Physical Education', 'Y', 'CEd');
INSERT INTO course VALUES ('BSCHE', 'Bachelor of Science in Chemical Engineering', 'A', 'CET');
INSERT INTO course VALUES ('BSCE', 'Bachelor of Science in Civil Engineering', 'A', 'CET');
INSERT INTO course VALUES ('BS CpE', 'Bachelor of Science in Computer Engineering', 'A', 'CET');
INSERT INTO course VALUES ('BSEE', 'Bachelor of Science in Electrical Engineering', 'A', 'CET');
INSERT INTO course VALUES ('BS ECE', 'Bachelor of Science in Electronics Engineering', 'A', 'CET');
INSERT INTO course VALUES ('BSMEGE', 'Bachelor of Science in Manufacturing Engineering', 'A', 'CET');
INSERT INTO course VALUES ('BSME', 'Bachelor of Science in Mechanical Engineering', 'A', 'CET');
INSERT INTO course VALUES ('BAC', 'Bachelor of Arts in Communication', 'A', 'CHASS');
INSERT INTO course VALUES ('BS SW', 'Bachelor of Science in Social Work', 'A', 'CHASS');
INSERT INTO course VALUES ('BSCS', 'Bachelor of Science in Computer Science', 'A', 'CISTM');
INSERT INTO course VALUES ('BSIT', 'Bachelor of Science in Information Technology', 'A', 'CISTM');
INSERT INTO course VALUES ('BSN', 'Bachelor of Science in Nursing', 'A', 'CN');
INSERT INTO course VALUES ('BSPT', 'Bachelor of Science in Physical Therapy', 'A', 'CPT');
INSERT INTO course VALUES ('BS Bio', 'Bachelor of Science in Biology', 'A', 'CS');
INSERT INTO course VALUES ('BS Chem', 'Bachelor of Science in Chemistry', 'A', 'CS');
INSERT INTO course VALUES ('BS Math', 'Bachelor of Science in Mathematics', 'A', 'CS');
INSERT INTO course VALUES ('BS PSY', 'Bachelor of Science in Psychology', 'A', 'CS');
SAVEPOINT J;


--3. Insert all the colleges in PLM to COLLEGE table.
INSERT INTO college VALUES ('CAUP', 'College of Architecture and Urban Planning', 'A');
INSERT INTO college VALUES ('CBGM', 'College of Business and Government Management', 'A');
INSERT INTO college VALUES ('CEd', 'College of Education', 'A');
INSERT INTO college VALUES ('CET', 'College of Engineering and Technology', 'A');
INSERT INTO college VALUES ('CISTM', 'College of Information Systems and Technology Management', 'A');
INSERT INTO college VALUES ('CHASS', 'College of Humanities, Arts and Social Sciences', 'A');
INSERT INTO college VALUES ('CN', 'College of Nursing', 'A');
INSERT INTO college VALUES ('CPT', 'College of Physical Therapy', 'A');
INSERT INTO college VALUES ('CS', 'College of Science', 'A');
SAVEPOINT I;

--4. Insert at least 5 teachers in PLM to FACULTY table.
INSERT INTO faculty VALUES ('2023-0001', 'Agustin', 'Prof. Vivien','Manila', 'vivienagustin@plm.edu.ph','F','January 14','CISTM','A');
INSERT INTO faculty VALUES ('2023-0002', 'Dioses', 'Prof. Raymund','Manila', 'raymunddioses@plm.edu.ph','M','February 14','CISTM','A');
INSERT INTO faculty VALUES ('2023-0003', 'Regala ', 'Prof. Richard','Manila', 'richardregala@plm.edu.ph','M','March 14','CISTM','A');
INSERT INTO faculty VALUES ('2023-0004', 'Blanco', 'Prof. Mark','Manila', 'markblanco@plm.edu.ph','M','April 14','CET','A');
INSERT INTO faculty VALUES ('2023-0005', 'Pascual', 'Engr. Elsa','Manila', 'elsapascual@plm.edu.ph','F','May 14','CISTM','A');
SAVEPOINT J;
INSERT INTO faculty VALUES ('2023-0006', 'Gonzales', 'Prof. Robert', 'Taguig', 'robertgonzales@plm.edu.ph', 'M', 'June 10', 'CISTM', 'B');
INSERT INTO faculty VALUES ('2023-0007', 'Santos', 'Dr. Jane', 'Las Piñas', 'janesantos@plm.edu.ph', 'F', 'August 19', 'CISTM', 'A');
INSERT INTO faculty VALUES ('2023-0008', 'Reyes', 'Engr. Paul', 'Parañaque', 'paulreyes@plm.edu.ph', 'M', 'November 1', 'CISTM', 'B');
INSERT INTO faculty VALUES ('2023-0009', 'López', 'Ms. Sophia', 'Makati', 'sophialopez@plm.edu.ph', 'F', 'December 12', 'CISTM', 'A');
INSERT INTO faculty VALUES ('2023-0010', 'Morales', 'Prof. Kevin', 'Manila', 'kevinmorales@plm.edu.ph', 'M', 'January 6', 'CISTM', 'B');
INSERT INTO faculty VALUES ('2023-0011', 'Ferrer', 'Dr. Diana', 'Quezon City', 'dianaferrer@plm.edu.ph', 'F', 'February 15', 'CISTM', 'A');
INSERT INTO faculty VALUES ('2023-0012', 'Martinez', 'Engr. Carlos', 'Mandaluyong', 'carlosmartinez@plm.edu.ph', 'M', 'March 23', 'CISTM', 'B');
INSERT INTO faculty VALUES ('2023-0013', 'Angeles', 'Prof. Grace', 'Antipolo', 'graceangeles@plm.edu.ph', 'F', 'April 30', 'CISTM', 'A');
INSERT INTO faculty VALUES ('2023-0014', 'Sison', 'Ms. Emma', 'San Juan', 'emma.sison@plm.edu.ph', 'F', 'May 5', 'CISTM', 'B');
INSERT INTO faculty VALUES ('2023-0015', 'Bacani', 'Engr. Leo', 'Cavite', 'leobacani@plm.edu.ph', 'M', 'June 15', 'CISTM', 'A');
INSERT INTO faculty VALUES ('2023-0016', 'Villar', 'Prof. Iris', 'Quezon City', 'irisvillar@plm.edu.ph', 'F', 'July 20', 'CISTM', 'B');
INSERT INTO faculty VALUES ('2023-0017', 'Tiu', 'Dr. Samuel', 'Makati', 'samueltiu@plm.edu.ph', 'M', 'August 8', 'CISTM', 'A');
INSERT INTO faculty VALUES ('2023-0018', 'Lim', 'Ms. Julia', 'Pasay', 'julialim@plm.edu.ph', 'F', 'September 9', 'CISTM', 'B');
INSERT INTO faculty VALUES ('2023-0019', 'Tan', 'Engr. Alan', 'Manila', 'alan.tan@plm.edu.ph', 'M', 'October 11', 'CISTM', 'A');
INSERT INTO faculty VALUES ('2023-0020', 'Bermudez', 'Prof. Rachel', 'Cebu', 'rachelbermudez@plm.edu.ph', 'F', 'November 20', 'CISTM', 'B');

--5. Insert all your subjects from 1st year to 2nd year to SUBJECT table.
--First Year, First Semester
INSERT INTO subject VALUES ('ICC 0101', 'Introduction to Computing', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0101.1', 'Introduction to Computing', '1','lab', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0102', ' Fundamentals of Programming', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0102.1', 'Fundamentals of Programming', '1','lab', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0102', 'Discrete Structure 1', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('STS 0002', 'Science, Technology and Society', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('MMW 0001', 'Mathematics in the Modern World', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('PCM 0006', 'Purposive Communications', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('FIL 0010', 'Interdisiplinaryong Pagbasa at Pagsulat sa mga Diskurso ng Pagpapahayag', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('PATHFIT 1', 'Foundation of Physical Activities', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('NSTP 1', ' National Service Training Program -CTWS 1', '3','lec', 'CISTM','A');
SAVEPOINT K;

--First Year, Second Semester
INSERT INTO subject VALUES ('ICC 0103', 'Intermediate Programming', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0103.1', 'Intermediate Programming ', '1','lab', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0104', 'Data Structures and Algorithms', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0104.1', 'Data Structures and Algorithms', '1','lab', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0211', 'Discrete Structure 2', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0223', 'Human Computer Interaction', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('TCW 0005', 'The Contemporary World', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('RPH 0004', 'Readings in Philippine History', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('LWR 0009', ' Life and Works of Rizal', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('PATHFIT 2', ' PE Elective', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('NSTP 2', ' National Service Training Program -CTWS 2', '3','lec', 'CISTM','A');
SAVEPOINT L;

--Second Year, First Semester
INSERT INTO subject VALUES ('CSC 0213', 'Logic Design and Digital Computer Circuits', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0213.1', 'Logic Design and Digital Computer Circuits', '1','lab', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0212', 'Object Oriented Programming', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0212.1', ' Object Oriented Programming', '1','lab', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0224', 'Operation Research', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0105', ' Information Management', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0105.1', 'Information Management ', '1','lab', 'CISTM','A');
INSERT INTO subject VALUES ('ITE 0001', 'Living in the IT Era', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('ETH 0008', ' Ethics', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('UTS 0003', ' Understanding the Self', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('PATHFIT 3', '  PE Elective', '2','lec', 'CISTM','A');
SAVEPOINT M;

--Second Year, Second Semester
INSERT INTO subject VALUES ('CSC 0221', ' Algorithm and Complexity', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0222', 'Architecture and Organization', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0222.1', 'Architecture and Organization  ', '1','lab', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0106', 'Applications Develpment and Emerging Technologies', '2','lec', 'CISTM','A');
INSERT INTO subject VALUES ('ICC 0106.1', 'Applications Develpment and Emerging Technologies ', '1','lab', 'CISTM','A');
INSERT INTO subject VALUES ('CSC 0316', ' Information Assurance Security', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('CBM 0016', 'The Entrepreneural Mind ', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('GES 0013', 'Environmental Science', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('AAP 0007', ' Art Appreciation', '3','lec', 'CISTM','A');
INSERT INTO subject VALUES ('PATHFIT 4', '  PE Elective', '2','lec', 'CISTM','A');
SAVEPOINT N;

--6. Update all status of table FACULTY from 'A' to 'Y' if college_code = 'CET'
UPDATE faculty
SET status = 'Y'
WHERE college_code = 'CET';
SAVEPOINT P;

--7. Update all status of table course from 'A' to 'Y' if course_code = 'BSN' or course_code = 'BSCoE'
UPDATE course
SET status = 'Y'
WHERE course_code = 'BSN';

UPDATE course
SET status = 'Y'
WHERE course_code = 'BSCoE';

SAVEPOINT S;
SAVEPOINT U;

--8. Delete all records of table COURSE whose status is no equal to 'A'
--CREATE TABLE course_backup AS
--SELECT * FROM course;

DELETE FROM course
WHERE status <> 'A';

--9. Delete all records of table STUDENT whose gender is not 'M' or 'F'
--CREATE TABLE student_backup AS
--SELECT * FROM student;

DELETE FROM student
WHERE gender NOT IN ('M', 'F');
SAVEPOINT T;

--10. commit all the changes
COMMIT;

--D. Other requirements

--1. Allow the user francis, jose, maria and josefa to view (SELECT) the table STUDENT from PLM_INFO_SYSTEM user.
GRANT SELECT ON student TO francis, jose, maria, josefa;

--2. Allow the user francis and jose to view (SELECT) the tables COURSE and COLLEGE from PLM_INFO_SYSTEM user.
GRANT SELECT ON COURSE TO francis, jose;
GRANT SELECT ON COLLEGE TO francis, jose;

--3. Allow the user maria and josefa to view (SELECT) the tables FACULTY and SUBJECT from PLM_INFO_SYSTEM user.
GRANT SELECT ON FACULTY TO maria, josefa;
GRANT SELECT ON SUBJECT TO maria, josefa;

--4. Allow the user francis and jose to make an insert, update and delete any record in STUDENT table from PLM_INFO_SYSTEM user.
GRANT INSERT, UPDATE, DELETE ON STUDENT TO francis, jose;


--OCTOBER 19, 2024--
--SCHEDULE and GRADE Table--
CREATE TABLE schedule (
    sy 		        VARCHAR(10)           NOT NULL
  , semester	    VARCHAR(3)  	        NOT NULL
	, block_no      VARCHAR(10)           NOT NULL
	, room		      VARCHAR(15)	          DEFAULT ' '
	, time 	 	      VARCHAR(20)           DEFAULT ' '
	, day		        VARCHAR(10)	          DEFAULT ' '
	, faculty_no    VARCHAR(11)           NOT NULL
  , subject_code  VARCHAR(10)           NOT NULL
	, CONSTRAINT    faculty_no_fk         FOREIGN KEY(faculty_no)   REFERENCES faculty(faculty_no)
	, CONSTRAINT    subject_code_fk       FOREIGN KEY(subject_code) REFERENCES subject(subject_code)
  , CONSTRAINT    comp_key_pk           PRIMARY KEY(sy,semester,subject_code,block_no)
    );


--SCHEDULE DATA--
INSERT INTO schedule VALUES('2024-2025','1st','CS21','COMP3','1:00PM-4:00PM','M','2023-0001','CSC 0212');
INSERT INTO schedule VALUES('2024-2025','1st','CS21','COMP3','4:00PM-6:00PM','M','2023-0002','CSC 0212.1');
INSERT INTO schedule VALUES('2024-2025','1st','CS21','GL 503','8:30AM-10:00AM','M','2023-0003','CSC 0224');
INSERT INTO schedule VALUES('2024-2025','1st','CS21','GCA 309','10:00PM-11:30PM','M','2023-0002','ETH 0008');
INSERT INTO schedule VALUES('2024-2025','1st','CS21','COMP3','1:00PM-4:00PM','Th','2023-0003','CSC 0213');
INSERT INTO schedule VALUES('2024-2025','1st','CS21','COMP3','4:00PM-6:00PM','Th','2023-0003','CSC 0213.1');
INSERT INTO schedule VALUES('2024-2025','1st','CS21','COMP2','3:00PM-6:00PM','F','2023-0004','ICC 0105');
INSERT INTO schedule VALUES('2024-2025','1st','CS21','COMP4','6:00PM-8:00PM','F','2023-0004','ICC 0105.1');
INSERT INTO schedule VALUES('2024-2025','1st','CS21','GV 307','4:00PM-6:00PM','S','2023-0001','ITE 0001');
INSERT INTO schedule VALUES('2024-2025','1st','CS21','GCA 309','8:00PM-11:00PM','S','2023-0005','UTS 0003');
  
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','CSC 0213','9:00AM-12:00PM','M','2023-0006','ICC 0101');
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','CSC 0212','1:00PM-3:00PM','M','2023-0007','CSC 0102');
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','ICC 0105','10:00AM-11:30AM','T','2023-0008','STS 0002');
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','ETH 0008','2:00PM-4:00PM','T','2023-0009','MMW 0001');
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','CSC 0213.1','9:00AM-12:00PM','W','2023-0006','PCM 0006');
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','CSC 0212.1','1:00PM-3:00PM','W','2023-0007','FIL 0010');
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','GCA 310','3:00PM-6:00PM','Th','2023-0010','PATHFIT 1');
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','GCA 310','6:00PM-8:00PM','Th','2023-0011','NSTP 1');
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','GV 308','4:00PM-6:00PM','F','2023-0006','ICC 0103');
INSERT INTO schedule VALUES('2024-2025','2nd','CS22','UTS 0003','8:00PM-11:00PM','S','2023-0012','ICC 0104');


CREATE TABLE grade (
    sy              VARCHAR(10)          NOT NULL,
    semester        VARCHAR(3)           NOT NULL,
    subject_code    VARCHAR(15)          NOT NULL,
    student_no      VARCHAR(10)          NOT NULL,
    grade           DECIMAL(5,2)         DEFAULT 0.00,
    block_no        VARCHAR(10)          NOT NULL,
    CONSTRAINT      fk_subject_code      FOREIGN KEY(subject_code) REFERENCES subject(subject_code),
    CONSTRAINT      fk_student_no        FOREIGN KEY(student_no)   REFERENCES student(student_no),
    CONSTRAINT      pk_grade             PRIMARY KEY(sy, semester, subject_code, student_no, block_no)  -- composite key
);


---GRADE DATA---
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212','2024-0001',3.00,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212','2024-0002',2.00,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212','2024-0003',1.75,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212','2024-0004',2.25,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212','2024-0005',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212','2024-0006',2.50,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212','2024-0007',2.00,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212','2024-0008',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212','2024-0009',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212.1','2024-0001',3.00,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212.1','2024-0002',2.00,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212.1','2024-0003',1.75,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212.1','2024-0004',2.25,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212.1','2024-0005',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212.1','2024-0006',2.50,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212.1','2024-0007',2.00,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212.1','2024-0008',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','1st','CSC 0212.1','2024-0009',1.25,'CS21');


INSERT INTO grade VALUES('2024-2025','2nd','CSC 0224','2024-0001',3.00,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0224','2024-0002',2.00,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0224','2024-0003',1.75,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0224','2024-0004',2.25,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0224','2024-0005',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0224','2024-0006',2.50,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0224','2024-0007',2.00,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0224','2024-0008',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0224','2024-0009',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0212.1','2024-0001',3.00,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0212.1','2024-0002',2.00,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0212.1','2024-0003',1.75,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0212.1','2024-0004',2.25,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0212.1','2024-0005',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0212.1','2024-0006',2.50,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0212.1','2024-0007',2.00,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0212.1','2024-0008',1.25,'CS21');
INSERT INTO grade VALUES('2024-2025','2nd','CSC 0212.1','2024-0009',1.25,'CS21');





