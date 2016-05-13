--2016.03.15 게시판

DROP TABLE board;
CREATE TABLE board(
     no NUMBER,
     name VARCHAR2(34) CONSTRAINT board_name_nn NOT NULL,
     subject VARCHAR2(1000) CONSTRAINT board_sub_nn NOT NULL,
     content CLOB CONSTRAINT board_cont_nn NOT NULL,
     pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
     regdate DATE DEFAULT SYSDATE,
     hit NUMBER DEFAULT 0,
     group_id NUMBER, 
     group_step NUMBER DEFAULT 0,
     group_tab NUMBER DEFAULT 0,
     root NUMBER DEFAULT 0,
    depth NUMBER DEFAULT 0,
    CONSTRAINT board_no_pk PRIMARY KEY(no)
);
/*
       ORDER BY gi DESC, gs ASC
                                                  그룹     출력순서       깊이         부모노드       자식노드
                                      no           gi          gs               gt             root             depth
         AAAAA                   1              2          0                0                0                   1
            =>BBBBBB           3              2          1                 1                1                   1
              =>CCCCC          4              2          2                 2                3                   0
        DDDDD                   2              1          0                 0                0                   2
           =>EEEEE              5              1          1                 1                2                   0
           =>FFFFF              6              1          2                 1                2                   0
*/

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));


INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

INSERT INTO board(no,name,subject,content,pwd,group_id)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
(SELECT NVL(MAX(group_id)+1,1) FROM board));

UPDATE board SET
depth=depth+1
WHERE no=26;

INSERT INTO board(no,name,subject,content,pwd,group_id,group_step,group_tab,root,depth)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
26,1,1,26,1);

INSERT INTO board(no,name,subject,content,pwd,group_id,group_step,group_tab,root,depth)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'구체화',
'답변형 게시판 제작', '답변형 게시판....','1234',
26,2,2,27,0);


COMMIT;