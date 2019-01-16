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

/* KDH 2019/01/15 progcnt Ãß°¡ */ 

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

insert into program values (program_seq.nextval, 'java', 4, 'class1', sysdate, sysdate, '09:30', 320, 30, 0);
insert into program values (program_seq.nextval, 'database', 5, 'class2', sysdate, sysdate, '10:30', 120, 30, 0);
insert into program values (program_seq.nextval, 'web', 4, 'class3', sysdate, sysdate, '12:00', 60, 30, 0);

/* KDH 2019/01/15 Å×ÀÌºí Ãß°¡ */ 

create table checkinlist(
	stunum number,
	checkdate varchar2(8) unique,
	checkin varchar2(6),
	checkout varchar2(6),
	checkchk number default 0
);

INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20181227', '092012', '183548', 0);
INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20181228', '091531', '182535', 0);
INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20181231', '101453', '183425', 0);
INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20190102', '091342', '162456', 0);
INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20190103', '091548', '182623', 0);
INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20190104', '152824', '173621', 0);
INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20190107', '094529', '182718', 0);
INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20190108', '103512', '183526', 0);
INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20190109', '092534', '184821', 0);
INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN, CHECKOUT) VALUES (1, '20190110', '091525', '183643', 0);

CREATE TABLE EXAMLIST(
	EXAMNUM NUMBER PRIMARY KEY,
	SUBNAME VARCHAR2(30),
	EXAMDATE VARCHAR2(8),
	SUBROOM VARCHAR2(30),
	SUBTEACH NUMBER
);

CREATE SEQUENCE EXAMLIST_SEQ;

INSERT INTO EXAMLIST VALUES (EXAMLIST_SEQ.NEXTVAL, 'java', '20181219', 'class1', 4);
INSERT INTO EXAMLIST VALUES (EXAMLIST_SEQ.NEXTVAL, 'database', '20181226', 'class2', 5);
INSERT INTO EXAMLIST VALUES (EXAMLIST_SEQ.NEXTVAL, 'web', '20190102', 'class3', 4);
INSERT INTO EXAMLIST VALUES (EXAMLIST_SEQ.NEXTVAL, 'java', '20190109', 'class1', 4);

CREATE TABLE SCORELIST(
	STUNUM NUMBER,
	EXAMNUM NUMBER,
	SUBNAME VARCHAR2(30),
	EXAMDATE VARCHAR2(8),
	TEACHNAME VARCHAR2(15),
	EXAMSCORE NUMBER,
	EXAMCHK NUMBER
);

INSERT INTO SCORELIST (STUNUM, EXAMNUM, SUBNAME, EXAMDATE, TEACHNAME, EXAMSCORE) VALUES (1, 1, (SELECT SUBNAME FROM EXAMLIST WHERE EXAMNUM=1), (SELECT EXAMDATE FROM EXAMLIST WHERE EXAMNUM=1), (SELECT USERNAME FROM MEMBER WHERE USERNUM=(SELECT SUBTEACH FROM EXAMLIST WHERE EXAMNUM=1)), 80);
INSERT INTO SCORELIST (STUNUM, EXAMNUM, SUBNAME, EXAMDATE, TEACHNAME, EXAMSCORE) VALUES (1, 4, (SELECT SUBNAME FROM EXAMLIST WHERE EXAMNUM=4), (SELECT EXAMDATE FROM EXAMLIST WHERE EXAMNUM=4), (SELECT USERNAME FROM MEMBER WHERE USERNUM=(SELECT SUBTEACH FROM EXAMLIST WHERE EXAMNUM=4)), 85);

commit;
