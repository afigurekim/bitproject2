drop table member;
drop sequence member_seq;

drop table program;
drop sequence program_seq;

drop table examlist;
drop sequence examlist_seq;

drop table scorelist;

drop table checkinlist;

drop table board;
drop sequence board_seq;



create table member(
usernum number primary key,
username varchar2(20) NOT NULL,
userid varchar2(20) NOT NULL,
userpw varchar2(20) NOT NULL,
useraddr varchar2(120) NOT NULL,
userphone varchar2(20) NOT NULL,
usermail varchar2(30) NOT NULL,
userprog number default 0,
userlevel varchar2(20) default 'student'
);

create sequence member_seq;

insert into member values (member_seq.nextval,'student','student1','1234','seoul 1234',01042434246,'111111@hanmail.net',1,'student');
insert into member values (member_seq.nextval,'서지혜','jihey1','1234','seoul 1234',01042434246,'222222@hanmail.net',1,'student');
insert into member values (member_seq.nextval,'김도형','dohyung1','1234','seoul 1234',01042434246,'333333@hanmail.net',1,'student');
insert into member values (member_seq.nextval,'최시훈','sihoon1','1234','seoul 1234',01042434246,'333333@hanmail.net',2,'student');
insert into member values (member_seq.nextval,'김동현','donghyun1','1234','seoul 1234',01042434246,'333333@hanmail.net',2,'student');
insert into member values (member_seq.nextval,'김하늘','hanule1','1234','seoul 1234',01042434246,'333333@hanmail.net',3,'student');
insert into member values (member_seq.nextval,'박민호','minho1','1234','seoul 1234',01042434246,'444444@hanmail.net',3,'student');
insert into member values (member_seq.nextval,'원기','wongi1','1234','seoul 1234',01042434246,'555555@hanmail.net',3,'student');
insert into member values (member_seq.nextval,'이주은','leeju1','1234','seoul 1234',01042434246,'555555@hanmail.net',3,'student');
insert into member values (member_seq.nextval,'최범규','choi1','1234','seoul 1234',01042434246,'666666@hanmail.net',3,'student');

insert into member values (member_seq.nextval,'유대종','youdea','1234','seoul 1234','01042434246','444444@hanmail.net',0,'teacher');
insert into member values (member_seq.nextval,'현우진','hyunwoo','1234','seoul 1234','01042434246','555555@hanmail.net',0,'teacher');
insert into member values (member_seq.nextval,'조정식','jungsik','1234','seoul 1234','01042434246','555555@hanmail.net',0,'teacher');
insert into member values (member_seq.nextval,'teacher','teacher','1234','seoul 1234','01042434246','555555@hanmail.net',0,'teacher');

insert into member values (member_seq.nextval,'조현정','admin','1234','seoul 1234','01042434246','666666@hanmail.net',0,'admin');


create table program(
	prognum	number primary key,
	progname varchar2(30),
	progteach number,
	progroom varchar2(30),
	datestart date,
	dateend date,
	timestart varchar2(15),
	timeend number,
	progsize number, 
	progcnt number default 0
);

create sequence program_seq;

insert into program values (program_seq.nextval, 'java', 11, 'class1', sysdate, sysdate, 'AM 09:30', 320, 30, 0 );
insert into program values (program_seq.nextval, 'database', 14, 'class2', sysdate, sysdate, 'AM 10:30', 120, 40, 0 );
insert into program values (program_seq.nextval, 'web', 14, 'class3', sysdate, sysdate, 'PM 12:00', 60, 50, 0 );


create table examlist(
	examnum number primary key,
	subname varchar2(30),
	examdate date default sysdate,
	subroom varchar2(30),
	subteach number
);

create sequence examlist_seq;

insert into examlist values (examlist_seq.nextval, 'java', sysdate, 'class1', 11);
insert into examlist values (examlist_seq.nextval, 'database', sysdate, 'class2', 14);
insert into examlist values (examlist_seq.nextval, 'web', sysdate, 'class3', 14);

create table scorelist(
	stunum number,
	examnum number,
	subname varchar2(30),
	examdate varchar2(10),
	teachname varchar2(15),
	examscore number,
	examchk number
);


insert into scorelist values (1, 1, 'java','20190115','유대종',50, 0);
insert into scorelist values (2, 1, 'java','20190115','유대종',90, 0);
insert into scorelist values (3, 1, 'java','20190115','유대종',60, 0);
insert into scorelist values (4, 2, 'database','20190116','teacher',50, 0);
insert into scorelist values (5, 2, 'database','20190116','teacher',60, 0);
insert into scorelist values (6, 3, 'web','20190117','teacher',50, 0);
insert into scorelist values (7, 3, 'web','20190117','teacher',60, 0);
insert into scorelist values (7, 3, 'web','20190117','teacher',78, 0);
insert into scorelist values (8, 3, 'web','20190117','teacher',80, 0);
insert into scorelist values (10, 3, 'web','20190117','teacher',39, 0);


