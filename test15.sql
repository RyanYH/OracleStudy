--2016.03.23 자료실
/*
DROP TABLE databoard;
CREATE TABLE databoard(
   no NUMBER,
   name VARCHAR2(34) CONSTRAINT db_name_nn NOT NULL,
   subject VARCHAR2(1000) CONSTRAINT db_sub_nn NOT NULL,
   content CLOB CONSTRAINT db_cont_nn NOT NULL,
   pwd VARCHAR2(10) CONSTRAINT db_pwd_nn NOT NULL,
   regdate DATE DEFAULT SYSDATE,
   hit NUMBER DEFAULT 0,
   filename VARCHAR2(260),
   filesize NUMBER DEFAULT 0,
   CONSTRAINT db_no_pk PRIMARY KEY(no)
);
--자동증가번호
CREATE SEQUENCE db_no_seq 
             START WITH 1
             INCREMENT BY 1
             NOCYCLE
             NOCACHE;
--현재값 currentval, nextval
INSERT INTO databoard(no,name,subject,content,pwd,filename)
VALUES(db_no_seq.nextval,'홍길동','파일 없음','파일무','1234','');
INSERT INTO databoard(no,name,subject,content,pwd,filename)
VALUES(db_no_seq.nextval,'홍길동','파일 없음','파일무','1234','');
INSERT INTO databoard(no,name,subject,content,pwd,filename)
VALUES(db_no_seq.nextval,'홍길동','파일 없음','파일무','1234','');
INSERT INTO databoard(no,name,subject,content,pwd,filename)
VALUES(db_no_seq.nextval,'홍길동','파일 없음','파일무','1234','');
COMMIT;
*/
INSERT INTO databoard(no,name,subject,content,pwd,filename)
VALUES(db_no_seq.nextval,'홍길동','파일 없음','파일무','1234','');
INSERT INTO databoard(no,name,subject,content,pwd,filename)
VALUES(db_no_seq.nextval,'홍길동','파일 없음','파일무','1234','');
INSERT INTO databoard(no,name,subject,content,pwd,filename)
VALUES(db_no_seq.nextval,'홍길동','파일 없음','파일무','1234','');
INSERT INTO databoard(no,name,subject,content,pwd,filename)
VALUES(db_no_seq.nextval,'홍길동','파일 없음','파일무','1234','');