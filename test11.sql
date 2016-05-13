/*
    JSP : 데이터 수집        - Oracle
    Spring : 데이터 분석   - MongoDB
    Hadoop : 시각화  
*/
-- 2016.03.10 DDL(Table)
/*

     TABLE  : 명칭 (식별자)
                   1) 알파벳이나 한글로 시작한다.
                       알파벳은 대소문자 구분이 없다.
                   2) 숫자 사용이 가능(앞에 사용 금지)
                   3) 문자 길이는 21자 사용이 가능하다
                        => 6~10 사이
                   4) 특수문자 ($,_)
                   5) 키워드는 사용 금지
          ** 한개의 데이터베이스(ORCL)안에서는  유일값
    TABLE의 구성요소
     1) 컬럼명
     2) 데이터형
          문자형
              CHAR(고정) : 1~2000Bytes
              VARCHAR2(가변) : 1~4000Byte 
              CLOB(가변) : 4GB
          숫자형
              NUMBER => -10^38~10^38
                  => 정수 NUMBER(10), 실수 NUMBER(10,2)
          날짜형
             DATE
             TIMESTAMP
          기타형
            BLOB(4GB)
            BFILE(4GB)
     3) 제약조건
         NOT NULL(NN)
          ename VARCHAR2(10) NOT NULL
          ename VARCHAR2(10) CONSTRAINT emp_ename_nn NOT NULL(권장)
         UNIQUE    (UK)
          empno NUMBER(4) UNIQUE
          empno NUMBER(4) CONSTRAINT emp_empno_uk UNIQUE(권장)
         PRIMARY KEY (PK) = NN + UK 
         empno NUMBER(4) PRIMARY KEY
         empno NUMBER(4) CONSTRAINT emp_empno_pk PRIMARY KEY
          (이상 현상)
        FOREIGN KEY(FK)
         deptno NUMBER(4) CONSTRAINT emp_deptno_fk FOREIGN
         REFERENCES dept(deptno)
        CHECK : 지정된 값만 사용
        job VARCHAR2(10) CHECK(job IN('A','B','C'))
         DEFAULT : 값이 없는 경우에 지정된 값을 설정
        regdate DATE DEFAULT SYSDATE

                             Table : emp
                            ================================================================
                              empno        ename         job        mgr     hiredate    sal     comm      deptno
                            ================================================================
NN/PK/FK/UK          PK              NN                          FK                        NN                      FK
                            ================================================================
참조테이블                                                                 emp                                                 dept
                            ================================================================
참조컬럼                                                                    empno                                             deptno
                            ================================================================
CHECK                                                         CK
                            ================================================================
데이터형                NUMBER     VAR2          VAR2     NUM       DATE       NUM     NUM      NUM
                            ================================================================
크기                           4              10               10         4                            7,2       7,2          2
                            ================================================================


                             Table : dept
                            ================================================================
                              deptno       dname         loc        
                            ================================================================
NN/PK/FK/UK          PK              NN           NN       
                            ================================================================
참조테이블                                                                
                            ================================================================
참조컬럼                                                                   
                            ================================================================
CHECK                                                    
                            ================================================================
데이터형                 NUMBER       VAR2        VAR2
                            ================================================================
크기                             4               14             13
                            ================================================================

  * 참조테이블인 dept테이블을 우선 생성
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

--제약조건 확인 : 테이블 명은 대문자
SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name='MY_EMP';
*/

--DROP TABLE dept;
SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name='EMP';