-- 2016.02.25 ����Ŭ 2����
/*
      ����Ŭ���� �����ϴ� ���� �Լ�
      ������ �Լ�
         = �����Լ�
              UPPER
              LOWER
              INITCAP
           =========
              CONCAT
              SUBSTR *****
              INSTR
              LPAD  *****, RPAD
              LTRIM, RTRIM, TRIM
              LENGTH, LENGTHB
         = �����Լ� : Math
              CEIL
              ROUND *****
              TRUNC *****
              MOD
         = ��¥�Լ� : Date
              ADD_MONTHS
              MONTHS_BETWEEN  *****
              SYSDATE  *****
              LAST_DAY
              NEXT_DAY
         = ��ȯ�Լ� : Format
              TO_CHAR *****
                  YYYY, MM, DD, HH24, MI, SS
              TO_NUMBER
              TO_DATE
         = ��Ÿ�Լ�
              NVL  *****
              CASE
              DECODE
      ������ �Լ�    ======================> GROUP BY
          = AVG, SUM
          = MAX, MIN
          = COUNT
          = RANK
*/

/*
SELECT SUM(sal), AVG(sal), COUNT(*)
FROM emp
WHERE deptno = 10;
SELECT SUM(sal), AVG(sal), COUNT(*)
FROM emp
WHERE deptno = 20;
SELECT SUM(sal), AVG(sal), COUNT(*)
FROM emp
WHERE deptno = 30;

SELECT deptno,SUM(sal), AVG(sal), COUNT(*)
FROM emp
GROUP BY deptno;
*/

-- UPPER,LOWER,INITCAP
SELECT ename,UPPER(ename),LOWER(ename),INITCAP(ename)
FROM emp;
-- CONCAT
SELECT CONCAT('Hello','Java') FROM DUAL; 
SELECT 'Hello'||'Java' FROM DUAL;
--SUBSTR
SELECT SUBSTR('Oracle Mania',4,3) FROM DUAL;
SELECT SUBSTR('Oracle Mania',-4,3) FROM DUAL;

-- emp => ename���� 3���� �ڸ��� R�� �ִ� ����� �̸��� ���
SELECT ename from emp WHERE SUBSTR(ename,3,1) LIKE 'R' ;
SELECT ename from emp WHERE SUBSTR(ename,3,1) ='R' ;
SELECT ename FROM emp WHERE ename LIKE '_R% ';
-- INSTR
SELECT INSTR('Hello Java','a', 1) FROM DUAL;
-- emp => ename ���� ������ ���ڰ� N�� ����� �̸��� ���
SELECT ename From emp WHERE ename Like '%_N';
SELECT ename From emp WHERE INSTR(ename,'N',1)  = -1;

-- LPAD, RPAD
SELECT LPAD(ename,7, '*') FROM emp;
SELECT RPAD(SUBSTR(ename,1,3),LENGTH(ename),'*') FROM emp;
-- LTRIM, RTRIM, TRIM
SELECT LTRIM('aaaaabbbbbaaaaa','a') FROM DUAL;
SELECT RTRIM('aaaaabbbbbaaaaa','a') FROM DUAL;
SELECT TRIM('a' FROM 'aaaabbbbaaaa') FROM DUAL;
SELECT LTRIM('         Hello Java ') FROM DUAL;

-- LENGTH, LENGTHB
SELECT LENGTH('hong'), LENGTH('ȫ�浿') FROM DUAL;
SELECT LENGTHB('hong'), LENGTHB('ȫ�浿') FROM DUAL;

-- �����Լ�
-- CEIL
SELECT CEIL(COUNT(*)/10) FROM emp;
SELECT COUNT(*) FROM emp;
--ROUND
SELECT ROUND(10.567,1) FROM DUAL;
SELECT ROUND(10.567,0) FROM DUAL;
-- ����� n+1 ROUND(�Ǽ�, n)
SELECT TRUNC(10.567,2) FROM DUAL;
-- MOD => %
SELECT MOD(11,2) FROM DUAL;
SELECT empno, ename FROM emp WHERE MOD(empno,2) LIKE 1;
-- ��¥�Լ� SYSDATE
SELECT SYSDATE-1, SYSDATE, SYSDATE+1 FROM DUAL;
-- MONTHS_BETWEEN
SELECT ename, hiredate, 
TO_CHAR(ROUND(TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate),0) /12,0)*sal,'$99,999') FROM emp;
-- ADD MONTH
SELECT ADD_MONTHS(SYSDATE,6) FROM DUAL;
-- NEXT_DAY
SELECT NEXT_DAY(SYSDATE,'��') FROM DUAL;
-- LAST_DAY �Է��Ѵ��� ��������
SELECT LAST_DAY('16/03/01') FROM DUAL;
SELECT LAST_DAY(ADD_MONTHS(SYSDATE,1)) FROM DUAL;

--TO_CHAR
SELECT hiredate, TO_CHAR(hiredate,'YYYY/MM/DD HH24:MI:SS') FROM emp;
SELECT EXTRACT(YEAR FROM SYSDATE) "�⵵",
             EXTRACT(MONTH FROM SYSDATE) "��",
             EXTRACT(DAY FROM SYSDATE) "��"
FROM DUAL;

--��Ÿ �Լ�
SELECT ename,sal,comm,sal+NVL(comm,0) FROM emp;

-- DECODE
SELECT ename, hiredate, job,
    DECODE(deptno, 10, '������',
                               20, '�����',
                               30, '�ѹ���') dname
FROM emp;

SELECT ename, hiredate, job,
    CASE
    WHEN deptno=10 THEN '������'
WHEN deptno=20 THEN '������'
WHEN deptno=30 THEN '�ѹ���'
END dname
FROM emp;
-- ���� �Լ�
-- ��� �Լ�
SELECT TRUNC(AVG(sal),0) FROM emp;

SELECT ename, sal FROM emp WHERE sal >2073;
SELECT ename, sal FROM emp WHERE sal<(SELECT AVG(sal) FROM emp);
SELECT SUM(sal) FROM emp;
-- ROW�� ����
SELECT COUNT(mgr), COUNT(*) FROM emp;
-- MAX MIN : �����Լ��̱� ������ �����߻�
SELECT ename,MAX(sal), MIN(sal) FROM emp;
-- ���� ����
SELECT MAX(sal), MIN(sal) FROM emp;
-- RANK
SELECT ename,job,sal,RANK() OVER(ORDER BY sal DESC) rnd
FROM emp;

/*
   COUNT : ID �ߺ�üũ, ������, �α��� ó��
   MAX : �ڵ� ���� ��ȣ
   NVL : NULL ���� ��ü
   RANK : �ð�ȭ ����
   TO_CHAR : �ð�, ��¥�� ��ȯ 
*/
