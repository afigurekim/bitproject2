/* CSH Sample data 2019/01/04 */ 

create table member(
	usernum number primary key,
	username varchar2(15),
	userid varchar2(12),
	userpw varchar2(12),
	useraddr varchar2(120),
	userphone varchar2(12),
	usermail varchar2(30),
	userprog number,
	userlevel varchar2(15)
);

create sequence member_seq;

insert into member values (member_seq.nextval,'stu1','stu1','1234','seoul 1234',01042434246,'111111@hanmail.net',1234,'student');
insert into member values (member_seq.nextval,'stu2','stu2','1234','seoul 1234',01042434246,'222222@hanmail.net',1234,'student');
insert into member values (member_seq.nextval,'stu3','stu3','1234','seoul 1234',01042434246,'333333@hanmail.net',1234,'student');
insert into member values (member_seq.nextval,'tea1','tea1','1234','seoul 1234',01042434246,'444444@hanmail.net',1234,'teacher');
insert into member values (member_seq.nextval,'tea2','tea2','1234','seoul 1234',01042434246,'555555@hanmail.net',1234,'teacher');
insert into member values (member_seq.nextval,'ma1','ma1','1234','seoul 1234',01042434246,'666666@hanmail.net',1234,'admin');

create table program(
	prognum	number primary key,
	progname varchar2(30),
	progteach number,
	progroom varchar2(30),
	datestart date,
	dateend date,
	timestart varchar2(15),
	timeend number,
	progsize number
);

create sequence program_seq;

insert into program values (program_seq.nextval, 'java', 84, 'class1', sysdate, sysdate, '09:30', 320, 30 );
insert into program values (program_seq.nextval, 'database', 85, 'class2', sysdate, sysdate, '10:30', 120, 30 );
insert into program values (program_seq.nextval, 'web', 84, 'class3', sysdate, sysdate, '12:00', 60, 30 );

commit;
