
create table lecturer_tbl(

idx number(6) not null,
name varchar2(10),
major varchar2(21),
field varchar2(20),
primary key (idx)

);

create sequence lecturer_seq
    start with 1
        increment by 1
        minvalue 1
        maxvalue 100;
        
        

insert into lecturer_tbl values(1, '김교수', '소프트웨어공학', '알고리즘');

insert into lecturer_tbl values(2, '이교수', '소프트웨어공학', '인공지능');
insert into lecturer_tbl values(3, '박교수', '소프트웨어공학', '소프트웨어공학');
insert into lecturer_tbl values(4, '우교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl values(5, '최교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl values(6, '강교수', '소프트웨어공학', '멀티미디어');
insert into lecturer_tbl values(7, '황교수', '모바일시공학', '네트워크');
select * from lecturer_tbl;
