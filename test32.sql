--  2016.05.03 PL/SQL

/*
     PL/SQL 형식
     DECLARE
       변수 선언
     BEGIN
       SQL문장 제어
     EXCEPTION
       예외처리 => NO_DATA_FOUND, MANY_TOO_ROWS, OTHERS

     1) 변수
         = 스칼라변수 (일반변수)
	name VARCHAR2(10)
         = 단일 변수( 기존 테이블 변수의 데이터형을 사용)
            %TYPE
         = RECORD : 여러개의 데이터형을 묶어서 처리
         = RECORD : 사용자 정의(JOIN)
            %ROWTPYE : 한개의 테이블에 대해서만 정리
         = 여러줄을 묶어서 사용 : CURSOR

*/
/*
SET SERVEROUTPUT ON
DECLARE
    vename VARCHAR2(20);
    vsal NUMBER(7,2);
    vjob VARCHAR2(20);
    vempno NUMBER(4);
BEGIN
    SELECT ename,job,sal INTO vename,vjob,vsal
    FROM emp
    WHERE empno=&vempno;
    DBMS_OUTPUT.PUT_LINE('******결과값******');
    DBMS_OUTPUT.PUT_LINE('이름:'||vename);
    DBMS_OUTPUT.PUT_LINE('직위:'||vjob);
    DBMS_OUTPUT.PUT_LINE('급여:'||vsal);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('Exception:MANY_TOO_ROWS');
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Exception:데에ㅣ터를 찾을수 없습니다.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Exception:알수 없는 예외가 발생');	
END;
/

*/
/*
--%TYPE
DECLARE
    vename emp.ename%TYPE;
    vjob emp.job%TYPE;
    vdname dept.dname%TYPE;
    vloc dept.loc%TYPE;
BEGIN
   SELECT ename,job,dname,loc INTO vename,vjob,vdname,vloc
   FROM emp, dept
   WHERE emp.deptno = dept.deptno
   AND empno=7788;
    DBMS_OUTPUT.PUT_LINE('******결과값******');
    DBMS_OUTPUT.PUT_LINE('이름:'||vename);
    DBMS_OUTPUT.PUT_LINE('직위:'||vjob);
    DBMS_OUTPUT.PUT_LINE('부서:'||vdname);
    DBMS_OUTPUT.PUT_LINE('근무지:'||vloc);
END;
/

*/
/*
--%ROWTPYE
DECLARE
   vemp emp%ROWTYPE;
BEGIN
   SELECT * INTO vemp
   FROM emp
   WHERE empno=7788;
    DBMS_OUTPUT.PUT_LINE('******결과값******');
    DBMS_OUTPUT.PUT_LINE('이름:'||vemp.ename);
    DBMS_OUTPUT.PUT_LINE('직위:'||vemp.job);
    DBMS_OUTPUT.PUT_LINE('입사일:'||vemp.hiredate);
    DBMS_OUTPUT.PUT_LINE('연봉:'||vemp.sal);
END;
/     
*/
-- RECORD
DECLARE
   TYPE myEmp IS RECORD
   (
        empno emp.empno%TYPE,
        ename emp.ename%TYPE,
        job emp.job%TYPE,
        dname dept.dname%TYPE,
        loc dept.loc%TYPE
   );
 m myEmp;
BEGIN
  SELECT empno,ename,job,dname,loc INTO m
  FROM emp,dept
  WHERE emp.deptno=dept.deptno
  AND empno=7788;
  DBMS_OUTPUT.PUT_LINE('******결과값******');
  DBMS_OUTPUT.PUT_LINE('이름:'||m.ename);
  DBMS_OUTPUT.PUT_LINE('직위:'||m.job);
  DBMS_OUTPUT.PUT_LINE('부서:'||m.dname);
  DBMS_OUTPUT.PUT_LINE('연봉:'||m.loc);
END;
/