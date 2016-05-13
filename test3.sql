-- 2016.02.29 JOIN
/*
    JOIN
      = ���� �ٸ� ���̺��� ���ϴ� ������ ����
    1) ����
         INNER JOIN
              = EQUI-JOIN(=)
              = NON-EQUI-JOIN(=�� �ƴ� ������)
         OUTER JOIN
              = LEFT OUTER JOIN
              = RIGHT OUTER JOIN
              = FULL OUTER JOIN
     2) ����
         INNER JOIN
              = SELECT A.a, B.b
                 FROM A, B
                 WHERE A.c = B.c => Oracle Type
              = SELECT A.a, B.b
                 FROM A JOIN B
                 ON A.c = B.c        => Ansi Type
               *********** ���̺��� ���� �÷����� ���� ������
                JOIN-USING
                NATURAL JOIN
*/

/*
          emp : �������
              empno
              ename
              job
              mgr
              hiredate
              sal
              comm
              deptno =====================> Foreign Key
          dept : �μ�����
              deptno =====================> Primary Key
              dname : �μ���
              loc : �ٹ���
              
           ����� ���, �̸�, ����, �μ���, �ٹ��� , �μ���ȣ
                      =============  ===========   ========
                            emp                   dept            �߽����̺� : emp
-----------------------------------------------------------------------------------
                    SELECT empno, ename, job, dname, loc, emp.deptno(e.deptno)
                    FROM emp, dept
                              ==========
                              emp e, dept d
                    WHERE emp.deptno(e.deptno) = dept.deptno(d.deptno);             <ORACLE JOIN>
-----------------------------------------------------------------------------------
                    SELECT empno, ename, job, dname, loc, emp.deptno(e.deptno)
                    FROM emp JOIN dept
                              ==========
                              emp e, dept d
                    ON emp.deptno(e.deptno) = dept.deptno(d.deptno); 
                    ==
                    ����                                                                                             <ANSI JOIN>
-----------------------------------------------------------------------------------
                    SELECT empno, ename, job, dname, loc, deptno
                    FROM emp JOIN dept
                    USING(deptno)                                                                             <JOIN USING>
-----------------------------------------------------------------------------------                                SELECT empno, ename, job, dname, loc, deptno
                    FROM emp NATURAL JOIN dept                                                   <NATURAL JOIN>
-----------------------------------------------------------------------------------
       
*/

-- NATURAL JOIN
SELECT empno, ename, job, dname, loc, deptno
FROM emp NATURAL JOIN dept;

-- JOIN-USING
SELECT empno, ename, job, dname, loc, deptno
FROM emp JOIN dept
USING(deptno);

--ANSI JOIN
SELECT empno, ename, job, dname, loc, emp.deptno
FROM emp JOIN dept
ON emp.deptno = dept.deptno;

--ORACLE JOIN
SELECT empno, ename, job, dname, loc, emp.deptno
FROM emp,dept
WHERE emp.deptno(+)= dept.deptno;

--SELF JOIN
SELECT e1.empno "���� ���", e1.ename "���� �̸�", e2.empno "������", e2.ename "����̸�"
FROM emp e1, emp e2
WHERE e1.mgr = e2. empno(+);
