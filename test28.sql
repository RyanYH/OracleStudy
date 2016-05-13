    SELECT no,subject,name,regdate,hit,num
    FROM (SELECT no,subject,name,regdate,hit,rownum as num 
    FROM (SELECT no,subject,name,regdate,hit 
    FROM reply_board ORDER BY no DESC))
    WHERE num BETWEEN 1 AND 10;