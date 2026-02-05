CREATE database week_11;

USE week_11;
-- employee table creation
drop table  employee;


create table employee (
EMPNO INT primary key  ,
ENAME varchar(100),
JOB varchar(100),
MGR int,
HIREDATE DATE,
SAL decimal ,
COMM INT ,
DEPTNO INT 
);

INSERT INTO employee VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO employee VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO employee VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO employee VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO employee VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO employee VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO employee VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO employee VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, NULL, 20);
INSERT INTO employee VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO employee VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO employee VALUES (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, NULL, 20);
INSERT INTO employee VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO employee VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO employee VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);
select * from employee;


-- department table creation 

create table department (
DEPTNO INT,
DNAME varchar(100),
LOC VARCHAR(100)
);


INSERT INTO department VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO department VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO department VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO department VALUES (40, 'OPERATIONS', 'BOSTON');

-- grade table creation 

CREATE TABLE grade (
GRADE INT,
LOSAL DECIMAL (10,2),
HISAL DECIMAL (10,2)
);

INSERT INTO grade values (1,700,1200);
INSERT INTO grade VALUES (2,1201,1400);
INSERT INTO grade VALUES (3,1401,2000);
INSERT INTO grade VALUES (4,2001,3000);
INSERT INTO grade VALUES (5,3001,9999);
select* from grade;

-- section_1

SELECT * FROM employee;
SELECT EMPNO, ENAME, SAL FROM employee;
SELECT distinct JOB FROM employee;
SELECT ENAME, SAL*12 FROM employee;
SELECT * FROM employee where DEPTNO = 10 ;
SELECT ENAME,JOB FROM employee where JOB= "CLERK";
SELECT ENAME FROM employee WHERE ENAME LIKE "S%";
SELECT ENAME FROM employee WHERE ENAME LIKE "_L%";
SELECT ENAME FROM employee WHERE ENAME LIKE "%AR%";

SELECT * FROM employee 
WHERE YEAR (HIREDATE) = 1981;
SELECT ENAME, SAL FROM employee 
WHERE SAL>2500;
SELECT * FROM employee where JOB IS NOT NULL
AND JOB <> "MANAGER";
SELECT * FROM employee where JOB IS NOT NULL 
AND JOB NOT LIKE "MANAGER";

SELECT * FROM employee WHERE COMM IS NOT NULL
AND COMM > 0;

SELECT * FROM 	employee where DEPTNO = 30 
AND JOB  LIKE "SALESMAN"; 

SELECT * FROM employee WHERE JOB IN ("CLERK" , "ANALYST");
SELECT * FROM employee where SAL between 1000 AND 2000;

-- section 2


select* FROM employee 
order by 	ENAME ;
SELECT * FROM employee
ORDER by  DEPTNO, SAL desc;
SELECT COUNT(*) AS total_employee
from employee;

SELECT SUM(SAL) AS total_salary
from employee;

SELECT AVG (SAL) AS agv_salary
from employee;
SELECT MAX(SAL) AS max_salary, 
MIN(SAL) AS min_salary 
from employee;

SELECT * FROM employee;
select * from department;
select * from grade;

SELECT DEPTNO,COUNT(*) AS employee_count
from employee
group by DEPTNO;

SELECT JOB, avg(SAL) AS AVG_SALARY
FROM employee
group by JOB;

SELECT DEPTNO, SUM(SAL) AS total_salary
from employee
group by DEPTNO;

SELECT DEPTNO AS DEPT_HAVE_3_OR_MORE
FROM employee
GROUP BY DEPTNO
HAVING COUNT(*) > 3;

SELECT JOB AS jobs_with_avg_sal_morethan_2000
FROM employee
group by JOB
HAVING AVG(SAL)>2000;

select*from employee;

-- altering table

ALTER TABLE DEPARTMENT
ADD CONSTRAINT pk_DEPARTMENT
primary key (DEPTNO);


ALTER TABLE employee
ADD CONSTRAINT fk_employee
foreign key (DEPTNO)
REFERENCES DEPARTMENT(DEPTNO);

select*from department;

SELECT employee.ENAME, department.DNAME
FROM employee
JOIN department
ON employee.DEPTNO = department.DEPTNO;

SELECT employee.ENAME, department.DNAME, department.LOC
FROM employee
JOIN department
ON employee.DEPTNO = department.DEPTNO;

SELECT 
employee.ENAME,
employee.SAL,
grade.GRADE 
FROM employee
join grade
on employee.SAL BETWEEN grade.LOSAL AND grade.HISAL;

use week_11;
commit;
show tables;
select * from employee;

SELECT employee.ENAME 
FROM employee
JOIN department
ON employee.DEPTNO = department.DEPTNO
where LOC = "NEW YORK";

SELECT department.DNAME
FROM department
join employee
on employee.DEPTNO = department.DEPTNO
where employee.ENAME = "SMITH";


SELECT ename 
from employee
where SAL > (
SELECT SAL
FROM employee
where ename ='ALLEN'
);

SELECT employee.ENAME 
FROM employee
where DEPTNO = (
SELECT DEPTNO
from employee
WHERE ename = 'SCOTT'
);

SELECT ename FROM employee
where JOB = (
SELECT JOB 
FROM employee	
WHERE ename = 'JONES'
);

-- SECTION 4

SELECT lower(ename)
FROM employee;	


SELECT substring(ename,1,3)
FROM employee;

SELECT ename , length(ename)
FROM employee;

SELECT ename , round(sal) as rounded_sal
FROM employee;

SELECT ename , MOD (SAL,1000) AS remainder
from employee;


SELECT now();

SELECT ename , year(hiredate)
from employee;

-- SECTION 5 

-- ALREADY DONE

ALTER TABLE department
ADD PINCODE INT;

INSERT INTO department VALUES 
(50,'HR', 'HOUSTON'); 


DELETE FROM department 
where dname = 'OPERATIONS';


