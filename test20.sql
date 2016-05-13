drop table sistmember
cascade constraints; 
  create table sistmember(
       id varchar2(50) primary key,
       name varchar2(50),
       pwd varchar2(50) not null,
       email varchar2(50) unique,
       auth number(1) not null 
   );
   select * from sistmember;