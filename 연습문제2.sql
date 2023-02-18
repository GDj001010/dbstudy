-- 1. ���� ������ �а� ������ ���̺��� �����ϵ�, �⺻Ű/�ܷ�Ű�� ������ �������� ���ÿ�.

DROP TABLE ORDER_TBL;
DROP TABLE CUSTOMER_TBL;
DROP TABLE BOOK_TBL;

-- 1) BOOK_TBL ���̺�
--    (1) BOOK_ID : å��ȣ, ���� (�ִ� 11�ڸ�), �ʼ�
--    (2) BOOK_NAME : å�̸�, ���� ���� ���� (�ִ� 100 BYTE)
--    (3) PUBLISHER : ���ǻ�, ���� ���� ���� (�ִ� 50 BYTE)
--    (4) PRICE : ����, ���� (�ִ� 6�ڸ�)
CREATE TABLE BOOK_TBL (
    BOOK_ID   NUMBER(11) NOT NULL,
    BOOK_NAME VARCHAR2(100 BYTE),
    PUBLISHER VARCHAR2(50 BYTE),
    PRICE     NUMBER(6)
);

-- 2) CUSTOMER_TBL ���̺�
--    (1) CUSTOMER_ID : ����ȣ, ���� (�ִ� 11�ڸ�), �ʼ�
--    (2) CUSTOMER_NAME : ����, ���� ���� ���� (�ִ� 20 BYTE)
--    (3) ADDRESS : �ּ�, ���� ���� ���� (�ִ� 50 BYTE)
--    (4) PHONE : ��ȭ, ���� ���� ���� (�ִ� 20 BYTE)
CREATE TABLE CUSTOMER_TBL (
    CUSTOMER_ID   NUMBER(11) NOT NULL,
    CUSTOMER_NAME VARCHAR2(20 BYTE),
    ADDRESS       VARCHAR2(50 BYTE),
    PHONE         VARCHAR2(20 BYTE)
);

-- 3) ORDER_TBL ���̺�
--    (1) ORDER_ID : �ֹ���ȣ, ���� ���� ���� (�ִ� 20 ����Ʈ), �ʼ�
--    (2) CUSTOMER_ID : ����ȣ, ���� (�ִ� 11�ڸ�)
--    (3) BOOK_ID : å��ȣ, ���� (�ִ� 11�ڸ�)
--    (4) AMOUNT : �Ǹż���, ���� (�ִ� 2�ڸ�)
--    (5) ORDER_DATE : �ֹ���, ��¥
CREATE TABLE ORDER_TBL (
    ORDER_ID    VARCHAR2(20 BYTE) NOT NULL,
    CUSTOMER_ID NUMBER(11),
    BOOK_ID     NUMBER(11),
    AMOUNT      NUMBER(2),
    ORDER_DATE  DATE
);


