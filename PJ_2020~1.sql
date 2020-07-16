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
    I_CONTENT CLOB,
    U_ID NVARCHAR2(20)
);
CREATE TABLE BOARD_Q(--질문게시판
    Q_NUM NUMBER,
    Q_TITLE NVARCHAR2(30),--글 제목
    Q_DATE TIMESTAMP DEFAULT SYSDATE,
    Q_CONTENT CLOB,
    Q_ID NVARCHAR2(20)
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
CREATE SEQUENCE SEQ_WC_NUM INCREMENT BY 1 START WITH 1000;--유저 등급 이것은 자동증가값입니다.


--유저를 임의로 추가
INSERT INTO WRITER VALUES('익명유저01', 'user_viva', '승리자');
INSERT INTO WRITER VALUES('익명유저02', 'user_LOSE', '패배자');
INSERT INTO WRITER VALUES('익명유저03', 'user_BIG', '기간틱');
INSERT INTO WRITER VALUES('익명유저04', 'user_EAT', '허기지다');
INSERT INTO WRITER VALUES('익명유저05', 'user_WOW', '와우');

--임의로 유저를 관리자로 지정 , 일단 관리자를 MASTER라고 쓰기로 생각
INSERT INTO WRITER_CLASS VALUES(SEQ_WU_NUM).NEXTVAL, 'MASTER', '익명유저01');

--자유게시판 임의로 추가 NUM값은 반드시 SEQ_ID.NEXTVAL 자동으로 증가를 해야함. 중복을 제거하고 자동으로 숫자 상승
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, '고양이좋아요', '2020-02-13', '고양이는 최고죠, 강아지보단 고양이 아니겠습니까! 뭐라해도 갓냥이', '익명유저01');--일단은 날짜를 년월일만 했지만 시간을 넣어도 문제없어요
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, '강아지귀여워', '2020-02-21', '강아지귀여워, 공던지기하고 싶어', '익명유저02');
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, '사막여우불법', '2020-04-11', '국내는 사막여우 불법이죠;; 허허...', '익명유저03');
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, '앵무 좋아', '2020-02-14', '앵무새가 말따라하는 거 신기해', '익명유저04');
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, '킹갓냥이', '2020-03-15', '킹갓냥이는 산책이 필요없어요', '익명유저05');

