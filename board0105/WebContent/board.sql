create table or_board(
	idx number primary key, 
	name varchar2(30),	 
	email varchar2(30), 
	title varchar2(50), 
	content varchar2(2000), 
	password varchar2(20),
	write_date varchar2(50),
	hit number(10)
);

select * from OR_BOARD;

create sequence board_idx increment by 1 start with 1;

SELECT password from or_board where idx=0

update OR_BOARD set email='이메일수정', title='타이틀 수정',content='내용수정' where idx=4;

select * from OR_BOARD where name like '이동%';