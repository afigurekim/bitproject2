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

insert into program values (program_seq.nextval, 'java', 84, 'class1', sysdate, sysdate, 'AM 09:30', 320, 30 );
insert into program values (program_seq.nextval, 'database', 85, 'class2', sysdate, sysdate, 'AM 10:30', 120, 40 );
insert into program values (program_seq.nextval, 'web', 84, 'class3', sysdate, sysdate, 'PM 12:00', 60, 50 );

commit;

