drop table member;

create table member (
   id varchar2(10) primary key,
   pwd varchar2(10) not null,
   name varchar(34) not null,
   avatar number default 1,
   sex varchar(10),
   type number
);

insert into member values('1','1234','name1',1,'����',0);
insert into member values('2','1234','name2',1,'����',0);
insert into member values('3','1234','name3',1,'����',0);
insert into member values('4','1234','name4',1,'����',0);
insert into member values('5','1234','name5',1,'�ɷ���',0);

commit;