create table checkinlist(
	stunum number,
	checkdate varchar2(10),
	checkin varchar2(6),
	checkout varchar2(6),
	checkchk number default 0
);

insert into checkinlist values (1, '20190113', '092012', '183548',0);
insert into checkinlist values (2, '20190113', '083000', '120000',0);
insert into checkinlist values (3, '20190113', '103000', '180000',0);
insert into checkinlist values (4, '20190113', '073000', '150000',0);
insert into checkinlist values (5, '20190113', '113000', '123000',0);
insert into checkinlist values (6, '20190113', '083000', '110000',0);
insert into checkinlist values (7, '20190113', '083000', '110000',0);
insert into checkinlist values (8, '20190113', '083000', '110000',0);
insert into checkinlist values (9, '20190113', '083000', '110000',0);
insert into checkinlist values (10, '20190113', '083000', '110000',0);

insert into checkinlist values (1, '20190114', '092012', '183548',0);
insert into checkinlist values (2, '20190114', '083000', '120000',0);
insert into checkinlist values (3, '20190114', '103000', '180000',0);
insert into checkinlist values (4, '20190114', '073000', '150000',0);
insert into checkinlist values (5, '20190114', '113000', '123000',0);
insert into checkinlist values (6, '20190114', '083000', '110000',0);
insert into checkinlist values (7, '20190114', '083000', '110000',0);
insert into checkinlist values (8, '20190114', '083000', '110000',0);
insert into checkinlist values (9, '20190114', '083000', '110000',0);
insert into checkinlist values (10, '20190114', '083000', '110000',0);

insert into checkinlist values (1, '20190115', '092012', '183548',0);
insert into checkinlist values (2, '20190115', '083000', '120000',0);
insert into checkinlist values (3, '20190115', '103000', '180000',0);
insert into checkinlist values (4, '20190115', '073000', '150000',0);
insert into checkinlist values (5, '20190115', '113000', '123000',0);
insert into checkinlist values (6, '20190115', '083000', '110000',0);
insert into checkinlist values (7, '20190115', '083000', '110000',0);
insert into checkinlist values (8, '20190115', '083000', '110000',0);
insert into checkinlist values (9, '20190115', '083000', '110000',0);
insert into checkinlist values (10, '20190115', '083000', '110000',0);


insert into checkinlist values (1, '20190116', '092012', '183548',0);
insert into checkinlist values (2, '20190116', '083000', '120000',0);
insert into checkinlist values (3, '20190116', '103000', '180000',0);
insert into checkinlist values (4, '20190116', '073000', '150000',0);
insert into checkinlist values (5, '20190116', '113000', '123000',0);
insert into checkinlist values (6, '20190116', '083000', '110000',0);
insert into checkinlist values (7, '20190116', '083000', '110000',0);
insert into checkinlist values (8, '20190116', '083000', '110000',0);
insert into checkinlist values (9, '20190116', '083000', '110000',0);
insert into checkinlist values (10, '20190116', '083000', '110000',0);


create table board(
	qnanum number,
	qnaname varchar2(15) NOT NULL,
	qnapw number NOT NULL,
	qnaphone number NOT NULL,
	qnatitle varchar2(60) NOT NULL,
	qnacont varchar2(400) NOT NULL,
	qnaresp varchar2(400)
);

create sequence board_seq;

insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'안녕하세요...','실무중심 교육 및 신기술을 알고 싶습니다.','');
insert into board values(board_seq.nextval,'김도형',12346,01065353817,'학원을 다니고 싶습니다.','강사님은 어떻게 되나요?','');
insert into board values(board_seq.nextval,'최시훈',12346,01065353817,'학원비는 얼마인가요?','학원을 다니려면 어떻게해야하나요?','');
insert into board values(board_seq.nextval,'김하늘',12346,01065353817,'수업에 대해알고 싶습니다','수업 내용에 대해 알고 싶습니다.?','');
insert into board values(board_seq.nextval,'박민호',12346,01065353817,'찾아가는 길이 어떻게 되나요?','종로에서 어떻게 가면 되나요?','');
insert into board values(board_seq.nextval,'원기',12346,01065353817,'점심시간이 언제인가요?','점심 시간을 알고싶습니다.?','');
insert into board values(board_seq.nextval,'이주은',12346,01065353817,'무엇을 배우나요','학과목을 알고 싶습니다.?','');
insert into board values(board_seq.nextval,'최범규',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','');


commit;












