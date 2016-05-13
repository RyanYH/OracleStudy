drop table calendar
cascade constraints;
drop sequence seq_calendar;

create table calendar(
seq number(8) primary key,
id varchar2(50) not null,
title varchar2(50) not null,
content varchar2(4000) not null,
rdate varchar2(12) not null,
wdate date not null
);

create sequence seq_calendar
start with 1 increment by 1;

alter table calendar
add constraint fk_calendar_id foreign key(id)
references sistmember(id);