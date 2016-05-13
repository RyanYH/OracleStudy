-- 2016.04.26 ��ȭ����
/*
	��ȭ���� (��������, �������)
	�������� (�ð�����)
	������� 
	�ð�����
	
	����������
	������Ȳ 
*/
/*
CREATE TABLE genreInfo(
   gno NUMBER,
   genre VARCHAR2(20) CONSTRAINT ge_nn_genre NOT NULL,
   CONTRAINT ge_pk_gno PRIMARY KEY(gno)
);
CREATE TABLE gradeInfo(
   gno NUMBER,
   grade VARCHAR2(20) CONSTRAINT gi_nn_grade NOT NULL,
   CONSTRAINT gi_pk_gno PRIMARY KEY(gno)
);
CREATE TABLE genreInfo(
   gno NUMBER,
   genre VARCHAR2(20) CONSTRAINT ge_nn_genre NOT NULL,
   CONSTRAINT ge_pk_gno PRIMARY KEY(gno)
);
CREATE TABLE timeInfo(
   tno NUMBER, 
   time VARCHAR2(20) CONSTRAINT ti_nn_time NOT NULL, 
   CONSTRAINT ti_pk_tno PRIMARY KEY(tno)
);
CREATE TABLE theaterInfo(
   tno NUMBER, 
   timeno VARCHAR2(100), 
   theater VARCHAR2(30) CONSTRAINT th_nn_theater NOT NULL, 
   loc VARCHAR2(30) CONSTRAINT th_nn_loc NOT NULL, 
   CONSTRAINT th_pk_tno PRIMARY KEY(tno)
);

   private int no;
   private String title;
   private String image;
   private String percent;
   private String regdate;
   private double reserve;
   private int like;

CREATE TABLE movieInfo(
   mno NUMBER, 
   title VARCHAR2(100) CONSTRAINT mi_nn_title NOT NULL, 
   poster VARCHAR2(200) CONSTRAINT mi_nn_poster NOT NULL, 
   theater_no VARCHAR2(100) CONSTRAINT mi_nn_theater NOT NULL, 
   CONSTRAINT mi_pk_mno PRIMARY KEY(mno)
);
*/

/*
INSERT INTO timeInfo VALUES(1,'09:00');
INSERT INTO timeInfo VALUES(2,'10:00');
INSERT INTO timeInfo VALUES(3,'11:00');
INSERT INTO timeInfo VALUES(4,'12:00');
INSERT INTO timeInfo VALUES(5,'13:00');
INSERT INTO timeInfo VALUES(6,'14:00');
INSERT INTO timeInfo VALUES(7,'15:00');
INSERT INTO timeInfo VALUES(8,'16:00');
INSERT INTO timeInfo VALUES(9,'17:00');
INSERT INTO timeInfo VALUES(10,'18:00');
INSERT INTO timeInfo VALUES(11,'19:00');
INSERT INTO timeInfo VALUES(12,'20:00');
INSERT INTO timeInfo VALUES(13,'21:00');
INSERT INTO timeInfo VALUES(14,'22:00');

COMMIT;

INSERT INTO theaterInfo VALUES(1,'1,3,5,6,7,8,13','CGV','����');
INSERT INTO theaterInfo VALUES(2,'1,4,5,6,7,8,13','CGV','���');
INSERT INTO theaterInfo VALUES(3,'1,5,6,7,8,10','CGV','�սʸ�');
INSERT INTO theaterInfo VALUES(4,'5,6,7,8,12','�ް��ڽ�','���빮');
INSERT INTO theaterInfo VALUES(5,'1,2,5,6,7,8,14','�ް��ڽ�','����');
INSERT INTO theaterInfo VALUES(6,'1,2,5,,8,11','�ް��ڽ�','�ڿ���');
INSERT INTO theaterInfo VALUES(7,'1,2,5,6,8,9,13','�Ե��ó׸�','û����');
INSERT INTO theaterInfo VALUES(8,'1,2,4,5,7,8,13','�Ե��ó׸�','�Ÿ�');
INSERT INTO theaterInfo VALUES(9,'1,2,3,6,7,8,13','�Ե��ó׸�','�Ǵ�');
INSERT INTO theaterInfo VALUES(11,'1,2,3,4,5,6,7,8,9,10','�������','����');
INSERT INTO theaterInfo VALUES(12,'1,2,3,6,7,8,9,10','���ѱ���','�湫��');
INSERT INTO theaterInfo VALUES(13,'1,2,3,4,5,8,9,10','��Ʈ����','����');
INSERT INTO theaterInfo VALUES(14,'1,4,5,6,7,8,9,10','�ް��ڽ�','����');
INSERT INTO theaterInfo VALUES(15,'1,2,3,4,5,6,7,10','�Ե��ó׸�','���');
INSERT INTO theaterInfo VALUES(16,'1,2,3,4,5,6,7,8,'KU�ó׸�','�Ⱦ�');
INSERT INTO theaterInfo VALUES(17,'1,2,5,6,9,10,11,12','�ް��ڽ�','����');

COMMIT;

INSERT INTO movieInfo VALUES(1,'�ð���Ż��','http://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78865/78865_185.jpg','1,2,3,4');
INSERT INTO movieInfo VALUES(2,'�����Ǿ�','http://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78746/78746_185.jpg','4,5,7');
INSERT INTO movieInfo VALUES(3,'�λ��� �Ƹ��ٿ�','http://img.cgv.co.kr/Movie/Thumbnail/Poster/000060/60505/60505_185.jpg','4,10,12');
INSERT INTO movieInfo VALUES(4,'�ؾ�ȭ','http://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78821/78821_185.jpg','1,2,3,4,5,6');
INSERT INTO movieInfo VALUES(5,'�η�Ŭ��','http://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78764/78764_185.jpg','11,12,13');
INSERT INTO movieInfo VALUES(6,'������ �ҿ�','http://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78870/78870_185.jpg','10,11,12,13,14');
INSERT INTO movieInfo VALUES(7,'��,�����Ϳ�','http://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78874/78874_185.jpg','6,7,8,9');

COMMIT;
*/

CREATE TABLE reserveDate(
   no NUMBER,
   timeno VARCHAR2(200)
);

INSERT INTO reserveDate VALUES(1, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(2, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(3, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(4, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(5, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(6, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(7, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(8, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(9, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(10, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(11, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(12, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(13, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(14, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(15, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(16, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(17, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(18, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(19, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(20, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(21, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(22, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(23, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(24, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(25, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(26, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(27, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(28, '1,2,5,6,7,8,13');
INSERT INTO reserveDate VALUES(29, '1,3,5,6,7,8,13');
INSERT INTO reserveDate VALUES(30, '1,4,5,6,7,8,13');
INSERT INTO reserveDate VALUES(31, '1,2,5,6,7,8,13');

COMMIT;
