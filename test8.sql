-- 2016.03.07 ROLLUP, CUBE
/*
     ROLL UP ========>
     =================================
          인원(사원)     인원(대리)     인원(과장)  
     =================================
    10         1                 2                 1         4
     =================================
    20         2                 1                 1         4
     =================================
    30         3                 2                 1         6 
     =================================
                                                               14

     CUBE --가로세로
     =================================
          인원(사원)     인원(대리)     인원(과장)  
     =================================
    10         1                 2                 1         4
     =================================
    20         2                 1                 1         4
     =================================
    30         3                 2                 1         6 
     =================================
                6                 5                  3        14
*/
/*
SELECT deptno, SUM(sal)
FROM emp
GROUP BY ROLLUP(deptno);

SELECT deptno, SUM(sal)
FROM emp
GROUP BY CUBE(deptno);

SELECT job, SUM(sal) FROM emp
GROUP BY ROLLUP(job,mgr);
*/
/*
SELECT dname, job, COUNT(*), SUM(sal)
FROM emp, dept
WHERE emp.deptno = dept.deptno
GROUP BY ROLLUP(dname,job);

SELECT dname, job, COUNT(*), SUM(sal)
FROM emp, dept
WHERE emp.deptno = dept.deptno
GROUP BY CUBE(dname,job);

SELECT deptno, empno, SUM(sal) sal
FROM emp
GROUP BY ROLLUP(deptno, empno);
*/

SELECT deptno, empno, 
             DECODE(GROUP_ID(),0,NVL(ename,'합계'),'평균') ename,
             DECODE(GROUP_ID(),0,SUM(sal),ROUND(AVG(sal),2)) sal
FROM emp
GROUP BY deptno, ROLLUP(deptno,(empno, ename))
ORDER BY deptno,GROUP_ID(),empno;

SELECT deptno, empno, 
             DECODE(GROUP_ID(),0,NVL(ename,'합계'),'평균') ename,
             DECODE(GROUP_ID(),0,SUM(sal),ROUND(AVG(sal),2)) sal
FROM emp
GROUP BY deptno, CUBE(deptno,(empno, ename))
ORDER BY deptno,GROUP_ID(),empno;