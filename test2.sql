-- 2016.02.25 오라클 2일차
/*
      오라클에서 제공하는 내장 함수
      단일행 함수
         = 문자함수
              UPPER
              LOWER
              INITCAP
           =========
              CONCAT
              SUBSTR *****
              INSTR
              LPAD  *****, RPAD
              LTRIM, RTRIM, TRIM
              LENGTH, LENGTHB
         = 숫자함수 : Math
              CEIL
              ROUND *****
              TRUNC *****
              MOD
         = 날짜함수 : Date
              ADD_MONTHS
              MONTHS_BETWEEN  *****
              SYSDATE  *****
              LAST_DAY
              NEXT_DAY
         = 변환함수 : Format
              TO_CHAR *****
                  YYYY, MM, DD, HH24, MI, SS
              TO_NUMBER
              TO_DATE
         = 기타함수
              NVL  *****
              CASE
              DECODE
      다중행 함수    ======================> GROUP BY
          = AVG, SUM
          = MAX, MIN
          = COUNT
          = RANK
*/

/*
SELECT SUM(sal), AVG(sal), COUNT(*)
FROM emp
WHERE deptno = 10;
SELECT SUM(sal), AVG(sal), COUNT(*)
FROM emp
WHERE deptno = 20;
SELECT SUM(sal), AVG(sal), COUNT(*)
FROM emp
WHERE deptno = 30;

SELECT deptno,SUM(sal), AVG(sal), COUNT(*)
FROM emp
GROUP BY deptno;
*/

-- UPPER,LOWER,INITCAP
SELECT ename,UPPER(ename),LOWER(ename),INITCAP(ename)
FROM emp;
-- CONCAT
SELECT CONCAT('Hello','Java') FROM DUAL; 
SELECT 'Hello'||'Java' FROM DUAL;
--SUBSTR
SELECT SUBSTR('Oracle Mania',4,3) FROM DUAL;
SELECT SUBSTR('Oracle Mania',-4,3) FROM DUAL;

-- emp => ename에서 3번쨰 자리에 R이 있는 사원의 이름을 출력
SELECT ename from emp WHERE SUBSTR(ename,3,1) LIKE 'R' ;
SELECT ename from emp WHERE SUBSTR(ename,3,1) ='R' ;
SELECT ename FROM emp WHERE ename LIKE '_R% ';
-- INSTR
SELECT INSTR('Hello Java','a', 1) FROM DUAL;
-- emp => ename 에서 마지막 문자가 N인 사원의 이름을 출력
SELECT ename From emp WHERE ename Like '%_N';
SELECT ename From emp WHERE INSTR(ename,'N',1)  = -1;

-- LPAD, RPAD
SELECT LPAD(ename,7, '*') FROM emp;
SELECT RPAD(SUBSTR(ename,1,3),LENGTH(ename),'*') FROM emp;
-- LTRIM, RTRIM, TRIM
SELECT LTRIM('aaaaabbbbbaaaaa','a') FROM DUAL;
SELECT RTRIM('aaaaabbbbbaaaaa','a') FROM DUAL;
SELECT TRIM('a' FROM 'aaaabbbbaaaa') FROM DUAL;
SELECT LTRIM('         Hello Java ') FROM DUAL;

-- LENGTH, LENGTHB
SELECT LENGTH('hong'), LENGTH('홍길동') FROM DUAL;
SELECT LENGTHB('hong'), LENGTHB('홍길동') FROM DUAL;

-- 숫자함수
-- CEIL
SELECT CEIL(COUNT(*)/10) FROM emp;
SELECT COUNT(*) FROM emp;
--ROUND
SELECT ROUND(10.567,1) FROM DUAL;
SELECT ROUND(10.567,0) FROM DUAL;
-- 대상은 n+1 ROUND(실수, n)
SELECT TRUNC(10.567,2) FROM DUAL;
-- MOD => %
SELECT MOD(11,2) FROM DUAL;
SELECT empno, ename FROM emp WHERE MOD(empno,2) LIKE 1;
-- 날짜함수 SYSDATE
SELECT SYSDATE-1, SYSDATE, SYSDATE+1 FROM DUAL;
-- MONTHS_BETWEEN
SELECT ename, hiredate, 
TO_CHAR(ROUND(TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate),0) /12,0)*sal,'$99,999') FROM emp;
-- ADD MONTH
SELECT ADD_MONTHS(SYSDATE,6) FROM DUAL;
-- NEXT_DAY
SELECT NEXT_DAY(SYSDATE,'금') FROM DUAL;
-- LAST_DAY 입력한달의 마지막날
SELECT LAST_DAY('16/03/01') FROM DUAL;
SELECT LAST_DAY(ADD_MONTHS(SYSDATE,1)) FROM DUAL;

--TO_CHAR
SELECT hiredate, TO_CHAR(hiredate,'YYYY/MM/DD HH24:MI:SS') FROM emp;
SELECT EXTRACT(YEAR FROM SYSDATE) "년도",
             EXTRACT(MONTH FROM SYSDATE) "월",
             EXTRACT(DAY FROM SYSDATE) "일"
FROM DUAL;

--기타 함수
SELECT ename,sal,comm,sal+NVL(comm,0) FROM emp;

-- DECODE
SELECT ename, hiredate, job,
    DECODE(deptno, 10, '영업부',
                               20, '자재부',
                               30, '총무부') dname
FROM emp;

SELECT ename, hiredate, job,
    CASE
    WHEN deptno=10 THEN '영업부'
WHEN deptno=20 THEN '자제부'
WHEN deptno=30 THEN '총무부'
END dname
FROM emp;
-- 집합 함수
-- 평균 함수
SELECT TRUNC(AVG(sal),0) FROM emp;

SELECT ename, sal FROM emp WHERE sal >2073;
SELECT ename, sal FROM emp WHERE sal<(SELECT AVG(sal) FROM emp);
SELECT SUM(sal) FROM emp;
-- ROW의 개수
SELECT COUNT(mgr), COUNT(*) FROM emp;
-- MAX MIN : 집합함수이기 때문에 에러발생
SELECT ename,MAX(sal), MIN(sal) FROM emp;
-- 에러 수정
SELECT MAX(sal), MIN(sal) FROM emp;
-- RANK
SELECT ename,job,sal,RANK() OVER(ORDER BY sal DESC) rnd
FROM emp;

/*
   COUNT : ID 중복체크, 페이지, 로그인 처리
   MAX : 자동 증가 번호
   NVL : NULL 값을 대체
   RANK : 시각화 연습
   TO_CHAR : 시간, 날짜를 변환 
*/
