-- 2016. 03. 03 SUBQUERY
/*
        JOIN : ������ + ������
        SUBQUERY : SQL + SQL
       ===========
           ����
                           Main-Query = (Sub-QUERY)
                           ������������ ���� ������� ������������ ó���ϴ� ���
                            1) ���� ����
                            2) ���� ����
           �����ġ
                 �������� = SELECT, INSERT, UPDATE, DELETE, CREATE
                               = �ζ��κ� => ������ ������ ���
           ��)
                    SELECT AVG(sal) FROM emp; => 2073
                    SELECT ename, sal, hiredate FROM emp
                    WHERE sal < 2073;
                     => SELECT ename, sal, hiredate FROM emp
                          WHERE sal<(SELECT AVG(sal) FROM emp);

               ���� 
                   = ������ �������� : ������� 1���ϰ��
                   = ������ �������� : ������� ������
                           ���ÿ� ó��   =>  IN
                           ���� ū��      => ALL   => MAX
                           ���� ���� ��  => ANY  => MIN
                     
*/

-- ����߿� ��� �޿����� �۰� �޴� ����� �̸�, �޿�, �Ի��� ���
/*
SELECT ename, sal, hiredate FROM emp
WHERE sal<(SELECT AVG(sal) FROM emp)
ORDER BY sal DESC;
*/
-- KING�� �μ���� �ٹ����� ��� �϶�
/*
     1. KING�� deptno�� Ȯ��
     2. deptno => dept����
*/
/*
SELECT dname, loc
FROM dept 
WHERE deptno = (SELECT deptno FROM emp WHERE ename ='KING'); 

-- �μ����� SALES �μ� ����� ���� ���� �޿��� �޴� ����� �޿��� ���

SELECT max(sal) 
FROM emp
WHERE deptno=(SELECT deptno FROM dept WHERE dname='SALES');

-- SMITH���� �޿��� ���� �޴� ����� �̸��� �޿��� ���
SELECT ename, sal
FROM emp
WHERE sal>(SELECT sal FROM emp WHERE ename='SMITH');

--10�� �μ��� ������ ���� �޿��� �޴� ����� �̸��� �޿��� �μ���ȣ ���

SELECT ename, sal, deptno
FROM emp
WHERE sal IN(SELECT sal FROM emp WHERE deptno = 20)
AND deptno <>20;
*/

--BLAKE�� ���� �μ��� �ִ� ����� �̸��� �Ի���, ���� ���
--BLAKE�� ���ܸ� �Ѵ�.
/*
SELECT ename, hiredate, job
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename = 'BLAKE')
AND ename <> 'BLAKE';

-- ��� �޿����� ���� �޴� ����� ���, �̸�, �޿��� ���
-- �޿��� ���� ������ ���
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT avg(sal) FROM emp)
ORDER BY sal DESC;

--30�� �μ��� �ְ� �޿��� �޴� ������� �� ���� �޴� ����� �̸��� 
--�޿��� ���

SELECT ename, sal
FROM emp
WHERE sal > (SELECT max(sal) FROM emp WHERE deptno=30);

SELECT ename, sal
FROM emp
WHERE sal >ALL(SELECT sal FROM emp WHERE deptno=30);

SELECT ename, sal
FROM emp
WHERE sal >ANY(SELECT sal FROM emp WHERE deptno=30);

-- KING���� �����ϴ� ��� ����� �̸��� �޿��� ���
SELECT ename, sal
FROM emp
WHERE mgr = (SELECT empno FROM emp WHERE ename='KING');

SELECT ename, sal
FROM emp
WHERE mgr = (SELECT empno FROM emp WHERE mgr IS NULL);
*/
-- ����� �μ���ȣ, ����, �ο����� ���

SELECT deptno "�μ���ȣ", job "����", count(*) "�����"
FROM emp
GROUP BY (deptno, job)
ORDER BY deptno ASC, job ASC;

-- �μ���ȣ, �ο���, (�޿�)�ִ밪, �ּҰ�, �ο����� 3�������� �μ��� ���
-- WHERE���� count�Լ� ��� �Ұ��� => HAVING���
SELECT  deptno, count(*), max(sal), min(sal)
FROM emp
GROUP BY deptno
HAVING COUNT(deptno) <=3;

--�Ի��� �⵵ ���� �׷� �ο���, �޿��� ���
SELECT TO_CHAR(hiredate,'YYYY'), count(*), avg(sal)
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY');

SELECT EXTRACT(YEAR FROM hiredate), count(*), avg(sal)
FROM emp
GROUP BY EXTRACT(YEAR FROM hiredate);

SELECT SUBSTR(hiredate,1,2), count(*), avg(sal)
FROM emp
GROUP BY SUBSTR(hiredate,1,2);

-- �μ���, ���� 

SELECT dname,job,count(*)
FROM emp e JOIN dept d
ON e.deptno = d.deptno 
GROUP BY (dname,job)
ORDER BY dname ASC, job ASC;

-- emp�ȿ��� �� �μ� ��ȣ�� �ߺ����� ���
SELECT DISTINCT deptno
FROM emp;

-- ������, �μ����� �׷����� �޿��� �ִ밪, �ּҰ�, �ο���
SELECT EXTRACT(year from hiredate) AS "������", dname, max(sal), min(sal), count(*)
FROM emp e JOIN dept d
ON e.deptno = d.deptno
GROUP BY ( EXTRACT(year from hiredate), dname);

--10�� �μ� ����߿��� 30�� �μ��� ���� ������ �ϴ� ����� �����ȣ
-- �̸�, �μ���, �ٹ��� ���
SELECT empno, ename, dname, loc
FROM emp e JOIN dept d
ON e.deptno = d.deptno AND
e.deptno = 10 AND job NOT IN(SELECT JOB FROM emp WHERE deptno=30);

-- �޿��� 30���� �μ����� �ְ��� �޿����� ���� ����� ����� �̸�, �޿�, ���

SELECT empno, ename, sal
FROM emp
WHERE sal > ALL(SELECT sal FROM emp WHERE deptno =30);
--WHERE sal > (SELECT max(sal) FROM emp WHERE deptno =30);

SELECT empno, ename, job, dname, loc, (SELECT avg(sal) FROM emp) avg
FROM (SELECT empno, ename, job, dname, loc
            FROM emp, dept
            WHERE emp.deptno = dept.deptno);

SELECT empno, ename, job, hiredate, rn
FROM (SELECT empno, ename, job, hiredate,sal, rownum as rn
FROM (SELECT empno, ename, job, hiredate,sal FROM emp ORDER BY sal DESC))
WHERE rn BETWEEN 1 AND 5;

SELECT empno, ename, job, hiredate, rn
FROM (SELECT empno, ename, job, hiredate,sal, rownum as rn
FROM (SELECT empno, ename, job, hiredate,sal FROM emp ORDER BY sal DESC))
WHERE rn BETWEEN 6 AND 10;