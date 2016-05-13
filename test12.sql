--2016.03.10 DDL
DROP TABLE freeboard;
CREATE TABLE freeboard(
    no NUMBER,
    name VARCHAR2(34) CONSTRAINT fb_name_nn NOT NULL,
    email VARCHAR2(50),
    subject VARCHAR2(10) CONSTRAINT fb_subject_nn NOT NULL,
    content CLOB CONSTRAINT fb_contnet_nn NOT NULL,
    pwd VARCHAR2(10) CONSTRAINT fb_pwd_nn NOT NULL,
    hit NUMBER DEFAULT 0,
    CONSTRAINT fb_no_pk PRIMARY KEY(no)
);
--¿€º∫¿œ
/*
ALTER TABLE freeboard
ADD regdate DATE DEFAULT SYSDATE;

ALTER TABLE freeboard
MODIFY subject VARCHAR2(4000);
DESC freeboard;
*/

ALTER TABLE freeboard
DROP COLUMN hit;

ALTER TABLE freeboard
ADD  hit NUMBER DEFAULT 0;

RENAME my_emp TO memp;
RENAME my_dept TO mdept;