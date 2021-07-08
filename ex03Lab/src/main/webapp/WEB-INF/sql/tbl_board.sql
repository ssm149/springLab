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


-- AOP 적용을 위한 테이블 
create table tbl_user (
	uid varchar(50) NOT NULL,
	upw varchar(50) NOT NULL,
	uname varchar(100) NOT NULL,
	upoint int NOT NULL DEFAULT 0,
	primary key (uid)
);

create table tbl_message (
	mid int not null auto_increment,
	targetid varchar(50) not null,
	sender varchar(50) not null,
	message text not null,
	opendate timestamp,
	senddate timestamp not null default now(),
	primary key (mid)
);

alter table tbl_message add constraint fk_usertarget 
foreign key (targetid) references tbl_user (uid);

alter table tbl_message add constraint fk_usersender 
foreign key (targetid) references tbl_user (uid);

insert into tbl_user(uid,upw,uname) values ('user00','user00','IRON MAN');
insert into tbl_user(uid,upw,uname) values ('user01','user01','CAPTAIN');
insert into tbl_user(uid,upw,uname) values ('user02','user02','HULK');
insert into tbl_user(uid,upw,uname) values ('user03','user03','Thor');
insert into tbl_user(uid,upw,uname) values ('user10','user10','Quick Silver');

-- 댓글 카운트의 처리
alter table tbl_board add column replycnt int default 0;


