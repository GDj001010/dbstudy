/*
    DDL
    1. DaTa Definition Language
    2. ������ ���Ǿ�
    3. �����ͺ��̽� ��ü(USER, TABLE, SEQUENCE, VIEW, INDEX ��)�� ����/����/�����ϴ� ����̴�.
    4. �Ϸ�� �۾��� ����� �� ����.(COMMIT �� �ʿ䰡 ����. ROLLBACK�� �� �� ����.)
    5. ����
        1) CREATE : ����
        2) ALTER  : ����
        3) DROP   : ����
*/


DROP TABLE CUSTOMER_TBL;
DROP TABLE BANK_TBL;


CREATE TABLE BANK_TBL (
   BANK_CODE VARCHAR2(20 BYTE),
   BANK_NAME VARCHAR2(30 BYTE),
   CONSTRAINT PK_BANK PRIMARY KEY(BANK_CODE)
);

CREATE TABLE CUSTOMER_TBL (
          NO NUMBER,
        NAME VARCHAR2(30 BYTE) NOT NULL,
       PHONE VARCHAR2(30 BYTE) UNIQUE,
         AGE NUMBER(3)         CHECK(AGE BETWEEN 0 AND 100),
   BANK_CODE VARCHAR2(20 BYTE),
   CONSTRAINT PK_CUSTOMER PRIMARY KEY(NO),
   CONSTRAINT FK_CUSTOMER_BANK FOREIGN KEY(BANK_CODE) REFERENCES BANK_TBL(BANK_CODE)
);

/*
    ���̺� �����ϱ�
    1. Į�� �߰�   : ALTER TABLE ���̺�� ADD Į���� ������Ÿ�� [��������]  �� ���� ���� �ʿ��ϸ� �ֱ�
    2. Į�� ����   : ALTER TABLE ���̺�� DROP COLUMN Į����
    3. Į�� ����   : ALTER TABLE ���̺�� MODIFY Į���� ������Ÿ�� [��������] (Į���� ������Ÿ��, �������� ����)
    4. Į�� �̸�   : ALTER TABLE ���̺�� RENAME COLUMN ����Į���� TO �ű�Į����
    5. ���̺� �̸� : ALTER TABLE ���̺�� RENAME TO �ű����̺��
*/

-- 1. BANK_TBL ���̺� ����ó(BANK_TEL) Į���� �߰��Ͻÿ�.
ALTER TABLE BANK_TBL
    ADD BANK_TEL NUMBER;

-- 2. CUSTOMER_TBL ���̺��� ����(AGE) Į���� �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL
    DROP COLUMN AGE;

-- 3. BANK_TBL ���̺��� �����(BANK_NAME) Į���� ������Ÿ���� VARCHAR2(15 BYTE)�� �����Ͻÿ�.
ALTER TABLE BANK_TBL
    MODIFY BANK_NAME VARCHAR2(15 BYTE);

-- 4. CUSTOMER_TBL ���̺��� ����(NAME) Į���� �̸��� CUST_NAME���� �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL
    RENAME COLUMN NAME TO CUST_NAME;


-- ���νǽ�.

-- 5. CUSTOMER_TBL ���̺� GRADE Į���� �߰��Ͻÿ�. 
--    GRADE Į���� 'VIP', 'GOLD', 'SILVER', 'BRONZE' �� �ϳ��� ���� ���� �� �ֵ��� CHECK ���������� �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL
    ADD GRADE VARCHAR2(6 BYTE) CHECK(GRADE IN('VIP', 'GOLD', 'SILVER', 'BRONZE'));


-- 6. BANK_TBL ���̺��� BANK_NAME Į���� NOT NULL ���������� �߰��Ͻÿ�.
ALTER TABLE BANK_TBL
    MODIFY BANK_NAME VARCHAR2(15 BYTE) NOT NULL;

-- 7. CUSTOMER_TBL ���̺��� NO Į���� �̸��� CUST_NO�� �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL
    RENAME COLUMN NO TO CUST_NO;

-- 8. CUSTOMER_TBL ���̺��� PHONE Į���� �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL
    DROP COLUMN PHONE;

-- 9. CUSTOMER_TBL ���̺��� CUST_NAME Į���� NOT NULL ���������� NULL ������������ �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL
    MODIFY CUST_NAME VARCHAR2(30 BYTE) NULL; -- ������ �� NULL ��� �� ���൵ ������ ������ �� NULL ǥ�� ����� �� ��� �� ���� �� ���� �������� �״�� ���