-- 2016.05.03 PL/SQL
-- PROCEDURE (리턴형이 없는 메소드)

DROP TABLE myMember;

CREATE TABLE myMember(
   no NUMBER PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
   sex VARCHAR2(10) CHECK(sex IN('남자','여자')),
   addr VARCHAR2(20) NOT NULL,
   tel VARCHAR2(20) NOT NULL
);

CREATE OR REPLACE PROCEDURE memberInsert(
   pname IN myMember.name%TYPE,
   psex IN myMember.sex%TYPE,
   paddr IN myMember.addr%TYPE,
   ptel IN myMember.tel%TYPE
);

IS
   pno myMember.no%TYPE:=0;
   -- 지역변수
BEGIN
   SELECT NVL(MAX(no)+1,1) INTO pno
   FROM myMember;
   INSERT INTO myMember VALUES(pno,pname,psex,paddr,ptel);
   COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE memberFindData(
   pno IN myMember.no%TYPE,
   pname OUT myMember.name%TYPE,
   psex OUT myMember.sex%TYPE,
   paddr OUT myMember.addr%TYPE,
   ptel OUT myMember.tel%TYPE
);

IS
BEGIN
   SELECT name, sex, addr, tel INTO pname, psex, paddr, ptel FROM myMember WHERE no=pno;
END;
/