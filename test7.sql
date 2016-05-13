--2016.03.07 SubQuery

--1. 사원 번호가 7788인 사원의 직업과 부서번호가 일치하는 사원의
--이름과 직위와 부서번호, 입사일을 출력
--다중컬럼 서브쿼리

SELECT ename, job, deptno, hiredate
FROM emp
WHERE (deptno, job) = (SELECT deptno, job FROM emp WHERE empno = 7788);

--2. 10번 부서의 사원들과 같은 급여를 받는 사원의 이름, 급여, 부서번호를 cnffur
--다중 행 서브쿼리
SELECT ename, sal, deptno 
FROM emp
WHERE sal IN (SELECT sal FROM emp WHERE deptno =10);
-- ANY ALL

--3. comm을 받는 사원과 부서번호, 급여가 같은 사원의 이름, 급여, 부서번호 출력
-- 다중행+다중컬럼 서브쿼리
SELECT ename, sal, deptno FROM emp
WHERE (deptno, sal)  NOT
IN (SELECT deptno, sal FROM emp WHERE comm IS NOT NULL AND comm<>0);

--4.  DALLAS에서 근무하는 사원의 급여 평균보다 많이 받는 사원의 이름과 급여와 직위를 출력
--이중서브쿼리
SELECT ename, sal, job FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE loc='DALLAS' ));

--5. 20번 부서의 인원보다 더 많은 인원이 있는 부서의 부서번호, 인원수를 출력
SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno
HAVING COUNT(*)>(SELECT COUNT(*) FROM emp WHERE deptno = 20);

--6.1981년 6월 1일 ~ 1981년 12월 31일 입사한 사원 중 에 부서명이 SALES인 사원의 부서번호
--, 이름, 직위, 입사일 출력 (입사일 올림차순)
SELECT ename, job, hiredate FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE dname='SALES')
AND hiredate BETWEEN '81/6/1' AND '81/12/31'
ORDER BY hiredate ASC;