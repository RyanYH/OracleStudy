--2016.05.03 PL/SQL
/*
   	제어문
	  = 조건문
	     1) 단일조건문
      	         IF(조건문) THEN
 	             처리
	         END IF;
	     2) 선택조건문
	         IF(조건문) THEN
	             처리
 	         ELSE
	             처리
	         END IF;
	     3) 다중조건문
	         IF(조건문) THEN
	              처리
	         ELSIF (조건문)  THEN
	              처리
	         ELSIF (조건문)  THEN
	              처리
                         ELSE 
	              처리
	         END IF;
	 = 선택문
	         CASE
	           WHEN 조건문 THEN
 		처리
	           WHEN 조건문 THEN
 		처리
	           WHEN 조건문 THEN
 		처리
	           END;
	 = 반복문
	        FOR 변수명 IN 1..9 LOOP
		처리
	        END LOOP;
	
*/
/*
--IF
DECLARE
    vdname dept.dname%TYPE;
    vemp emp%ROWTYPE;
BEGIN
     SELECT * INTO vemp
     FROM emp
     WHERE empno=7788;
     IF(vemp.deptno=10) THEN 
          vdname:='영업부';
    END IF;
     IF(vemp.deptno=20) THEN 
          vdname:='기획부';
    END IF;
     IF(vemp.deptno=30) THEN 
          vdname:='자재부';
    END IF;
     IF(vemp.deptno=40) THEN 
          vdname:='총무부';
    END IF;
    DBMS_OUTPUT.PUT_LINE('****결과****');
    DBMS_OUTPUT.PUT_LINE('이름:'||vemp.ename);
    DBMS_OUTPUT.PUT_LINE('부서명:'||vdname);
END;
/
*/
/*
--다중 IF문
DECLARE
    vdname dept.dname%TYPE;
    vemp emp%ROWTYPE;
BEGIN
     SELECT * INTO vemp
     FROM emp
     WHERE empno=7788;
     IF(vemp.deptno=10) THEN 
          vdname:='영업부';   
     ELSIF(vemp.deptno=20) THEN 
          vdname:='기획부';    
     ELSIF(vemp.deptno=30) THEN 
          vdname:='자재부';   
     ELSIF(vemp.deptno=40) THEN 
          vdname:='총무부';
    ELSE
         vdname:='신입';
    END IF;
    DBMS_OUTPUT.PUT_LINE('****결과****');
    DBMS_OUTPUT.PUT_LINE('이름:'||vemp.ename);
    DBMS_OUTPUT.PUT_LINE('부서명:'||vdname);
END;
/
*/
/*
--IF ~ELSE
DECLARE
    vcomm emp.comm%TYPE;
    vename emp%ROWTYPE;
    vempno emp.empno%TYPE;
BEGIN
    SELECT ename,comm INTO vename,vcomm
    FROM emp
    WHERE empno=&vempno;
    IF (vcomm>0) THEN
    DBMS_OUTPUT.PUT_LINE(vename||'님의 성과급은 '||vcomm||'입니다.');  
    ELSE
     DBMS_OUTPUT.PUT_LINE(vename||'님의 성과급은 없습니다.');
    END IF;
END;
*/

DECLARE
    vdname dept.dname%TYPE;
    vemp emp%ROWTYPE;
BEGIN
     SELECT * INTO vemp
     FROM emp
     WHERE empno=7788;
     vdname:=CASE vemp.deptno
                WHEN 10 THEN '영업부'
	WHEN 20 THEN '기획부'
	WHEN 30 THEN '자재부'
	WHEN 40 THEN '총무부'
	END;
    DBMS_OUTPUT.PUT_LINE('****결과****');
    DBMS_OUTPUT.PUT_LINE('이름:'||vemp.ename);
    DBMS_OUTPUT.PUT_LINE('부서명:'||vdname);
END;
/