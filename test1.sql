-- 2016.02.22 ����Ŭ 1����(SELECT, ������)
/*
        ����Ŭ���� �����͸� �����ϴ� ���
        SQL
          = DML (������ ���� ���)
              1) SELECT (������ �˻�)
              2) INSERT  (������ �߰�)
              3) UPDATE (������ ����)
              4) DELETE (������ ����)
         = SELECT
            ����)
                    SELECT(�÷�1, �÷�2....)|*
                    FROM table ��
                    [
                       WHERE ���ǹ�(�÷��� ������ ��)
                       ===========================
                       GROUP BY �÷�(�׷�)
                       HAVING �׷� ����
                       ===========================
                       ORDER BY Į��  (ASC | DESC)
                    ]
            => WHERE���� ����ÿ��� �ݵ�� ����Ŭ���� �����ϴ� �����ڰ� �ʿ��ϴ�.
                  1) ������
                        = ��� ������ (+, -, *, /)
                        = ���� ������ (=,!=(<>),<,>,<=,>=)
                        = ���� ������ (=)
                        ��) 
                             UPDATE emp SET
                             ename = 'ȫ�浿'
                                       === ���Կ�����
                             WHERE empno = 7788;
                                                   === ���迬����
                         = �������� (AND, OR)
                         = ���������� (NOT)
                         = ��Ÿ
                              => BETWEEN ~AND : �Ⱓ�̳� ����
                              => LIKE : ���� ���ڿ� �˻�
                              => IN : OR�����ڸ� ��ü
                              => NULL�� ����ó�� �Ҽ��� ����.
                                   IS NULL
                                   IS NOT NULL
                  2) ����
                      ����) ORDER BY �÷� (ASC | DESC)
*/

-- emp�� ���̺� ���� Ȯ��
DESC emp;

/*
 EMPNO : ���(�ߺ�x)        NUMBER(4) 0~9999(65)
                                            => int 
 ENAME : �̸�                  VARCHAR2(10) 1~4000
 JOB : ����                        VARCHAR2(9)  1~4000
                                             => String
 MGR : �����ȣ                NUMBER(4)
 HIREDATE : �Ի���          DATE
                                             => java.util.Date
 SAL : �޿�                       NUMBER(7,2)
 COMM : ������                NUMBER(7,2)
                                             => double
 DEPTNO : �μ���ȣ         NUMBER(2) 0~99
*/

-- emp�� ����� ��� �����͸� �о� �´�
SELECT * FROM emp:

-- �ʿ��� �����͸� �о�´� (���, �̸�, �Ի���)
SELECT empno "���", ename "�̸�", hiredate "�Ի���" FROM emp;

-- �ζ��� ��
SELECT empno, ename, hiredate FROM (SELECT * FROM emp);
SELECT AVG(sal) FROM emp;

-- SUBQUERY
SELECT empno, ename, sal FROM emp WHERE sal<(SELECT AVG(sal) FROM emp);

SELECT ename, sal, rownum FROM 
  (SELECT ename, sal FROM emp ORDER BY sal DESC) 
  WHERE rownum <=5;


