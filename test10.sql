/*
 INSERT
  1. 필요한 데이터만 첨부 : INSERT INTO table명(컬럼명) VALUES(값1, 값2..._);
  2. 전체 데이터 첨부 : INSERT INTO table명 VALUES(값1, 값2, 값3...) 
  3. 여러 ROW 동시 첨부 : INSERT INTO table명 SELECT * FROM emp;
  4. 여러 테이블에 나눠서 첨부 : INSERT ALL WHEN 조건 THEN INTO table명
                                                                   WHEN 조건 THEN INTO table명
                                                             ...    ELSE INTO table명
                                              SELECT ~
  UPDATE 
  1. UPDATE table명 SET 컬럼명 = 값, 컬러명 = 값....

   ****** 제약 조건 : 1. NOT NULL        - '*'
                                2. PRIMARY KEY(수정, 삭제 대상X)   
                                3. FOREIGN KEY   - 콤보박스     
                                4, CHECK              - 콤보박스
  
  DELETE
  1. DELETE FROM table WHERE 조건
*/