--2016.05.03 PL/SQL
/*
    반복문 : FOR/WHILE
       = FOR
          형식) FOR 변수 IN 초기값..최종값 LOOP
                       처리문장
                  END LOOP;

DECLARE
BEGIN
     FOR i IN 1..10 LOOP
     DBMS_OUTPUT.PUT_LINE(i);
     END LOOP;
END;
/


DECLARE
BEGIN
   FOR i IN 1..100 LOOP
     IF MOD(i,2) <>0 THEN
        DBMS_OUTPUT.PUT_LINE(i);
    END IF;
   END LOOP;
END;
/


set serveroutput on
DECLARE
   total NUMBER:=0;
BEGIN
  FOR i IN 1..9 LOOP
    total:=3*i;
    DBMS_OUTPUT.PUT_LINE('3*'||i||'='||total);
 END LOOP;
END;
/
*/
DECLARE
    i NUMBER:=0;
BEGIN
   WHILE i<10 LOOP
     i:=i+1;
       DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/