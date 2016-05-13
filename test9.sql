--2016.03.07 DML
/*
    DQL : SELECT
    DML : ������ ���۾��
      = INSERT
         - ���ϴ� �����͸� �߰�
             INSERT INTO table��(�÷�1, �÷�2,...)
             VALUE(�÷�1��,  �÷�2��...);
         - ��ü �����͸� �߰�
             INSERT INTO table��(*)
             VALUES(���̺� ����1 �÷���....)
      = UPDATE
         -
         -
      = DELETE
      = MERGE 
   ======================================> �����ͺ��̽� ����
                           ���� : COMMIT
                           ��� : ROLLBACK => Ʈ�����
*/
--  ���̺� ���� ====> ORCL(����)
/*
DROP TABLE myEmp;

CREATE TABLE myEmp
AS SELECT * FROM emp;
*/
/*
DELETE FROM myEmp;
SELECT * FROM myEmp;
--COMMIT;
ROLLBACK;
SELECT * FROM myEmp;

      myEmp
 ---------------------------
 EMPNO              NUMBER(4)
 ENAME              VARCHAR2(10)
 JOB                    VARCHAR2(9)
 MGR                  NUMBER(4)
 HIREDATE         DATE
 SAL                   NUMBER(7,2)
 COMM               NUMBER(7,2)
 DEPTNO           NUMBER(2)
*/

/*
--INSERT INTO myEmp VALUES((SELECT MAX(empno)+1 FROM emp), 
INSERT INTO myEmp VALUES(8000, 'ȫ�浿', 'MANAGER', 7788, '15/03/05', 3000, 1000, 10);
COMMIT;
INSERT INTO myEmp(empno,ename,job,hiredate,sal,deptno)
VALUES(8001, '����ġ', 'SALES', SYSDATE, 2400, 30);
COMMIT;
INSERT INTO myEmp(empno,deptno)
VALUES(8002,20);
SELECT empno,hiredate FROM myEmp;
SELECT empno, NVL(hiredate,SYSDATE) FROM myEmp;
*/
/*
INSERT INT myEmp
SELECT * FROM emp;
COMMIT;
SELECT * FROM myEmp;
*/
/*
TRUNCATE TABLE myEmp;
SELECT * FROM myEmp;
*/
/*
ALTER TABLE myEmp ADD dname VARCHAR2(20);
ALTER TABLE myEmp ADD loc VARCHAR2(20);
ALTER TABLE myEmp ADD grade NUMBER(1);
ALTER TABLE myEmp DROP (comm);
ALTER TABLE myEmp DROP (mgr);
INSERT INTO myEmp
SELECT empno, ename, job, hiredate, sal, emp.deptno, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal;

SELECT * FROM myEmp;
*/
/*
CREATE TABLE myEmp2
AS SELECT * FROM emp;

CREATE TABLE myEmp3 
AS SELECT * FROM emp;

TRUNCATE TABLE myEmp2;
TRUNCATE TABLE myEmp3;

CREATE TABLE myEmp4
AS SELECT * FROM emp;
TRUNCATE TABLE myEmp4;
*/
/*
INSERT ALL
WHEN deptno =10 THEN
         INTO myEmp2
WHEN deptno =20 THEN
         INTO myEmp3
WHEN deptno =30 THEN
         INTO myEmp4
SELECT * FROM emp;
*/

SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name='EMP';