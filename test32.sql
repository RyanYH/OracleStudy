--  2016.05.03 PL/SQL

/*
     PL/SQL ����
     DECLARE
       ���� ����
     BEGIN
       SQL���� ����
     EXCEPTION
       ����ó�� => NO_DATA_FOUND, MANY_TOO_ROWS, OTHERS

     1) ����
         = ��Į�󺯼� (�Ϲݺ���)
	name VARCHAR2(10)
         = ���� ����( ���� ���̺� ������ ���������� ���)
            %TYPE
         = RECORD : �������� ���������� ��� ó��
         = RECORD : ����� ����(JOIN)
            %ROWTPYE : �Ѱ��� ���̺� ���ؼ��� ����
         = �������� ��� ��� : CURSOR

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
    DBMS_OUTPUT.PUT_LINE('******�����******');
    DBMS_OUTPUT.PUT_LINE('�̸�:'||vename);
    DBMS_OUTPUT.PUT_LINE('����:'||vjob);
    DBMS_OUTPUT.PUT_LINE('�޿�:'||vsal);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('Exception:MANY_TOO_ROWS');
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Exception:�������͸� ã���� �����ϴ�.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Exception:�˼� ���� ���ܰ� �߻�');	
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
    DBMS_OUTPUT.PUT_LINE('******�����******');
    DBMS_OUTPUT.PUT_LINE('�̸�:'||vename);
    DBMS_OUTPUT.PUT_LINE('����:'||vjob);
    DBMS_OUTPUT.PUT_LINE('�μ�:'||vdname);
    DBMS_OUTPUT.PUT_LINE('�ٹ���:'||vloc);
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
    DBMS_OUTPUT.PUT_LINE('******�����******');
    DBMS_OUTPUT.PUT_LINE('�̸�:'||vemp.ename);
    DBMS_OUTPUT.PUT_LINE('����:'||vemp.job);
    DBMS_OUTPUT.PUT_LINE('�Ի���:'||vemp.hiredate);
    DBMS_OUTPUT.PUT_LINE('����:'||vemp.sal);
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
  DBMS_OUTPUT.PUT_LINE('******�����******');
  DBMS_OUTPUT.PUT_LINE('�̸�:'||m.ename);
  DBMS_OUTPUT.PUT_LINE('����:'||m.job);
  DBMS_OUTPUT.PUT_LINE('�μ�:'||m.dname);
  DBMS_OUTPUT.PUT_LINE('����:'||m.loc);
END;
/