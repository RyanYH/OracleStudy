-- 2016.02.22 오라클 1일차(SELECT, 연산자)
/*
        오라클에서 데이터를 제어하는 언어
        SQL
          = DML (데이터 조작 언어)
              1) SELECT (데이터 검색)
              2) INSERT  (데이터 추가)
              3) UPDATE (데이터 수정)
              4) DELETE (데이터 삭제)
         = SELECT
            형식)
                    SELECT(컬럼1, 컬럼2....)|*
                    FROM table 명
                    [
                       WHERE 조건문(컬럼명 연산자 값)
                       ===========================
                       GROUP BY 컬럼(그룹)
                       HAVING 그룹 조건
                       ===========================
                       ORDER BY 칼럼  (ASC | DESC)
                    ]
            => WHERE문장 수행시에는 반드시 오라클에서 제공하는 연산자가 필요하다.
                  1) 연산자
                        = 산술 연산자 (+, -, *, /)
                        = 관계 연산자 (=,!=(<>),<,>,<=,>=)
                        = 대입 연산자 (=)
                        예) 
                             UPDATE emp SET
                             ename = '홍길동'
                                       === 대입연산자
                             WHERE empno = 7788;
                                                   === 관계연산자
                         = 논리연산자 (AND, OR)
                         = 부정연산자 (NOT)
                         = 기타
                              => BETWEEN ~AND : 기간이나 범위
                              => LIKE : 유사 문자열 검색
                              => IN : OR연산자를 대체
                              => NULL은 연산처리 할수가 없다.
                                   IS NULL
                                   IS NOT NULL
                  2) 정렬
                      형식) ORDER BY 컬럼 (ASC | DESC)
*/

-- emp의 테이블 구조 확인
DESC emp;

/*
 EMPNO : 사번(중복x)        NUMBER(4) 0~9999(65)
                                            => int 
 ENAME : 이름                  VARCHAR2(10) 1~4000
 JOB : 직위                        VARCHAR2(9)  1~4000
                                             => String
 MGR : 사수번호                NUMBER(4)
 HIREDATE : 입사일          DATE
                                             => java.util.Date
 SAL : 급여                       NUMBER(7,2)
 COMM : 성과급                NUMBER(7,2)
                                             => double
 DEPTNO : 부서번호         NUMBER(2) 0~99
*/

-- emp에 저장된 모든 데이터를 읽어 온다
SELECT * FROM emp:

-- 필요한 데이터만 읽어온다 (사번, 이름, 입사일)
SELECT empno "사번", ename "이름", hiredate "입사일" FROM emp;

-- 인라인 뷰
SELECT empno, ename, hiredate FROM (SELECT * FROM emp);
SELECT AVG(sal) FROM emp;

-- SUBQUERY
SELECT empno, ename, sal FROM emp WHERE sal<(SELECT AVG(sal) FROM emp);

SELECT ename, sal, rownum FROM 
  (SELECT ename, sal FROM emp ORDER BY sal DESC) 
  WHERE rownum <=5;


