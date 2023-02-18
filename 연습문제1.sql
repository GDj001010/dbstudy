-- 1. ���� Į�� ������ �̿��Ͽ� MEMBER_TBL ���̺��� �����Ͻÿ�.
--    1) ȸ����ȣ: MEMBER_NO, NUMBER, �ʼ�
--    2) ȸ�����̵�: ID, VARCHAR2(30 BYTE), �ʼ�, �ߺ� �Ұ�
--    3) ȸ���н�����: PW, VARCHAR2(30 BYTE), �ʼ�
--    4) ȸ������Ʈ: POINT, NUMBER
--    5) ȸ�����: GRADE, VARCHAR2(10 BYTE), 'VIP', 'GOLD', 'SILVER', 'BRONZE' �� �� �ϳ��� ����
--    6) ȸ���̸���: EMAIL, VARCHAR2(100 BYTE), �ߺ� �Ұ�


CREATE TABLE MEMBER_TBL (
    MEMBER_NO   NUMBER              NOT NULL,
    ID          VARCHAR2(30 BYTE)   NOT NULL UNIQUE, 
    PW          VARCHAR2(20 BYTE)   NOT NULL,
    POINT       NUMBER,
    GRADE       VARCHAR2(10 BYTE)   CHECK(GRADE = 'VIP' OR GRADE = 'GOLD' OR GRADE = 'SILBER' OR GRADE = 'BRONZE'), -- CHECK(GRADE IN ('VIP', 'GOLD', SILBER', 'BRONZE'))
    EMAIL       VARCHAR2(100 BYTE) UNIQUE
);

-- 2. MEMBER_TBL ���̺� ���� ���ο� Į���� �߰��Ͻÿ�.
--    1) ȸ���ּ�: ADDRESS VARCHAR2(200 BYTE)
--    2) ȸ��������: REGIST_DATE DATE
ALTER TABLE MEMBER_TBL
    ADD ADDRESS      VARCHAR2(200 BYTE);
ALTER TABLE MEMBER_TBL
    ADD REGIST_DATE  DATE;


-- 3. �߰��� ȸ���ּ� Į���� �ٽ� �����Ͻÿ�.
ALTER TABLE MEMBER_TBL
    DROP COLUMN ADDRESS;


-- 4. ȸ����� Į���� Ÿ���� VARCHAR2(20 BYTE)���� �����Ͻÿ�.
ALTER TABLE MEMBER_TBL
    MODIFY GRADE VARCHAR2(20 BYTE);

-- 5. ȸ���н����� Į���� �̸��� PWD�� �����Ͻÿ�.
ALTER TABLE MEMBER_TBL
    RENAME COLUMN PW TO PWD;

-- 6. ȸ����ȣ Į���� �⺻Ű(PK_MEMBER)�� �����Ͻÿ�.
ALTER TABLE MEMBER_TBL
    ADD CONSTRAINT PK_MEMBER PRIMARY KEY(MEMBER_NO);

-- 7. ���� Į�� ������ �̿��Ͽ� BOARD_TBL ���̺��� �����Ͻÿ�.
--    1) �۹�ȣ: BOARD_NO, NUMBER, �ʼ�
--    2) ������: TITLE, VARCHAR2(1000 BYTE), �ʼ�
--    3) �۳���: CONTENT, VARCHAR2(4000 BYTE), �ʼ�
--    4) ��ȸ��: HIT, VARCHAR2(1 BYTE)
--    5) �ۼ���: WRITER, VARCHAR2(30 BYTE), �ʼ�
--    6) �ۼ�����: CREATE_DATE, DATE
CREATE TABLE BOARD_TBL (
    BOARD_NO    NUMBER              NOT NULL,
    TITLE       VARCHAR2(1000 BYTE) NOT NULL,
    CONTENT     VARCHAR2(4000 BYTE) NOT NULL,
    HIT         VARCHAR2(1 BYTE),
    WRITER      VARCHAR2(30 BYTE)   NOT NULL,
    CREATE_DATE DATE
);


-- 8. ��ȸ�� Į���� Ÿ���� NUMBER�� �����Ͻÿ�.
ALTER TABLE BOARD_TBL
    MODIFY HIT NUMBER;


-- 9. �۳��� Į���� �ʼ� ���������� �����Ͻÿ�.
ALTER TABLE BOARD_TBL
    MODIFY CONTENT VARCHAR2(4000 BYTE) NULL;

-- 10. �۹�ȣ Į���� �⺻Ű(PK_BOARD)�� �����Ͻÿ�.
ALTER TABLE BOARD_TBL
    ADD CONSTRAINT PK_BOARD PRIMARY KEY(BOARD_NO);

-- 11. �ۼ��� Į���� MEMBER_TBL ���̺��� ȸ�����̵� �����ϴ� FK_BOARD_MEMBER �ܷ�Ű�� �����Ͻÿ�.
-- �Խñ��� �ۼ��� ȸ�� ������ �����Ǹ� �ش� ȸ���� �ۼ��� �Խñ۵� ��� �Բ� ���������� ó���Ͻÿ�.
ALTER TABLE BOARD_TBL
    ADD CONSTRAINT FK_BOARD_MEMBER FOREIGN KEY(WRITER)
        REFERENCES MEMBER_TBL(ID)
            ON DELETE CASCADE;

-- 12. MEMBER_TBL ���̺�� BOARD_TBL ���̺��� ��� �����Ͻÿ�.
DROP TABLE BOARD_TBL;
DROP TABLE MEMBER_TBL;
