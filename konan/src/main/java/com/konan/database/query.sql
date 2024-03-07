select* from member;

create table board(
idx number(3),
title varchar2(100),
content varchar2(1000),
writer varchar2(100),
img varchar2(500),
indate varchar2(100)
);

create sequence board_seq
increment by 1
start with 1
nocache;

insert into board values(board_seq.NEXTVAL, 'title', 'test content', 'writer', 'img url', sysdate);

commit

select* from board;