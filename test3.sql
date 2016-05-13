-- 2016.02.29 JOIN
/*
    JOIN
      = 서로 다른 테이블에서 원하는 데이터 추출
    1) 종류
         INNER JOIN
              = EQUI-JOIN(=)
              = NON-EQUI-JOIN(=이 아닌 연산자)
         OUTER JOIN
              = LEFT OUTER JOIN
              = RIGHT OUTER JOIN
              = FULL OUTER JOIN
     2) 형식
         INNER JOIN
              = SELECT A.a, B.b
                 FROM A, B
                 WHERE A.c = B.c => Oracle Type
              = SELECT A.a, B.b
                 FROM A JOIN B
                 ON A.c = B.c        => Ansi Type
               *********** 테이블이 같은 컬럼명을 갖고 있을때
                JOIN-USING
                NATURAL JOIN
*/

/*
          emp : 사원정보
              empno
              ename
              job
              mgr
              hiredate
              sal
              comm
              deptno =====================> Foreign Key
          dept : 부서정보
              deptno =====================> Primary Key
              dname : 부서명
              loc : 근무지
              
           사원의 사번, 이름, 직위, 부서명, 근무지 , 부서번호
                      =============  ===========   ========
                            emp                   dept            중심테이블 : emp
-----------------------------------------------------------------------------------
                    SELECT empno, ename, job, dname, loc, emp.deptno(e.deptno)
                    FROM emp, dept
                              ==========
                              emp e, dept d
                    WHERE emp.deptno(e.deptno) = dept.deptno(d.deptno);             <ORACLE JOIN>
-----------------------------------------------------------------------------------
                    SELECT empno, ename, job, dname, loc, emp.deptno(e.deptno)
                    FROM emp JOIN dept
                              ==========
                              emp e, dept d
                    ON emp.deptno(e.deptno) = dept.deptno(d.deptno); 
                    ==
                    조건                                                                                             <ANSI JOIN>
-----------------------------------------------------------------------------------
                    SELECT empno, ename, job, dname, loc, deptno
                    FROM emp JOIN dept
                    USING(deptno)                                                                             <JOIN USING>
-----------------------------------------------------------------------------------                                SELECT empno, ename, job, dname, loc, deptno
                    FROM emp NATURAL JOIN dept                                                   <NATURAL JOIN>
-----------------------------------------------------------------------------------
       
*/

-- NATURAL JOIN
SELECT empno, ename, job, dname, loc, deptno
FROM emp NATURAL JOIN dept;

-- JOIN-USING
SELECT empno, ename, job, dname, loc, deptno
FROM emp JOIN dept
USING(deptno);

--ANSI JOIN
SELECT empno, ename, job, dname, loc, emp.deptno
FROM emp JOIN dept
ON emp.deptno = dept.deptno;

--ORACLE JOIN
SELECT empno, ename, job, dname, loc, emp.deptno
FROM emp,dept
WHERE emp.deptno(+)= dept.deptno;

--SELF JOIN
SELECT e1.empno "본인 사번", e1.ename "본인 이름", e2.empno "사수사번", e2.ename "사수이름"
FROM emp e1, emp e2
WHERE e1.mgr = e2. empno(+);
