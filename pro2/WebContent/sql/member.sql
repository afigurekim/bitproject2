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

commit;

select * from member;


delete from member where username='LION';
