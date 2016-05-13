--2016.03.10 DDL
--ȸ������ : ID �ߺ�üũ, �����ȣ �˻�
/*
 ID          PK        VARCHAR2
 PWD       NN      VARCHAR2
 NAME     NN      VARCHAR2
 SEX        NN      VARCHAR2
 BIRTH    NN      VARCHAR2
 PHONE             VARCHAR2
 POST     NN      VARCHAR2   000-111
 ADDR1   NN      VARCHAR2
 ADDR2              VARCHAR2
 CONTENT         CLOB
 EMAIL               VARCHAR2
 REGDATE          DATE
*/
/*
conn system/1234
GRANT CREATE VIEW TO scott;
conn scott/tiger
CREATE VIEW emp_view
AS SELECT * FROM emp READ ONLY OPTION;
SELECT * FROM emp_view;
*/
/*
DROP TABLE member;
CREATE TABLE member(
        id VARCHAR2(20),
        pwd VARCHAR2(20) CONSTRAINT member_pwd_nn NOT NULL,
        name VARCHAR2(34) CONSTRAINT member_name_nn NOT NULL,
        sex CHAR(4),
        birth VARCHAR2(10) CONSTRAINT member_birth_nn NOT NULL,
        phone VARCHAR2(13) CONSTRAINT member_phone_nn NOT NULL,
        post VARCHAR2(7) CONSTRAINT member_post_nn NOT NULL,
        addr1 VARCHAR2(150) CONSTRAINT member_addr1_nn NOT NULL,
        addr2 VARCHAR2(100),
        content CLOB,
        regdate DATE DEFAULT SYSDATE,
        CONSTRAINT member_id_pk PRIMARY KEY(id),
        CONSTRAINT member_sex_ck CHECK(sex IN('����','����'))
);
INSERT INTO member VALUES('hong','1234','ȫ�浿','����','2000-10-12','010-1111-1111'
,'000-000','����� ������ �����','','�����ϱ� û���̴�.',SYSDATE);
COMMIT;

INSERT INTO member VALUES('ang','1234','ȫ�浿','����','2000-10-12','010-1111-1112'
,'000-000','����� ������ �����','','�����ϱ� û���̴�.',SYSDATE);
COMMIT;
INSERT INTO member VALUES('bang','1234','������','����','2000-11-12','010-1111-1121'
,'000-000','����� ������ �����','','�����ϱ� û���̴�.',SYSDATE);
COMMIT;
INSERT INTO member VALUES('cang','1234','�̱浿','����','2000-09-12','010-1111-1211'
,'000-000','����� ������ �����','','�����ϱ� û���̴�.',SYSDATE);
COMMIT;
INSERT INTO member VALUES('dang','1234','������','����','2000-01-12','010-1111-2111'
,'000-000','����� ������ �����','','�����ϱ� û���̴�.',SYSDATE);
COMMIT;
INSERT INTO member VALUES('eang','1234','�踻��','����','2000-07-12','010-2111-1111'
,'000-000','����� ������ �����','','�����ϱ� û���̴�.',SYSDATE);
COMMIT;
INSERT INTO member VALUES('fang','1234','������','����','2000-10-29','010-1121-1111'
,'000-000','����� ������ �����','','�����ϱ� û���̴�.',SYSDATE);
COMMIT;
INSERT INTO member VALUES('gang','1234','���ϱ�','����','2000-11-12','010-1211-1111'
,'000-000','����� ������ �����','','�����ϱ� û���̴�.',SYSDATE);
COMMIT;
INSERT INTO member VALUES('hang','1234','������','����','2000-10-18','010-1112-1111'
,'000-000','����� ������ �����','','�����ϱ� û���̴�.',SYSDATE);
COMMIT;
*/
/*
ALTER TABLE member ADD logcount NUMBER;
UPDATE member SET
logcount=7 WHERE id='hong';
UPDATE member SET
logcount=5 WHERE id='ang';
UPDATE member SET
logcount=10 WHERE id='bang';
COMMIT;
*/
UPDATE member SET
logcount=1
WHERE id NOT IN('hong','bang','ang');
COMMIT;