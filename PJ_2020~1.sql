CREATE TABLE WRITER(--유저 글쓴이라는 뜻에서 WRITER 다만 내용은 U로 되어있으니 주의 
    U_ID NVARCHAR2(20), --아이디
    U_PW NVARCHAR2(30), --비번
    U_NAME NVARCHAR2(20)--유저의 닉네임
);
CREATE TABLE WRITER_CLASS(--글쓴이 등급, 기본으로 W를 사용했음 
    W_NUM NUMBER,--등급기록
    W_C NVARCHAR2(20), --적용등급
    U_ID NVARCHAR2(30) --유저아이디
);
CREATE TABLE BOARD_F(--자유게시판
    F_NUM NUMBER,--글의 번호
    F_TITLE NVARCHAR2(30),--글 제목
    F_DATE TIMESTAMP DEFAULT SYSDATE,-- 작성한 날짜
    F_CONTENT CLOB, --글내용
    U_ID NVARCHAR2(20) --작성한 유저의 아이디
);
CREATE TABLE BOARD_I(--정보게시판
    I_NUM NUMBER,
    I_TITLE NVARCHAR2(30),--글 제목
    I_DATE TIMESTAMP DEFAULT SYSDATE,
    I_FILE NVARCHAR2(100), --사진저장형식
    I_CONTENT CLOB,--정보내용
    U_ID NVARCHAR2(20)
);
CREATE TABLE BOARD_Q(--질문게시판
    Q_NUM NUMBER,
    Q_TITLE NVARCHAR2(30),--글 제목
    Q_DATE TIMESTAMP DEFAULT SYSDATE,
    Q_CONTENT CLOB,
    U_ID NVARCHAR2(20)
);
CREATE TABLE BOARD_A(--질문게시판 답변
    A_NUM NUMBER,
    A_DATE TIMESTAMP DEFAULT SYSDATE,
    A_CONTENT CLOB,--답변
    U_ID NVARCHAR2(20),
    Q_NUM NUMBER--답변한 댓과 관련있는 질문게시판글에 번호
);
CREATE TABLE BOARD_P(--사진게시판
    P_NUM NUMBER,
    P_TITLE NVARCHAR2(30),--글 제목
    P_DATE TIMESTAMP DEFAULT SYSDATE,
    P_FILE NVARCHAR2(100), --사진저장형식
    U_ID NVARCHAR2(20)
);
--시퀸스
CREATE SEQUENCE SEQ_F_NUM INCREMENT BY 1 START WITH 1000;--각정보 증가, 자유게시판
CREATE SEQUENCE SEQ_P_NUM INCREMENT BY 1 START WITH 1000;--포토게시판
CREATE SEQUENCE SEQ_I_NUM INCREMENT BY 1 START WITH 1000;--정보게시판
CREATE SEQUENCE SEQ_Q_NUM INCREMENT BY 1 START WITH 1000;--질문게시판
CREATE SEQUENCE SEQ_A_NUM INCREMENT BY 1 START WITH 1000;--질문게시판에 답변
CREATE SEQUENCE SEQ_WC_NUM INCREMENT BY 1 START WITH 1000;--유저 등급 이것은 자동증가값입니다.


--유저를 임의로 추가
INSERT INTO WRITER VALUES('master01', 'master01', '마스터');
INSERT INTO WRITER VALUES('user02', 'user02pw', '2번');
INSERT INTO WRITER VALUES('user03', 'user03pw', '3유저');
INSERT INTO WRITER VALUES('user04', 'user04pw', '사람');
INSERT INTO WRITER VALUES('user05', 'user05pw', '고양이좋아');

--임의로 유저를 관리자로 지정 , 일단 관리자를 MASTER라고 쓰기로 생각
INSERT INTO WRITER_CLASS VALUES(SEQ_WC_NUM.NEXTVAL, 'MASTER', 'master01');


