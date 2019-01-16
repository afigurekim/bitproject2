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
username varchar2(15) NOT NULL,
userid varchar2(12) NOT NULL,
userpw varchar2(12) NOT NULL,
useraddr varchar2(120) NOT NULL,
userphone varchar2(12) NOT NULL,
usermail varchar2(30) NOT NULL,
userprog number default 0,
userlevel varchar2(10) default 'student'
);

create sequence member_seq;

insert into member values (member_seq.nextval,'stu1','stu1','1234','seoul 1234','01042434246','111111@hanmail.net',1,'student');
insert into member values (member_seq.nextval,'stu2','stu2','1234','seoul 1234','01042434246','222222@hanmail.net',1,'student');
insert into member values (member_seq.nextval,'stu3','stu3','1234','seoul 1234','01042434246','333333@hanmail.net',2,'student');
insert into member values (member_seq.nextval,'stu4','stu4','1234','seoul 1234','01042434246','333333@hanmail.net',2,'student');
insert into member values (member_seq.nextval,'stu5','stu5','1234','seoul 1234','01042434246','333333@hanmail.net',3,'student');
insert into member values (member_seq.nextval,'stu6','stu6','1234','seoul 1234','01042434246','333333@hanmail.net',3,'student');
insert into member values (member_seq.nextval,'tea1','tea1','1234','seoul 1234','01042434246','444444@hanmail.net',0,'teacher');
insert into member values (member_seq.nextval,'tea2','tea2','1234','seoul 1234','01042434246','555555@hanmail.net',0,'teacher');
insert into member values (member_seq.nextval,'tea3','tea3','1234','seoul 1234','01042434246','555555@hanmail.net',0,'teacher');
insert into member values (member_seq.nextval,'ma1','ma1','1234','seoul 1234','01042434246','666666@hanmail.net',0,'admin');

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

insert into program values (program_seq.nextval, 'java', 7, 'class1', sysdate, sysdate, 'AM 09:30', 320, 30, 2 );
insert into program values (program_seq.nextval, 'database', 8, 'class2', sysdate, sysdate, 'AM 10:30', 120, 40, 2 );
insert into program values (program_seq.nextval, 'web', 9, 'class3', sysdate, sysdate, 'PM 12:00', 60, 50, 2 );


create table examlist(
	examnum number primary key,
	subname varchar2(30),
	examdate date default sysdate,
	subroom varchar2(30),
	subteach number
);

create sequence examlist_seq;

insert into examlist values (examlist_seq.nextval, 'java', sysdate, 'class1', 7);
insert into examlist values (examlist_seq.nextval, 'database', sysdate, 'class2', 8);
insert into examlist values (examlist_seq.nextval, 'web', sysdate, 'class3', 9);

create table scorelist(
	stunum number,
	examnum number,
	subname varchar2(30),
	examdate varchar2(10),
	teachname varchar2(15),
	examscore number default 0,
	examchk number default 0
);

insert into scorelist values (1, 1, 'java','20190115','tea1',50, 0);
insert into scorelist values (1, 2, 'database','20190116','tea2',60, 0);
insert into scorelist values (1, 3, 'web','20190117','tea3',70, 0);
insert into scorelist values (2, 1, 'java','20190115','tea1',90, 0);
insert into scorelist values (2, 2, 'database','20190116','tea2',40, 0);
insert into scorelist values (2, 3, 'web','20190117','tea3',30, 0);
insert into scorelist values (3, 1, 'java','20190115','tea1',20, 0);
insert into scorelist values (3, 2, 'database','20190116','tea2',50, 0);
insert into scorelist values (3, 3, 'web','20190117','tea3',60, 0);



create table checkinlist(
	stunum number,
	checkdate varchar2(8),
	checkin varchar2(6),
	checkout varchar2(6),
	checkchk number default 0
);

insert into checkinlist values (1, '20190114', '092012', '183548',0);
insert into checkinlist values (2, '20190114', '083000', '120000',0);
insert into checkinlist values (3, '20190114', '103000', '180000',0);
insert into checkinlist values (4, '20190114', '073000', '150000',0);
insert into checkinlist values (5, '20190114', '113000', '123000',0);
insert into checkinlist values (6, '20190114', '083000', '110000',0);
insert into checkinlist values (1, '20190115', '092012', '183548',0);
insert into checkinlist values (2, '20190115', '083000', '120000',0);
insert into checkinlist values (3, '20190115', '083000', '120000',0);
insert into checkinlist values (4, '20190115', '083000', '120000',0);
insert into checkinlist values (5, '20190115', '083000', '120000',0);
insert into checkinlist values (6, '20190115', '083000', '120000',0);
insert into checkinlist values (1, '20190116', '092012', '183548',0);
insert into checkinlist values (2, '20190116', '083000', '120000',0);
insert into checkinlist values (3, '20190116', '103000', '180000',0);
insert into checkinlist values (4, '20190116', '073000', '150000',0);
insert into checkinlist values (5, '20190116', '113000', '123000',0);
insert into checkinlist values (6, '20190116', '083000', '110000',0);

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

insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','');

commit;












