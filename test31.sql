-- 2016.05.02 VIEW

/*
       VIEW : 가상테이블(이미 존재하는 테이블을 참조해서 SQL문장을 저장해서 사용)
                   = 1) 단순한 SQL문장을 사용할 수 있다.(유지보수가 간결)
	      2) 보안시 사용이 된다
	  = 종류
	      1) 단순뷰 : 테이블 한개 연동
	      2) 복합뷰 : 테이블 한개이상 연동
	      3) 인라인뷰 : SELECT ~~(SELECT)
	  = 옵션
	      1) WITH CHECK OPTION(INSERT,UPDATE,DELETE)
	      2) WITH READ ONLY(읽기전용)
	  = 사용자 계정은 뷰를 생성할 권한이 없다.
	     권한부여
	       ===> GRANT CREATE VIEW TO scott 
	       ===> REVOKE CREATE VIEW FROM scott
	 = 문법
	    1) 생성
	        CREATE VIEW view_name AS (SELECT ~~)
 	    2) 삭제
	        DROP VIEW view_name;
	    3) 수정
	       CREATE OR REPLACE VIEW view_name AS (SELECT ~~)
*/

/*
-- 권한 부여 (system, sysdba) ==> conn /as sysdba
conn system/tiger;
GRANT CREATE VIEW TO scott;
conn scott/tiger;

-- 단순 뷰
CREATE OR REPLACE VIEW dept_view AS
SELECT * FROM dept;
SELECT * FROM dept_view;

*/
/*
-- 뷰에서 데이터 추가
INSERT INTO dept_view VALUES((SELECT NVL(MAX(deptno)+10,10) FROM dept_view),'영업부','서울');
COMMIT;
SELECT * FROM dept_view;
*/

/*
-- 뷰에서 데이터 수정
UPDATE dept_view SET
loc='제주'
WHERE deptno=50;
COMMIT;
SELECT * FROM dept_view;
SELECT * FROM dept;

*/

/*
--뷰에서 데이터 삭제
DELETE  FROM dept_view
WHERE deptno=50;
COMMIT;
SELECT * FROM dept_view;
SELECT * FROM dept;
*/
/*
--뷰삭제
--DROP VIEW dept_view;

CREATE OR REPLACE VIEW dept_view
AS SELECT * FROM dept
WITH READ ONLY;
INSERT INTO dept_view VALUES((SELECT NVL(MAX(deptno)+10,10) FROM dept_view),'영업부','서울');
COMMIT;
*/
/*
--복합뷰
CREATE OR REPLACE VIEW  empdept_view AS
SELECT empno,ename,job,hiredate,sal,e.deptno,dname,loc
FROM emp e, dept d
WHERE e.deptno=d.deptno;

SELECT * FROM empdept_view;
*/

/*
CREATE OR REPLACE VIEW empdeptsal_view AS
SELECT empno,ename,job,hiredate,sal,e.deptno,dname,loc,grade
FROM emp e, dept d , salgrade s
WHERE e.deptno=d.deptno
AND sal BETWEEN losal AND hisal;
*/

--인라인뷰
SELECT empno,ename,sal,rownum
FROM (SELECT empno,ename,sal FROM emp ORDER BY sal DESC)
WHERE rownum<=5;

--급여가 3~7까지 사원이름, 급여를 출력
SELECT ename,sal, num
FROM(SELECT ename,sal, rownum as num
FROM(SELECT ename,sal FROM emp 
         ORDER BY sal DESC))
WHERE num BETWEEN 3 and 7;