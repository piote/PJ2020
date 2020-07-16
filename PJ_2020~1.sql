CREATE TABLE WRITER(--���� �۾��̶�� �濡�� WRITER �ٸ� ������ U�� �Ǿ������� ���� 
    U_ID NVARCHAR2(20), --���̵�
    U_PW NVARCHAR2(30), --���
    U_NAME NVARCHAR2(20)--������ �г���
);
CREATE TABLE WRITER_CLASS(--�۾��� ���, �⺻���� W�� ������� 
    W_NUM NUMBER,--��ޱ��
    W_C NVARCHAR2(20), --������
    U_ID NVARCHAR2(30) --�������̵�
);
CREATE TABLE BOARD_F(--�����Խ���
    F_NUM NUMBER,--���� ��ȣ
    F_TITLE NVARCHAR2(30),--�� ����
    F_DATE TIMESTAMP DEFAULT SYSDATE,-- �ۼ��� ��¥
    F_CONTENT CLOB, --�۳���
    U_ID NVARCHAR2(20) --�ۼ��� ������ ���̵�
);
CREATE TABLE BOARD_I(--�����Խ���
    I_NUM NUMBER,
    I_TITLE NVARCHAR2(30),--�� ����
    I_DATE TIMESTAMP DEFAULT SYSDATE,
    I_CONTENT CLOB,
    U_ID NVARCHAR2(20)
);
CREATE TABLE BOARD_Q(--�����Խ���
    Q_NUM NUMBER,
    Q_TITLE NVARCHAR2(30),--�� ����
    Q_DATE TIMESTAMP DEFAULT SYSDATE,
    Q_CONTENT CLOB,
    Q_ID NVARCHAR2(20)
);
CREATE TABLE BOARD_P(--�����Խ���
    P_NUM NUMBER,
    P_TITLE NVARCHAR2(30),--�� ����
    P_DATE TIMESTAMP DEFAULT SYSDATE,
    P_FILE NVARCHAR2(100), --������������
    U_ID NVARCHAR2(20)
);
--������
CREATE SEQUENCE SEQ_F_NUM INCREMENT BY 1 START WITH 1000;--������ ����, �����Խ���
CREATE SEQUENCE SEQ_P_NUM INCREMENT BY 1 START WITH 1000;--����Խ���
CREATE SEQUENCE SEQ_I_NUM INCREMENT BY 1 START WITH 1000;--�����Խ���
CREATE SEQUENCE SEQ_Q_NUM INCREMENT BY 1 START WITH 1000;--�����Խ���
CREATE SEQUENCE SEQ_WC_NUM INCREMENT BY 1 START WITH 1000;--���� ��� �̰��� �ڵ��������Դϴ�.


--������ ���Ƿ� �߰�
INSERT INTO WRITER VALUES('�͸�����01', 'user_viva', '�¸���');
INSERT INTO WRITER VALUES('�͸�����02', 'user_LOSE', '�й���');
INSERT INTO WRITER VALUES('�͸�����03', 'user_BIG', '�Ⱓƽ');
INSERT INTO WRITER VALUES('�͸�����04', 'user_EAT', '�������');
INSERT INTO WRITER VALUES('�͸�����05', 'user_WOW', '�Ϳ�');

--���Ƿ� ������ �����ڷ� ���� , �ϴ� �����ڸ� MASTER��� ����� ����
INSERT INTO WRITER_CLASS VALUES(SEQ_WU_NUM).NEXTVAL, 'MASTER', '�͸�����01');

--�����Խ��� ���Ƿ� �߰� NUM���� �ݵ�� SEQ_ID.NEXTVAL �ڵ����� ������ �ؾ���. �ߺ��� �����ϰ� �ڵ����� ���� ���
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, '��������ƿ�', '2020-02-13', '����̴� �ְ���, ���������� ����� �ƴϰڽ��ϱ�! �����ص� ������', '�͸�����01');--�ϴ��� ��¥�� ����ϸ� ������ �ð��� �־ ���������
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, '�������Ϳ���', '2020-02-21', '�������Ϳ���, ���������ϰ� �;�', '�͸�����02');
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, '�縷����ҹ�', '2020-04-11', '������ �縷���� �ҹ�����;; ����...', '�͸�����03');
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, '�޹� ����', '2020-02-14', '�޹����� �������ϴ� �� �ű���', '�͸�����04');
INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, 'ŷ������', '2020-03-15', 'ŷ�����̴� ��å�� �ʿ�����', '�͸�����05');