-- 2. 1���� 1�� �����ϴ� ���� �����ϴ� BOOK_SEQ �������� ������ ��, BOOK_SEQ�� �̿��Ͽ� BOOK_TBL ���̺� INSERT�� �����Ͻÿ�.
/*
å��ȣ  å�̸�           ���ǻ�      ����
1       �౸�� ����      �½�����    7000
2       �౸ �ƴ� ����   ���̽���    13000
3       �౸�� ����      ���ѹ̵��  22000
4       ���� ���̺�      ���ѹ̵��  35000
5       �ǰ� ����        �½�����    6000
6       ���� �ܰ躰 ��� �½�����    6000
7       �߱��� �߾�      �̻�̵��  20000
8       �߱��� ��Ź��    �̻�̵��  13000
9       �ø��� �̾߱�    �Ｚ��      7500
10      �ø��� è�Ǿ�    ���̽���    13000
*/
DROP SEQUENCE BOOK_SEQ;
CREATE SEQUENCE BOOK_SEQ
    NOCACHE;
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL, '�౸�� ����', '�½�����', 7000);
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL, '�౸ �ƴ� ����', '���̽���', 13000);
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL, '�ǰ� ����', '�½�����', 6000);
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL, '���� �ܰ躰 ���', '�½�����', 6000);
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO BOOK_TBL(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (BOOK_SEQ.NEXTVAL,'�ø��� è�Ǿ�', '���̽���', 13000);
COMMIT;


-- 3. 1000���� 1�� �����ϴ� ���� �����ϴ� CUSTOMER_SEQ �������� ������ ��, CUSTOMER_SEQ�� �̿��Ͽ� INSERT�� �����Ͻÿ�.
/*
ȸ����ȣ ����   �ּ�      ��ȭ
1000     ������   ����      000-000-000
1001     �迬��   ���ѹα�  111-111-111
1002     ��̶�   ���ѹα�  222-222-222
1003     �߽ż�   �̱�      333-333-333
1004     �ڼ���   ���ѹα�  NULL
*/
DROP SEQUENCE CUSTOMER_SEQ;
CREATE SEQUENCE CUSTOMER_SEQ
    START WITH 1000
    NOCACHE;
INSERT INTO CUSTOMER_TBL(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (CUSTOMER_SEQ.NEXTVAL, '������', '����', '000-000-000');
INSERT INTO CUSTOMER_TBL(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (CUSTOMER_SEQ.NEXTVAL, '�迬��', '���ѹα�', '111-111-111');
INSERT INTO CUSTOMER_TBL(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (CUSTOMER_SEQ.NEXTVAL, '��̶�', '���ѹα�', '222-222-222');
INSERT INTO CUSTOMER_TBL(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (CUSTOMER_SEQ.NEXTVAL, '�߽ż�', '�̱�', '333-333-333');
INSERT INTO CUSTOMER_TBL(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (CUSTOMER_SEQ.NEXTVAL, '�ڼ���', '���ѹα�', NULL);
COMMIT;


-- 4. 1���� 1�� �����ϴ� ORDER_SEQ �������� ������ ��, '���糯¥6�ڸ�-������' �������� �ֹ���ȣ�� ���� INSERT�� �����Ͻÿ�.
/*
�ֹ���ȣ   ����ȣ  å��ȣ  �Ǹż��� �ֹ�����
230210-1   1000      1       1        20/07/01
230210-2   1000      3       2        20/07/03
230210-3   1001      5       1        20/07/03
230210-4   1002      6       2        20/07/04
230210-5   1003      7       3        20/07/05
230210-6   1000      2       5        20/07/07
230210-7   1003      8       2        20/07/07
230210-8   1002      10      2        20/07/08
230210-9   1001      10      1        20/07/09
230210-10  1002      6       4        20/07/10
*/
DROP SEQUENCE ORDER_SEQ;
CREATE SEQUENCE ORDER_SEQ
    NOCACHE;
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1000, 1, 1, '20/07/01');
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1000, 3, 2, '20/07/03');
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1001, 5, 1, '20/07/03');
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1002, 6, 2, '20/07/04');
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1003, 7, 3, '20/07/05');
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1000, 2, 5, '20/07/07');
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1003, 8, 2, '20/07/07');
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1002, 10, 2, '20/07/08');
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1001, 10, 1, '20/07/09');
INSERT INTO ORDER_TBL(ORDER_ID, CUSTOMER_ID, BOOK_ID, AMOUNT, ORDER_DATE) VALUES (TO_CHAR(SYSDATE, 'YYMMDD-') || ORDER_SEQ.NEXTVAL, 1002, 6, 4, '20/07/10');
COMMIT;


-- 5. BOOK_TBL, CUSTOMER_TBL, ORDER_TBL ���̺��� BOOK_ID, CUSTOMER_ID, ORDER_ID Į���� �⺻Ű�� �߰��Ͻÿ�.
-- �⺻Ű ���������� �̸��� PK_BOOK, PK_CUSTOMER, PK_ORDER���� �����Ͻÿ�.
ALTER TABLE BOOK_TBL
    ADD CONSTRAINT PK_BOOK PRIMARY KEY(BOOK_ID);
ALTER TABLE CUSTOMER_TBL
    ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY(CUSTOMER_ID);
ALTER TABLE ORDER_TBL
    ADD CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_ID);


