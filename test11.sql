/*
    JSP : ������ ����        - Oracle
    Spring : ������ �м�   - MongoDB
    Hadoop : �ð�ȭ  
*/
-- 2016.03.10 DDL(Table)
/*

     TABLE  : ��Ī (�ĺ���)
                   1) ���ĺ��̳� �ѱ۷� �����Ѵ�.
                       ���ĺ��� ��ҹ��� ������ ����.
                   2) ���� ����� ����(�տ� ��� ����)
                   3) ���� ���̴� 21�� ����� �����ϴ�
                        => 6~10 ����
                   4) Ư������ ($,_)
                   5) Ű����� ��� ����
          ** �Ѱ��� �����ͺ��̽�(ORCL)�ȿ�����  ���ϰ�
    TABLE�� �������
     1) �÷���
     2) ��������
          ������
              CHAR(����) : 1~2000Bytes
              VARCHAR2(����) : 1~4000Byte 
              CLOB(����) : 4GB
          ������
              NUMBER => -10^38~10^38
                  => ���� NUMBER(10), �Ǽ� NUMBER(10,2)
          ��¥��
             DATE
             TIMESTAMP
          ��Ÿ��
            BLOB(4GB)
            BFILE(4GB)
     3) ��������
         NOT NULL(NN)
          ename VARCHAR2(10) NOT NULL
          ename VARCHAR2(10) CONSTRAINT emp_ename_nn NOT NULL(����)
         UNIQUE    (UK)
          empno NUMBER(4) UNIQUE
          empno NUMBER(4) CONSTRAINT emp_empno_uk UNIQUE(����)
         PRIMARY KEY (PK) = NN + UK 
         empno NUMBER(4) PRIMARY KEY
         empno NUMBER(4) CONSTRAINT emp_empno_pk PRIMARY KEY
          (�̻� ����)
        FOREIGN KEY(FK)
         deptno NUMBER(4) CONSTRAINT emp_deptno_fk FOREIGN
         REFERENCES dept(deptno)
        CHECK : ������ ���� ���
        job VARCHAR2(10) CHECK(job IN('A','B','C'))
         DEFAULT : ���� ���� ��쿡 ������ ���� ����
        regdate DATE DEFAULT SYSDATE

                             Table : emp
                            ================================================================
                              empno        ename         job        mgr     hiredate    sal     comm      deptno
                            ================================================================
NN/PK/FK/UK          PK              NN                          FK                        NN                      FK
                            ================================================================
�������̺�                                                                 emp                                                 dept
                            ================================================================
�����÷�                                                                    empno                                             deptno
                            ================================================================
CHECK                                                         CK
                            ================================================================
��������                NUMBER     VAR2          VAR2     NUM       DATE       NUM     NUM      NUM
                            ================================================================
ũ��                           4              10               10         4                            7,2       7,2          2
                            ================================================================


                             Table : dept
                            ================================================================
                              deptno       dname         loc        
                            ================================================================
NN/PK/FK/UK          PK              NN           NN       
                            ================================================================
�������̺�                                                                
                            ================================================================
�����÷�                                                                   
                            ================================================================
CHECK                                                    
                            ================================================================
��������                 NUMBER       VAR2        VAR2
                            ================================================================
ũ��                             4               14             13
                            ================================================================

  * �������̺��� dept���̺��� �켱 ����
*/
/*
DROP TABLE my_dept;
DROP TABLE my_emp;
CREATE TABLE my_dept(
    deptno NUMBER(2),
    dname VARCHAR2(14)  CONSTRAINT md_dname_nn NOT NULL,
    loc VARCHAR2(13) CONSTRAINT md_loc_nn NOT NULL,
    CONSTRAINT md_deptno_pk PRIMARY KEY(deptno)
);

CREATE TABLE my_emp(
    empno NUMBER(4),
    ename VARCHAR2(10) CONSTRAINT me_ename_nn NOT NULL,
    job VARCHAR2(10),
    mgr NUMBER(4),
    hiredate DATE DEFAULT SYSDATE,
    sal  NUMBER(7,2) CONSTRAINT me_sal_nn NOT NULL,
    comm NUMBER(7,2),
    deptno NUMBER(2),
    CONSTRAINT me_empno_pk PRIMARY KEY(empno),
    CONSTRAINT me_job_ck  CHECK(job IN ('CLECK','MANAGER','SALES')),
    CONSTRAINT me_mgr_fk FOREIGN KEY(mgr)
    REFERENCES emp(empno),
    CONSTRAINT me_deptno_fk FOREIGN KEY(deptno)
    REFERENCES dept(deptno)
);

--�������� Ȯ�� : ���̺� ���� �빮��
SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name='MY_EMP';
*/

--DROP TABLE dept;
SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name='EMP';