-- 2016. 03. 03 SUBQUERY
/*
        JOIN : 데이터 + 데이터
        SUBQUERY : SQL + SQL
       ===========
           사용법
                           Main-Query = (Sub-QUERY)
                           서브쿼리에서 받은 결과물에 메인쿼리에서 처리하는 방식
                            1) 서브 쿼리
                            2) 메인 쿼리
           사용위치
                 서브쿼리 = SELECT, INSERT, UPDATE, DELETE, CREATE
                               = 인라인뷰 => 페이지 나누는 방법
           예)
                    SELECT AVG(sal) FROM emp; => 2073
                    SELECT ename, sal, hiredate FROM emp
                    WHERE sal < 2073;
                     => SELECT ename, sal, hiredate FROM emp
                          WHERE sal<(SELECT AVG(sal) FROM emp);

               종류 
                   = 단일행 서브쿼리 : 결과값이 1개일경우
                   = 다중행 서브쿼리 : 결과값이 여러개
                           동시에 처리   =>  IN
                           가장 큰값      => ALL   => MAX
                           가장 작은 값  => ANY  => MIN
                     
*/

-- 사원중에 평균 급여보다 작게 받는 사원의 이름, 급여, 입사일 출력
/*
SELECT ename, sal, hiredate FROM emp
WHERE sal<(SELECT AVG(sal) FROM emp)
ORDER BY sal DESC;
*/
-- KING의 부서명과 근무지를 출력 하라
/*
     1. KING의 deptno를 확인
     2. deptno => dept전송
*/
/*
SELECT dname, loc
FROM dept 
WHERE deptno = (SELECT deptno FROM emp WHERE ename ='KING'); 

-- 부서명이 SALES 부서 사원중 가장 많은 급여를 받는 사원의 급여를 출력

SELECT max(sal) 
FROM emp
WHERE deptno=(SELECT deptno FROM dept WHERE dname='SALES');

-- SMITH보다 급여를 많이 받는 사원의 이름과 급여를 출력
SELECT ename, sal
FROM emp
WHERE sal>(SELECT sal FROM emp WHERE ename='SMITH');

--10번 부서의 사원들과 같은 급여를 받는 사원의 이름과 급여와 부서번호 출력

SELECT ename, sal, deptno
FROM emp
WHERE sal IN(SELECT sal FROM emp WHERE deptno = 20)
AND deptno <>20;
*/

--BLAKE와 같은 부서에 있는 사람의 이름과 입사일, 직위 출력
--BLAKE는 제외를 한다.
/*
SELECT ename, hiredate, job
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename = 'BLAKE')
AND ename <> 'BLAKE';

-- 평균 급여보다 많이 받는 사원이 사번, 이름, 급여를 출력
-- 급여가 많은 순으로 출력
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT avg(sal) FROM emp)
ORDER BY sal DESC;

--30번 부서의 최고 급여를 받는 사원보다 더 많이 받는 사원의 이름과 
--급여를 출력

SELECT ename, sal
FROM emp
WHERE sal > (SELECT max(sal) FROM emp WHERE deptno=30);

SELECT ename, sal
FROM emp
WHERE sal >ALL(SELECT sal FROM emp WHERE deptno=30);

SELECT ename, sal
FROM emp
WHERE sal >ANY(SELECT sal FROM emp WHERE deptno=30);

-- KING에게 보고하는 모든 사원의 이름과 급여를 출력
SELECT ename, sal
FROM emp
WHERE mgr = (SELECT empno FROM emp WHERE ename='KING');

SELECT ename, sal
FROM emp
WHERE mgr = (SELECT empno FROM emp WHERE mgr IS NULL);
*/
-- 사원의 부서번호, 직위, 인원수를 출력

SELECT deptno "부서번호", job "직위", count(*) "사원수"
FROM emp
GROUP BY (deptno, job)
ORDER BY deptno ASC, job ASC;

-- 부서번호, 인원수, (급여)최대값, 최소값, 인원수가 3명이하인 부서만 출력
-- WHERE문에 count함수 사용 불가능 => HAVING사용
SELECT  deptno, count(*), max(sal), min(sal)
FROM emp
GROUP BY deptno
HAVING COUNT(deptno) <=3;

--입사한 년도 별로 그룹 인원수, 급여의 평균
SELECT TO_CHAR(hiredate,'YYYY'), count(*), avg(sal)
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY');

SELECT EXTRACT(YEAR FROM hiredate), count(*), avg(sal)
FROM emp
GROUP BY EXTRACT(YEAR FROM hiredate);

SELECT SUBSTR(hiredate,1,2), count(*), avg(sal)
FROM emp
GROUP BY SUBSTR(hiredate,1,2);

-- 부서명, 직위 

SELECT dname,job,count(*)
FROM emp e JOIN dept d
ON e.deptno = d.deptno 
GROUP BY (dname,job)
ORDER BY dname ASC, job ASC;

-- emp안에서 각 부서 번호를 중복없이 출력
SELECT DISTINCT deptno
FROM emp;

-- 연도별, 부서명을 그룹으로 급여의 최대값, 최소값, 인원수
SELECT EXTRACT(year from hiredate) AS "연도별", dname, max(sal), min(sal), count(*)
FROM emp e JOIN dept d
ON e.deptno = d.deptno
GROUP BY ( EXTRACT(year from hiredate), dname);

--10번 부서 사원중에서 30번 부서에 없는 업무를 하는 사원의 사원번호
-- 이름, 부서명, 근무를 출력
SELECT empno, ename, dname, loc
FROM emp e JOIN dept d
ON e.deptno = d.deptno AND
e.deptno = 10 AND job NOT IN(SELECT JOB FROM emp WHERE deptno=30);

-- 급여가 30번인 부서에서 최고의 급여보다 높은 사원의 사번과 이름, 급여, 출력

SELECT empno, ename, sal
FROM emp
WHERE sal > ALL(SELECT sal FROM emp WHERE deptno =30);
--WHERE sal > (SELECT max(sal) FROM emp WHERE deptno =30);

SELECT empno, ename, job, dname, loc, (SELECT avg(sal) FROM emp) avg
FROM (SELECT empno, ename, job, dname, loc
            FROM emp, dept
            WHERE emp.deptno = dept.deptno);

SELECT empno, ename, job, hiredate, rn
FROM (SELECT empno, ename, job, hiredate,sal, rownum as rn
FROM (SELECT empno, ename, job, hiredate,sal FROM emp ORDER BY sal DESC))
WHERE rn BETWEEN 1 AND 5;

SELECT empno, ename, job, hiredate, rn
FROM (SELECT empno, ename, job, hiredate,sal, rownum as rn
FROM (SELECT empno, ename, job, hiredate,sal FROM emp ORDER BY sal DESC))
WHERE rn BETWEEN 6 AND 10;