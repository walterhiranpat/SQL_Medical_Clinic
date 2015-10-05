/*
	Filename: queries.sql
	Author: Walter Hiranpat
	Description: Contain the SQL statements for each of the 
		10 problems of this homework
*/

/*
1:The schedule(patient SSN, Patient name) for all the nurses on 
	July 31, 2015
*/
SELECT SCHEDULE.SSN, PATIENT.Pname
FROM SCHEDULE 
	JOIN PATIENT ON SCHEDULE.SSN = PATIENT.SSN
	JOIN STAFF ON SCHEDULE.EMP = STAFF.EMP
WHERE SDATE=150731 AND TITLE='NURSE';
/*
2:The specialties(code, name) that have atleast one diagnosis 
	costing over $100
*/
SELECT SPECIALTY.SCODE, SNAME
FROM SPECIALTY JOIN DIAGNOSE ON SPECAILTY.SCODE=DIAGNOSE.SCODE
WHERE PRICE>100;

/*
3:The specialties(code, name) not covered by any nurse on the 
	staff
*/
SELECT SPECIALTY.SCODE, SNAME
FROM (SELECT SCODE
FROM(
	(SELECT SCODE
		FROM SPECIALTY)
		MINUS
	(SELECT SCODE
		FROM STAFF JOIN EXPERT ON STAFF.EMP=EXPERT.EMP
		WHERE TITLE= 'NURSE'
		GROUP BY SCODE))) X JOIN SPECIALTY ON X.SCODE=SPECIALTY.SCODE;

/*
4:The staff(employee number, name, title) who specialize in
	every medical specialty
*/
select staff.emp, ENAME, title
from (SELECT staff.EMP
FROM staff join EXPERT on staff.emp=EXPERT.EMP
		join SPECIALTY on EXPERT.SCODE=SPECIALTY.SCODE
GROUP by staff.emp
having count(staff.emp)=(SELECT count(scode) from specialty)
) tempstaff join staff on tempstaff.emp=staff.emp;

/*
5:The patients(patient SSN, name) whose past visits were all
	with nurses
*/
drop view Y;
CREATE VIEW Y(SSN) AS
SELECT SSN
FROM (
        SELECT SSN
        FROM (SELECT SSN FROM VISIT
                 MINUS
                (SELECT SSN FROM VISIT
                 JOIN
                 STAFF ON VISIT.EMP=STAFF.EMP
                         WHERE TITLE='Nurse'
                         GROUP BY SSN)))
WITH CHECK OPTION;

Select PATIENT.SSN, PNAME
FROM Y JOIN PATIENT ON Y.SSN = PATIENT.SSN;
/*
6:The doctor(employee number, name) who works hardest (had the 
	most visits) and the number of visits
*/
DROP VIEW VISITCOUNT;
CREATE VIEW VISITCOUNT(EMP, VIEWCOUNT) AS
SELECT VISIT.EMP, COUNT(VISIT.EMP)
FROM STAFF JOIN VISIT ON STAFF.EMP=VISIT.EMP
GROUP BY VISIT.EMP
ORDER BY COUNT(VISIT.EMP) DESC;

SELECT EMP, ENAME, VIEWCOUNT
FROM(
SELECT STAFF.EMP, ENAME,Title, VIEWCOUNT
FROM  STAFF JOIN VISITCOUNT ON VISITCOUNT.EMP=STAFF.EMP
WHERE TITLE='Doctor' AND VIEWCOUNT=(SELECT MAX(VIEWCOUNT) FROM VISITCOUNT)
);

/*
7:The patients(patient SSN, patient name) and the total unpaid 
	balance of all their prior visits
*/
select Patient.SSN, Pname, balance
from (SELECT VISIT.SSN, sum(PRICE)-sum(Ipaid+ppaid) as balance
FROM (VISIT JOIN VDIAGNOSES ON VISIT.SSN=VDIAGNOSES.SSN AND VISIT.VDATE=VDIAGNOSES.VDATE
        JOIN DIAGNOSE ON VDIAGNOSES.DCODE=DIAGNOSE.DCODE
        JOIN PATIENT ON VISIT.SSN=PATIENT.SSN)
GROUP by VISIT.SSN
having sum(PRICE)-sum(Ipaid+ppaid)>0) dues join patient on dues.SSN=patient.SSN;

/*
8:The staff member(emploee number, employee name, title) and their
	average charge per visit
*/
SELECT STAFF.EMP, ENAME, TITLE, AVG(PRICE) AS AVERAGE_PRICE
FROM (STAFF JOIN EXPERT ON STAFF.EMP=EXPERT.EMP
        JOIN VDIAGNOSES ON EXPERT.SCODE= VDIAGNOSES.SCODE
        JOIN DIAGNOSE ON EXPERT.SCODE= DIAGNOSE.SCODE)
GROUP BY STAFF.EMP, ENAME, TITLE;


/*
9:Pairs of doctors and nurses(employee number, employee name, title,
	employee number, employee name, title) who share atleast one medical
	specialty
*/
SELECT DEMP, DNAME, DTITLE, NEMP, NNAME, NTITLE
FROM 
(SELECT STAFF.EMP as DEMP, ENAME as DNAME, title as DTITLE, SCODE as DSCODE
FROM STAFF JOIN EXPERT ON STAFF.EMP=EXPERT.EMP
WHERE TITLE='Doctor') Doctor
JOIN 
(SELECT STAFF.EMP as NEMP, ENAME as NNAME, title as NTITLE, SCODE as NSCODE
FROM STAFF JOIN EXPERT ON STAFF.EMP=EXPERT.EMP
WHERE TITLE='Nurse') Nurse
ON DOCTOR.DSCODE=NURSE.NSCODE;
/*
10:Pairs of doctors and nurses(employee number, employee name, title;
	employee number, employee name, title) with the very same medical
	specialties
*/

SELECT DEMP, DNAME, DTITLE, NEMP, NNAME, NTITLE
from ((SELECT STAFF.EMP as DEMP, ENAME as DNAME, title as DTITLE, SCODE as DSCODE
FROM STAFF JOIN EXPERT ON STAFF.EMP=EXPERT.EMP
WHERE TITLE='Doctor') Doctor
JOIN 
(SELECT STAFF.EMP as NEMP, ENAME as NNAME, title as NTITLE, SCODE as NSCODE
FROM STAFF JOIN EXPERT ON STAFF.EMP=EXPERT.EMP
WHERE TITLE='Nurse') Nurse
ON DOCTOR.DSCODE=NURSE.NSCODE;)
WHERE NOT EXISTS
  (select DEMP, DNAME, DTITLE, NEMP, NNAME, NTITLE
  FROM STAFF JOIN EXPERT ON STAFF.EMP=EXPERT.EMP
  WHERE TITLE='Doctor') Doctor
  )
  AND
  NOT EXISTS
  (select DEMP, DNAME, DTITLE, NEMP, NNAME, NTITLE
  FROM STAFF JOIN EXPERT ON STAFF.EMP=EXPERT.EMP
  WHERE TITLE='Nurse') Nurse
  )
  



