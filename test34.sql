--2016.05.03 PL/SQL
/*
    �ݺ��� : FOR/WHILE
       = FOR
          ����) FOR ���� IN �ʱⰪ..������ LOOP
                       ó������
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