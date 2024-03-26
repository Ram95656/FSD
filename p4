CREATE TABLE STUDENT (
USN VARCHAR (10) PRIMARY KEY,
SNAME VARCHAR (25),
ADDRESS VARCHAR (25),
PHONE INTEGER,
GENDER CHAR (1));

CREATE TABLE SEMSEC (
SSID VARCHAR (5) PRIMARY KEY,
SEM INTEGER,
SEC CHAR (1));

CREATE TABLE CLASS (
USN VARCHAR (10),
SSID VARCHAR (5),
PRIMARY KEY (USN, SSID),
FOREIGN KEY (USN) REFERENCES STUDENT (USN),
FOREIGN KEY (SSID) REFERENCES SEMSEC(SSID));

CREATE TABLE SUBJECT (
SUBCODE VARCHAR (8),
TITLE VARCHAR (20),
SEM NUMBER (2),
CREDITS INTEGER,
PRIMARY KEY (SUBCODE));

CREATE TABLE IAMARKS (
USN VARCHAR (10),
SUBCODE VARCHAR (8),
SSID VARCHAR (5),
TEST1 INTEGER,
TEST2 INTEGER,
TEST3 INTEGER,
FINALIA INTEGER,
PRIMARY KEY (USN, SUBCODE, SSID),
FOREIGN KEY (USN) REFERENCES STUDENT (USN),
FOREIGN KEY (SUBCODE) REFERENCES SUBJECT (SUBCODE),
FOREIGN KEY (SSID) REFERENCES SEMSEC (SSID));

1.
SELECT S.*, SS.SEM, SS.SEC
FROM STUDENT S, SEMSECSS, CLASS C
WHERE S.USN = C.USN AND
SS.SSID =C.SSID AND
SS.SEM = 4 AND
SS.SEc=’C’;

2.
SELECT SS.SEM, SS.SEC, S.GENDER, COUNT (S.GENDER) AS COUNT
FROM STUDENT S, SEMSEC SS, CLASS C
WHERES.USN = C.USN AND
SS.SSID = C.SSID
GROUP BY SS.SEM, SS.SEC, S.GENDER
ORDER BY SEM;

3.
CREATE VIEW STU_TEST1_MARKS_VIEW
AS
SELECT TEST1, SUBCODE
FROM IAMARKS
WHERE USN = '1CE16CS0

4.
CREATE PROCEDURE CalFA( )
-> BEGIN
-> UPDATE IAMARKS
-> SET FINALIA = (CASE WHEN GREATEST(TEST1, TEST2) != GREATEST(TEST1,TEST3)
-> THEN GREATEST(TEST1, TEST2) + GREATEST(TEST1,TEST3)
-> ELSE
-> GREATEST(TEST1, TEST2) + GREATEST(TEST2,TEST3)
-> END) / 2
-> WHERE FINALIA IS NULL;
-> END #

5.
SELECT USN, SNAME, SUBCODE,FINALIA,
(CASE WHEN FINALIA BETWEEN 17 AND 20
THEN ‘OUTSTANDING’
WHEN FINALIA BETWEEN 12 AND 16
THEN ‘AVERAGE’
ELSE ‘WEAK’
END) AS CATEGORY
FROM (STUDENT natural join IAMARKS) natural join SEMSEC
WHEN SEM=8 AND SEC IN(‘A’,’B’,’C’);