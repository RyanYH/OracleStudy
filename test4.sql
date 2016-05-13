-- 2016.02.29 오라클 3일차 (JOIN2)
-- 조인(이중 조인)

/*
SELECT ename, sal, grade
            ========== ======
                emp         salgrade
*/ 

SELECT * FROM salgrade;

--NON-EQU JOIN
SELECT ename, sal, grade 
FROM emp JOIN salgrade
ON SAL BETWEEN LOSAL AND HISAL;
--ON sal>=losal AND sal<=hisal;


SELECT ename, job, hiredate, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal;

 
SELECT ename, job, hiredate, dname, loc, grade, sal
FROM emp JOIN dept
ON emp.deptno = dept.deptno
JOIN salgrade ON sal BETWEEN losal AND hisal
ORDER BY sal DESC;

SELECT ename, job, hiredate, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal 
AND ename LIKE '%A%';


SELECT ename, job, hiredate, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal 
AND ename LIKE '__A%';


SELECT ename, job, hiredate, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal 
AND SUBSTR(ename,3,1) = 'A';

SELECT ename, job, hiredate, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal 
AND( INSTR(ename,'A',1)=3
OR INSTR(ename,'A',2)=3);

SELECT e.ename,e.sal,s.grade
FROM (SELECT * FROM emp) e, (SELECT * FROM salgrade) s
WHERE e.sal BETWEEN s.losal AND s.hisal;

SELECT empno, ename, job, hiredate, sal, rownum, grade
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal
AND rownum <= 5
ORDER BY sal DESC;

SELECT empno, ename, job, hiredate, sal, rownum
FROM (SELECT * FROM emp ORDER BY sal DESC)
WHERE rownum<=5;