-- 6. ORDER_TBL ���̺��� CUSTOMER_ID, BOOK_ID Į���� ���� CUSTOMER_TBL ���̺�� BOOK_TBL ���̺��� ������ �ܷ�Ű�� �߰��Ͻÿ�.
-- �ܷ�Ű ���������� �̸��� FK_ORDER_CUSTOMER, FK_ORDER_BOOK���� �����Ͻÿ�.
-- CUSTOMER_ID�� BOOK_ID�� �����Ǵ� ��� �̸� �����ϴ� ORDER_TBL ���̺��� ������ NULL�� ó���Ͻÿ�.
ALTER TABLE ORDER_TBL
    ADD CONSTRAINT FK_ORDER_CUSTOMER FOREIGN KEY(CUSTOMER_ID)
        REFERENCES CUSTOMER_TBL(CUSTOMER_ID)
            ON DELETE SET NULL;
ALTER TABLE ORDER_TBL
    ADD CONSTRAINT FK_ORDER_BOOK FOREIGN KEY(BOOK_ID)
        REFERENCES BOOK_TBL(BOOK_ID)
            ON DELETE SET NULL;

-- 7. '�迬��'�� ������ ���������� ��ȸ�Ͻÿ�.
-- ����  ���ŵ�����
-- �迬��  2
SELECT C.CUSTOMER_NAME AS ����
       , COUNT(*) AS ���ŵ�����
  FROM CUSTOMER_TBL C INNER JOIN ORDER_TBL O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
 WHERE C.CUSTOMER_NAME = '�迬��'
 GROUP BY CUSTOMER_NAME; 





-- 8. �ֹ��� �̷��� ���� ���� �̸��� ��ȸ�Ͻÿ�.
-- ����
-- �ڼ���
SELECT C.CUSTOMER_NAME AS ����
  FROM CUSTOMER_TBL C LEFT OUTER JOIN ORDER_TBL O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
 WHERE O.CUSTOMER_ID IS NULL;



-- 9. '������'�� ������ ������ �߰��� ���ǻ�(PUBLISHER) ������ ��ȸ�Ͻÿ�.
-- ����  ���ǻ��
-- ������  3
SELECT C.CUSTOMER_NAME AS ����
     , COUNT(*) AS ���ǻ��
  FROM CUSTOMER_TBL C INNER JOIN ORDER_TBL O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID INNER JOIN BOOK_TBL B
    ON B.BOOK_ID = O.BOOK_ID
 WHERE C.CUSTOMER_NAME = '������'
 GROUP BY C.CUSTOMER_NAME;





-- 10. 2020�� 7�� 4�Ϻ��� 7�� 7�� ���̿� �ֹ� ���� ������ �����ϰ� ������ ��� �ֹ� ������ ��ȸ�Ͻÿ�.
-- ���Ź�ȣ  ������  å�̸�           �ǸŰ��� �ֹ�����
-- 230210-1  ������  �౸�� ����      7000     20/07/01
-- 230210-2  ������  �౸�� ����      44000    20/07/03
-- 230210-3  �迬��  �ǰ� ����        6000     20/07/03
-- 230210-10 ��̶�  ���� �ܰ躰 ��� 24000    20/07/10
-- 230210-9  �迬��  �ø��� è�Ǿ�    13000    20/07/09
-- 230210-8  ��̶�  �ø��� è�Ǿ�    26000    20/07/08
SELECT O.ORDER_ID AS ���Ź�ȣ
     , C.CUSTOMER_NAME AS ������
     , B.BOOK_NAME AS å�̸�
     , B.PRICE * O.AMOUNT AS �ǸŰ���
     , O.ORDER_DATE AS �ֹ�����
  FROM BOOK_TBL B INNER JOIN ORDER_TBL O
    ON B.BOOK_ID = O.BOOK_ID INNER JOIN CUSTOMER_TBL C
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
 WHERE TO_DATE(O.ORDER_DATE, 'YY/MM/DD') NOT BETWEEN TO_DATE('20/07/04', 'YY/MM/DD') AND TO_DATE('20/07/07', 'YY/MM/DD')
 ;




-- 11. ��� ���� ���� �̸��� �ѱ��ž�(PRICE * AMOUNT)�� ��ȸ�Ͻÿ�.
-- ���� �̷��� �ִ� ���� ��ȸ�Ͻÿ�.(�ֹ������� �ְ�, ���� �ִ� ������ = ���� ����)
-- ����  �ѱ��ž�
-- �迬��  19000
-- ��̶�  62000
-- ������  116000
-- �߽ż�  86000
SELECT C.CUSTOMER_NAME AS ����
     , SUM(B.PRICE * O.AMOUNT) AS �ѱ��ž�
  FROM CUSTOMER_TBL C INNER JOIN ORDER_TBL O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID INNER JOIN BOOK_TBL B
    ON B.BOOK_ID = O.BOOK_ID
 GROUP BY C.CUSTOMER_NAME, C.CUSTOMER_ID
 ORDER BY C.CUSTOMER_ID;



