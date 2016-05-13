--2016.03.07 SubQuery

--1. ��� ��ȣ�� 7788�� ����� ������ �μ���ȣ�� ��ġ�ϴ� �����
--�̸��� ������ �μ���ȣ, �Ի����� ���
--�����÷� ��������

SELECT ename, job, deptno, hiredate
FROM emp
WHERE (deptno, job) = (SELECT deptno, job FROM emp WHERE empno = 7788);

--2. 10�� �μ��� ������ ���� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� cnffur
--���� �� ��������
SELECT ename, sal, deptno 
FROM emp
WHERE sal IN (SELECT sal FROM emp WHERE deptno =10);
-- ANY ALL

--3. comm�� �޴� ����� �μ���ȣ, �޿��� ���� ����� �̸�, �޿�, �μ���ȣ ���
-- ������+�����÷� ��������
SELECT ename, sal, deptno FROM emp
WHERE (deptno, sal)  NOT
IN (SELECT deptno, sal FROM emp WHERE comm IS NOT NULL AND comm<>0);

--4.  DALLAS���� �ٹ��ϴ� ����� �޿� ��պ��� ���� �޴� ����� �̸��� �޿��� ������ ���
--���߼�������
SELECT ename, sal, job FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE loc='DALLAS' ));

--5. 20�� �μ��� �ο����� �� ���� �ο��� �ִ� �μ��� �μ���ȣ, �ο����� ���
SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno
HAVING COUNT(*)>(SELECT COUNT(*) FROM emp WHERE deptno = 20);

--6.1981�� 6�� 1�� ~ 1981�� 12�� 31�� �Ի��� ��� �� �� �μ����� SALES�� ����� �μ���ȣ
--, �̸�, ����, �Ի��� ��� (�Ի��� �ø�����)
SELECT ename, job, hiredate FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE dname='SALES')
AND hiredate BETWEEN '81/6/1' AND '81/12/31'
ORDER BY hiredate ASC;