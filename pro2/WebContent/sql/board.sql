drop table board;
drop sequence board_seq;

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

insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','온라인등록하세요');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','온라인등록하세요');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','온라인등록하세요');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','온라인등록하세요');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','온라인등록하세요');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','온라인등록하세요');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','온라인등록하세요');
insert into board values(board_seq.nextval,'서지혜',12346,01065353817,'궁금한게있어요','학원을 다니려면 어떻게해야하나요?','온라인등록하세요');



commit;

select*from board;

delete from board where qnaname='sdfsdf'; 