-- 12. ��� ���� ���� �̸��� �ѱ��ž�(PRICE * AMOUNT)�� ����Ƚ���� ��ȸ�Ͻÿ�.
-- ���� �̷��� ���� ���� �ѱ��žװ� ����Ƚ���� 0���� ��ȸ�Ͻÿ�. (���� ��� ��ȸ, �ֹ������� �ִ� �ڷḸ ��ȸ = ���� �ܺ� ����)
-- ����ȣ������ �������� �����Ͽ� ��ȸ�Ͻÿ�.
-- ����  �ѱ��ž�  ����Ƚ��
-- ������  116000     3
-- �迬��  19000      2
-- ��̶�  62000      3
-- �߽ż�  86000      2
-- �ڼ���  0          0

SELECT C.CUSTOMER_NAME AS ����
     , NVL(SUM(B.PRICE * O.AMOUNT), 0) AS �ѱ��ž�
     , NVL(COUNT(O.ORDER_ID), 0) AS ����Ƚ��
  FROM CUSTOMER_TBL C LEFT OUTER JOIN ORDER_TBL O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID LEFT OUTER JOIN BOOK_TBL B
    ON B.BOOK_ID = O.BOOK_ID
 GROUP BY C.CUSTOMER_NAME, C.CUSTOMER_ID
 ORDER BY C.CUSTOMER_ID;


-- 13. ���� �ֱٿ� ������ ���� �̸��� ���ų���(å�̸�, �ֹ�����)�� ��ȸ�Ͻÿ�.
-- ����  å�̸�            �ֹ�����
-- ��̶�  ���� �ܰ躰 ���  20/07/10
SELECT C.CUSTOMER_NAME AS ����
     , B.BOOK_NAME AS å�̸�
     , O.ORDER_DATE AS �ֹ�����
  FROM CUSTOMER_TBL C INNER JOIN ORDER_TBL O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID INNER JOIN BOOK_TBL B
    ON B.BOOK_ID = O.BOOK_ID
 WHERE O.ORDER_DATE = (SELECT MAX(ORDER_DATE)
                         FROM ORDER_TBL);
                        


-- 14. ��� ���� �߿��� ���� ��� ������ ������ ���� �̸��� ���ų���(å�̸�, ����)�� ��ȸ�Ͻÿ�.
-- ���� ��� ������ ������ ���� ���ٸ� �� �̸��� NULL�� ó���Ͻÿ�.
-- ����  å�̸�       å����
-- NULL    ���� ���̺�  35000
SELECT 
      NVL(C.CUSTOMER_NAME, 'NULL') AS ����
    , B.BOOK_NAME AS å�̸�
    , B.PRICE AS å����
  FROM BOOK_TBL B LEFT OUTER JOIN ORDER_TBL O
    ON B.BOOK_ID = O.BOOK_ID LEFT OUTER JOIN CUSTOMER_TBL C
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
 WHERE B.PRICE = (SELECT MAX(PRICE)
                    FROM BOOK_TBL);
                 


-- 15. �ѱ��ž��� 2~3���� ���� �̸��� �ѱ��ž��� ��ȸ�Ͻÿ�.
-- ����  �ѱ��ž�
-- �߽ż�  86000
-- ��̶�  62000
SELECT 
       C.CUSTOMER_NAME AS ����
     , SUM(B.PRICE * O.AMOUNT) AS �ѱ��ž�
  FROM CUSTOMER_TBL C INNER JOIN ORDER_TBL O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID INNER JOIN BOOK_TBL B
    ON B.BOOK_ID = O.BOOK_ID
 WHERE BETWEEN 2 AND 3 = (SELECT SUM(B.PRICE * O.AMOUNT)
                            FROM BOOK_TBL B INNER JOIN ORDER_TBL O
                              ON B.BOOK_ID = O.BOOK_ID);
