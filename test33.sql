--2016.05.03 PL/SQL
/*
   	���
	  = ���ǹ�
	     1) �������ǹ�
      	         IF(���ǹ�) THEN
 	             ó��
	         END IF;
	     2) �������ǹ�
	         IF(���ǹ�) THEN
	             ó��
 	         ELSE
	             ó��
	         END IF;
	     3) �������ǹ�
	         IF(���ǹ�) THEN
	              ó��
	         ELSIF (���ǹ�)  THEN
	              ó��
	         ELSIF (���ǹ�)  THEN
	              ó��
                         ELSE 
	              ó��
	         END IF;
	 = ���ù�
	         CASE
	           WHEN ���ǹ� THEN
 		ó��
	           WHEN ���ǹ� THEN
 		ó��
	           WHEN ���ǹ� THEN
 		ó��
	           END;
	 = �ݺ���
	        FOR ������ IN 1..9 LOOP
		ó��
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
          vdname:='������';
    END IF;
     IF(vemp.deptno=20) THEN 
          vdname:='��ȹ��';
    END IF;
     IF(vemp.deptno=30) THEN 
          vdname:='�����';
    END IF;
     IF(vemp.deptno=40) THEN 
          vdname:='�ѹ���';
    END IF;
    DBMS_OUTPUT.PUT_LINE('****���****');
    DBMS_OUTPUT.PUT_LINE('�̸�:'||vemp.ename);
    DBMS_OUTPUT.PUT_LINE('�μ���:'||vdname);
END;
/
*/
/*
--���� IF��
DECLARE
    vdname dept.dname%TYPE;
    vemp emp%ROWTYPE;
BEGIN
     SELECT * INTO vemp
     FROM emp
     WHERE empno=7788;
     IF(vemp.deptno=10) THEN 
          vdname:='������';   
     ELSIF(vemp.deptno=20) THEN 
          vdname:='��ȹ��';    
     ELSIF(vemp.deptno=30) THEN 
          vdname:='�����';   
     ELSIF(vemp.deptno=40) THEN 
          vdname:='�ѹ���';
    ELSE
         vdname:='����';
    END IF;
    DBMS_OUTPUT.PUT_LINE('****���****');
    DBMS_OUTPUT.PUT_LINE('�̸�:'||vemp.ename);
    DBMS_OUTPUT.PUT_LINE('�μ���:'||vdname);
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
    DBMS_OUTPUT.PUT_LINE(vename||'���� �������� '||vcomm||'�Դϴ�.');  
    ELSE
     DBMS_OUTPUT.PUT_LINE(vename||'���� �������� �����ϴ�.');
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
                WHEN 10 THEN '������'
	WHEN 20 THEN '��ȹ��'
	WHEN 30 THEN '�����'
	WHEN 40 THEN '�ѹ���'
	END;
    DBMS_OUTPUT.PUT_LINE('****���****');
    DBMS_OUTPUT.PUT_LINE('�̸�:'||vemp.ename);
    DBMS_OUTPUT.PUT_LINE('�μ���:'||vdname);
END;
/