/*
    �ٴ��(M:N) ����
    1. ���ǿ��� ����� ��Ÿ������ �����ؾ� �ϴ� �����̴�.
    2. �� ���̺��� �ٴ�� ����� ���� �����ϴ� ���� �Ұ����ϴ�.
    3. �� ���̺��� ���� �ξ� �� ������ ���̺��� �߰��� �ʿ��ϴ�.
    4. �ٴ��(M:N) ���� 1���� �ϴ��(1:M) ���� 2���� ���� �� �ִ�.
*/

-- ���̺� ����(����! ������ �������� ������ ��!)
DROP TABLE ENROLL_TBL;
DROP TABLE SUBJECT_TBL;
DROP TABLE STUDENT_TBL;

/*
    ����. ���̺� ���� ������ �����ϰ� ������ �� �ִ� �ɼ��� �ִ�.(�Ʒ��� ���� ������� �����ϱ� ����)
    DROP TABLE STUDENT_TBL CASCADE CONSTRAINTS;
    DROP TABLE SUBJECT_TBL CASCADE CONSTRAINTS;
    DROP TABLE ENROLL_TBL CASCADE CONSTRAINTS;
    ��õ�ϴ� ���� �ƴϹǷ� �˰� ��ô� �ɷ� �����ϱ�!
*/

-- �л� ���̺� ����
CREATE TABLE STUDENT_TBL (
    STU_NO    VARCHAR2(5 BYTE)  NOT NULL,
    STU_NAME  VARCHAR2(15 BYTE) NULL,
    STU_AGE   NUMBER(3)         NULL,
    CONSTRAINT PK_STUDENT PRIMARY KEY(STU_NO)
);

-- ���� ���̺� ����
CREATE TABLE SUBJECT_TBL (
    SJT_CODE  VARCHAR2(1 BYTE)  NOT NULL,
    SJT_NAME  VARCHAR2(10 BYTE) NULL,
    PROFESSOR VARCHAR2(15 BYTE) NULL,
    CONSTRAINT PK_SUBJECT PRIMARY KEY(SJT_CODE)
);

-- ������û ���̺� ����
CREATE TABLE ENROLL_TBL (
    ENR_NO   NUMBER           NOT NULL,
    STU_NO   VARCHAR2(5 BYTE) NOT NULL,
    SJT_CODE VARCHAR2(1 BYTE) NOT NULL,
    CONSTRAINT PK_ENROLL PRIMARY KEY(ENR_NO),
    CONSTRAINT FK_ENROLL_STUDENT FOREIGN KEY(STU_NO) REFERENCES STUDENT_TBL(STU_NO) ON DELETE CASCADE, 
    CONSTRAINT FK_ENROLL_SUBJECT FOREIGN KEY(SJT_CODE) REFERENCES SUBJECT_TBL(SJT_CODE) ON DELETE CASCADE
);