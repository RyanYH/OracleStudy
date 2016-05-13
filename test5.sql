-- 사원이름, 사원직위, 부서명, 근무지

SELECT ename AS "사원이름", job, dname, loc
FROM emp e JOIN dept d
ON e.deptno = d.deptno;


SELECT ename, job, dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;


SELECT ename, job, dname, loc
FROM emp e NATURAL JOIN dept d;


SELECT ename, job, dname, loc
FROM emp e JOIN dept d
USING(deptno);

-- 사원이름, 사원직위, 입사일, 부서명, 근무지, 급여 , 급여등급

--ansi JOIN
SELECT ename, job, hiredate, dname, loc, sal, grade
FROM emp e JOIN dept d
ON e.deptno = d.deptno
JOIN salgrade s ON sal BETWEEN s.losal AND s.hisal;

--Oracle JOIN
SELECT ename, job, hiredate, dname, loc, sal, grade
FROM emp e, dept d, salgrade s 
WHERE e.deptno = d.deptno
AND sal BETWEEN s.losal AND s.hisal;

--SELF-JOIN / LEFT OUTER JOIN

SELECT e1.ename "본인이름", e2.ename "사수명"
FROM emp e1, emp e2 
WHERE e1.mgr = e2.empno(+);

SELECT e1.ename "본인이름", e2.ename "사수명"
FROM emp e1 LEFT JOIN emp e2 
ON e1.mgr = e2.empno;

--RIGHT OUTER JOIN

SELECT ename, job, dname, loc
FROM emp e RIGHT JOIN dept d
ON e.deptno = d.deptno;

SELECT ename, job, dname, loc
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno;

-- FULL JOIN

SELECT ename, job, dname, loc
FROM emp e FULL JOIN dept d
ON e.deptno = d.deptno;


SELECT e1.ename "본인이름", e2.ename "사수명"
FROM emp e1 FULL JOIN emp e2 
ON e1.mgr = e2.empno;



SELECT empno, ename, job, loc, grade FROM emp JOIN dept ON emp.deptno=dept.deptno JOIN salgrade s ON sal BETWEEN s.losal AND s.hisal;