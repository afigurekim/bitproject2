drop table member;
drop sequence member_seq;

create table member(
usernum number primary key,
username varchar2(15) NOT NULL,
userid varchar2(12) NOT NULL,
userpw varchar2(12) NOT NULL,
useraddr varchar2(120) NOT NULL,
userphone varchar2(12) NOT NULL,
usermail varchar2(30) NOT NULL,
userprog number,
userlevel varchar2(10) default 'student'
);

create sequence member_seq;
insert into member values(member_seq.nextval,'JIHYE','ssb33817','secret','경기도광명시소하동401동','01065353817','ssb33817@naver.com',1234,'student');
insert into member values (member_seq.nextval,'stu1','stu1','1234','seoul 1234',01042434246,'111111@hanmail.net',1234,'student');
insert into member values (member_seq.nextval,'stu2','stu2','1234','seoul 1234',01042434246,'222222@hanmail.net',1234,'student');
insert into member values (member_seq.nextval,'stu3','stu3','1234','seoul 1234',01042434246,'333333@hanmail.net',1234,'student');
insert into member values (member_seq.nextval,'tea1','tea1','1234','seoul 1234',01042434246,'444444@hanmail.net',1234,'teacher');
insert into member values (member_seq.nextval,'tea2','tea2','1234','seoul 1234',01042434246,'555555@hanmail.net',1234,'teacher');
insert into member values (member_seq.nextval,'ma1','ma1','1234','seoul 1234',01042434246,'666666@hanmail.net',1234,'admin');

commit;

select * from member;


delete from member where username='LION';
