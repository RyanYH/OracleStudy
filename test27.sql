-- 2016.04.14 댓글형게시판
/*
CREATE TABLE reply_board(
       no NUMBER,
       name VARCHAR2(34) CONSTRAINT rb_name_nn NOT NULL,
       subject VARCHAR2(1000) CONSTRAINT rb_sub_nn NOT NULL,
       content CLOB CONSTRAINT rb_cont_nn NOT NULL,
       pwd VARCHAR2(10) CONSTRAINT rb_pwd_nn NOT NULL,
       regdate DATE DEFAULT SYSDATE,
       hit NUMBER DEFAULT 0,
      CONSTRAINT rb_no_pk PRIMARY KEY(no)		
);


CREATE TABLE reply(
     no NUMBER,
     bno NUMBER,
     id VARCHAR2(20) CONSTRAINT reply_id_nn NOT NULL,
     name VARCHAR2(34) CONSTRAINT  reply_name_nn NOT NULL,
     msg VARCHAR2(4000) CONSTRAINT reply_msg_nn NOT NULL,
     regdate DATE DEFAULT SYSDATE,
     group_id NUMBER,
     group_step NUMBER,
     group_tab NUMBER,
     root NUMBER,
     depth NUMBER,
     CONSTRAINT reply_no_pk PRIMARY KEY(no),
     CONSTRAINT reply_bno_fk FOREIGN KEY(bno)
     REFERENCES reply_board(no)
);
*/
/*
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(1,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(2,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(3,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(4,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(5,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(6,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(7,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(8,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(9,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(10,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(11,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(12,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(13,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(14,'홍길동','댓글형 게시판','마이바티스이용','1234');

INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(15,'홍길동','댓글형 게시판','마이바티스이용','1234');


INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(16,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(17,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(18,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(19,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(20,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(21,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(22,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(23,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(24,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(25,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(26,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(27,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(28,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(29,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(30,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(31,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(32,'홍길동','댓글형 게시판','마이바티스이용','1234');
INSERT INTO reply_board(no,name,subject,content,pwd)
VALUES(33,'홍길동','댓글형 게시판','마이바티스이용','1234');
*/

INSERT INTO reply VALUES(1,32,'hong','홍길동','댓글 달기 연습',
SYSDATE,1,0,0,0,1);
INSERT INTO reply VALUES(2,32,'hong','홍길동','댓글 달기 연습',
SYSDATE,1,1,1,1,1);
INSERT INTO reply VALUES(3,32,'hong','홍길동','댓글 달기 연습',
SYSDATE,1,2,2,2,0);
INSERT INTO reply VALUES(4,33,'hong','홍길동','댓글 달기 연습',
SYSDATE,2,0,0,0,1);
INSERT INTO reply VALUES(5,33,'hong','홍길동','댓글 달기 연습',
SYSDATE,2,1,1,4,1);
INSERT INTO reply VALUES(6,33,'hong','홍길동','댓글 달기 연습',
SYSDATE,2,2,2,5,0);
INSERT INTO reply VALUES(7,31,'hong','홍길동','댓글 달기 연습',
SYSDATE,3,0,0,0,1);
INSERT INTO reply VALUES(8,31,'hong','홍길동','댓글 달기 연습',
SYSDATE,3,1,1,7,0);
COMMIT;
