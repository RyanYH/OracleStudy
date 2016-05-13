/*
-- 2016.05.13 PL/SQL (PROCEDURE)
-- 게시판 목록 보기
CREATE OR REPLACE PROCEDURE boardAllData(
   pStart IN board.no%TYPE,
   pEnd IN board.no%TYPE,
   pResult OUT SYS_REFCURSOR
)
IS 
BEGIN
   OPEN pResult FOR
    SELECT no,subject,name,regdate,hit,group_tab,num
    FROM (SELECT no,subject,name,regdate,hit,group_tab,rownum as num
    FROM (SELECT no,subject,name,regdate,hit,group_tab 
    FROM board ORDER BY group_id DESC,group_step ASC ))
    WHERE num BETWEEN pStart AND pEnd;
END;
/
-- 총페이지 
CREATE OR REPLACE PROCEDURE boardTotalPage(
   pCount OUT board.no%TYPE
)
IS
BEGIN
   SELECT CEIL(COUNT(*)/10) INTO pCount
   FROM board;
END;
/
--INSERT
CREATE OR REPLACE PROCEDURE boardInsert(
    pName board.name%TYPE,
    pSubject board.subject%TYPE,
    pContent board.content%TYPE,
    pPwd board.pwd%TYPE  
)
IS
BEGIN
    INSERT INTO board VALUES((SELECT NVL(MAX(no)+1,1) FROM board),
                 pName,pSubject,pContent,pPwd,
	 SYSDATE,0,
                 (SELECT NVL(MAX(group_id)+1,1) FROM board),
	 0,0,0,0); 
    COMMIT;
END;
/
*/

--내용보기
CREATE OR REPLACE PROCEDURE boardContent(
     pNo board.no%TYPE,
     pResult OUT SYS_REFCURSOR
)
IS
BEGIN
   UPDATE board SET
   hit = hit+1
   WHERE no = pNo;
   COMMIT;
   OPEN pResult FOR
      SELECT no, name, subject, content, regdate,hit
      FROM board
      WHERE no=pNo;
END;
/





