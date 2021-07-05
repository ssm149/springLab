create table tbl_board (
	bno INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content TEXT NULL,
	writer VARCHAR(50) NOT NULL,
	regdate TIMESTAMP NOT NULL DEFAULT now(),
	viewcnt INT DEFAULT 0,
	PRIMARY KEY (bno)
);

insert into tbl_board (title,content,writer)
values('제목입니다','내용입니다.','user00');

select * from tbl_board where bno=1;
select * from tbl_board
where bno>0 
order by bno desc;

update tbl_board set title='수정된 제목' where bno=1;

delete from tbl_board where bno=1;

-- 댓글을 위한 테이블 설정
create table tbl_reply (
	rno int NOT NULL AUTO_INCREMENT,
	bno int not null default 0,
	replytext varchar(1000) not null,
	replyer varchar(50) not null,
	regdate TIMESTAMP NOT NULL DEFAULT now(),
	updatedate TIMESTAMP NOT NULL DEFAULT now(),
	primary key(rno)
);

alter table tbl_reply add constraint fk_board
foreign key(bno) references tbl_board(bno);

