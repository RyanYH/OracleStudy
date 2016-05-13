-- 2016.05.02 VIEW

/*
       VIEW : �������̺�(�̹� �����ϴ� ���̺��� �����ؼ� SQL������ �����ؼ� ���)
                   = 1) �ܼ��� SQL������ ����� �� �ִ�.(���������� ����)
	      2) ���Ƚ� ����� �ȴ�
	  = ����
	      1) �ܼ��� : ���̺� �Ѱ� ����
	      2) ���պ� : ���̺� �Ѱ��̻� ����
	      3) �ζ��κ� : SELECT ~~(SELECT)
	  = �ɼ�
	      1) WITH CHECK OPTION(INSERT,UPDATE,DELETE)
	      2) WITH READ ONLY(�б�����)
	  = ����� ������ �並 ������ ������ ����.
	     ���Ѻο�
	       ===> GRANT CREATE VIEW TO scott 
	       ===> REVOKE CREATE VIEW FROM scott
	 = ����
	    1) ����
	        CREATE VIEW view_name AS (SELECT ~~)
 	    2) ����
	        DROP VIEW view_name;
	    3) ����
	       CREATE OR REPLACE VIEW view_name AS (SELECT ~~)
*/

/*
-- ���� �ο� (system, sysdba) ==> conn /as sysdba
conn system/tiger;
GRANT CREATE VIEW TO scott;
conn scott/tiger;

-- �ܼ� ��
CREATE OR REPLACE VIEW dept_view AS
SELECT * FROM dept;
SELECT * FROM dept_view;

*/
/*
-- �信�� ������ �߰�
INSERT INTO dept_view VALUES((SELECT NVL(MAX(deptno)+10,10) FROM dept_view),'������','����');
COMMIT;
SELECT * FROM dept_view;
*/

/*
-- �信�� ������ ����
UPDATE dept_view SET
loc='����'
WHERE deptno=50;
COMMIT;
SELECT * FROM dept_view;
SELECT * FROM dept;

*/

/*
--�信�� ������ ����
DELETE  FROM dept_view
WHERE deptno=50;
COMMIT;
SELECT * FROM dept_view;
SELECT * FROM dept;
*/
/*
--�����
--DROP VIEW dept_view;

CREATE OR REPLACE VIEW dept_view
AS SELECT * FROM dept
WITH READ ONLY;
INSERT INTO dept_view VALUES((SELECT NVL(MAX(deptno)+10,10) FROM dept_view),'������','����');
COMMIT;
*/
/*
--���պ�
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

--�ζ��κ�
SELECT empno,ename,sal,rownum
FROM (SELECT empno,ename,sal FROM emp ORDER BY sal DESC)
WHERE rownum<=5;

--�޿��� 3~7���� ����̸�, �޿��� ���
SELECT ename,sal, num
FROM(SELECT ename,sal, rownum as num
FROM(SELECT ename,sal FROM emp 
         ORDER BY sal DESC))
WHERE num BETWEEN 3 and 7;