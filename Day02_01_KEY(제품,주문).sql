/*
    KEY ��������
    1. �⺻Ű(PK) PRIMARY KEY
        1) ��ü���Ἲ
        2) PK�� NOT NULL + UNIQUE �ؾ� �Ѵ�.
    2. �ܷ�Ű(FK) FOREIGN KEY
        1) �������Ἲ
        2) FK�� �����ϴ� ���� ���� �� �ִ�.
*/
/*
    �ϴ�ٰ���(1:M) ����
    1. PK�� FK�� ���� ���̺� ���� �����̴�.
        1) �θ� ���̺� : 1, PK�� ���� ���̺�
        2) �ڽ� ���̺� : M, FK�� ���� ���̺�
    2. ������ ���� ��Ģ
        1) ���� ��Ģ : "�ݵ��" �θ� ���̺��� ���� �����Ѵ�.
        2) ���� ��Ģ : "�ݵ��" �ڽ� ���̺��� ���� �����Ѵ�.
*/
/*
    �ܷ�Ű �������� �ɼ�
    �θ� �������� �� "�������Ἲ" ���谡 ���� - FK
    1. �θ� �������� ���� ����� �ɼ� ONDELETE
        1) �θ� ������ ���� �״´� ( ���� �������� ) 
            CASCADE
            ON DELETE CASCADE
        2) �θ� ������ NULL ó�� �Ѵ� (�ֹ������� �츮�鼭 FK ĭ�� NULL ó�� )
            SET NULL
            ON DELETE SET NULL
*/
/*
    �ܷ�Ű ���� ������ �ɼ�
    1. ON DELETE CASCADE  �Ǽ�
        1) ���� ���� PARENT KEY�� �����Ǹ� �ش� PARENT KEY�� ���� �� ��ü�� �Բ� �����Ѵ�.
        2) ����) ȸ�� Ż�� �� �ۼ��� ��� �Խñ��� �Բ� �����˴ϴ�.
                 �Խñ� ���� �� �ش� �Խñۿ� �޸� ��� ����� �Բ� �����˴ϴ�.
    2. ON DELETE SET NULL  ����
        1) ���� ���� PARENT KEY�� �����Ǹ� �ش� PARENT KEY�� ���� Į�� ���� NULL�� ó���Ѵ�.
        2) ����) � ��ǰ�� �����Ͽ����� �ش� ��ǰ�� �ֹ� ������ ���� �ִ� ���
*/
-- ���̺� ����               ������ ���Ƽ� ���ʿ� ��ġ, ������ �Ʒ��� ��ġ
DROP TABLE ORDER_TBL;           -- �ڽ� ���̺� ���� ���� �� �θ� ���̺� ����
DROP TABLE PRODUCT_TBL;

-- ��ǰ ���̺� (�θ� ���̺�)
CREATE TABLE PRODUCT_TBL (
    PROD_NO NUMBER NOT NULL,        
    PROD_NAME VARCHAR2(10 BYTE),
    PROD_PRICE NUMBER,
    PROD_STOCK NUMBER,
    CONSTRAINT PK_PROD PRIMARY KEY(PROD_NO)  -- PK �⺻Ű
);

-- �ֹ� ���̺� (�ڽ� ���̺�)
CREATE TABLE ORDER_TBL (
    ORDER_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(10 BYTE),
    PROD_NO NUMBER , 
    ORDER_DATE DATE,
    CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_NO),    -- PK �⺻Ű
    CONSTRAINT FK_ORDER_PROD FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO) ON DELETE CASCADE  -- FK �ܷ�Ű
);

-- CONSTRAINT : ��������
-- REFERENCES : ����

/*
    �������� ���̺�
    1. SYS, SYSTEM ���� �������� �����ؼ� Ȯ���Ѵ�.
    2. ����
        1) ALL_CONSTRAINTS
        2) USER_CONSTRAINTS   ����ڿ� ��������
        3) DBA_CONSTRAINTS
        _ �ڿ� ��ȸ�� ���   ����) USER_TABLE"S"  ������ ���̺��
        
*/

-- ���̺� ���� Ȯ���ϴ� ������ (����)
-- DESCRIBE USER_CONSTRAINTS;

-- ���̺� Į�� �� PK�� �����ϴ� �ο�(��, ��) ��ȸ
/*
SELECT * 
  FROM ALL_CONSTRAINTS
 WHERE CONSTRAINT_NAME LIKE 'PK%';
*/