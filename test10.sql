/*
 INSERT
  1. �ʿ��� �����͸� ÷�� : INSERT INTO table��(�÷���) VALUES(��1, ��2..._);
  2. ��ü ������ ÷�� : INSERT INTO table�� VALUES(��1, ��2, ��3...) 
  3. ���� ROW ���� ÷�� : INSERT INTO table�� SELECT * FROM emp;
  4. ���� ���̺� ������ ÷�� : INSERT ALL WHEN ���� THEN INTO table��
                                                                   WHEN ���� THEN INTO table��
                                                             ...    ELSE INTO table��
                                              SELECT ~
  UPDATE 
  1. UPDATE table�� SET �÷��� = ��, �÷��� = ��....

   ****** ���� ���� : 1. NOT NULL        - '*'
                                2. PRIMARY KEY(����, ���� ���X)   
                                3. FOREIGN KEY   - �޺��ڽ�     
                                4, CHECK              - �޺��ڽ�
  
  DELETE
  1. DELETE FROM table WHERE ����
*/