-- ���� ������
DROP TABLE SAMPLE_TBL;
CREATE TABLE SAMPLE_TBL (
    NAME VARCHAR2(10 BYTE),
    KOR  NUMBER(3),
    ENG  NUMBER(3),
    MAT  NUMBER(3)
);

INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES(NULL, 100, 100, 100);
INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES('����', NULL, 90, 90);
INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES('����', 80, NULL, 80);
INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES('ö��', 70, 70, NULL);
COMMIT;


-- NULL ���� ���Ե� ���� ����� NULL�̴�.
SELECT NAME, KOR + ENG + MAT AS TOTAL
  FROM SAMPLE_TBL;      -- ���
  
  
-- 1. NVL(Į��, NULL��� ����� ��)
--    NVL(NULL VALUE)�Լ�
SELECT
       NVL(NAME, '�ƹ���') AS �̸�
     , NVL(KOR, 0) + NVL(ENG, 0) + NVL(MAT, 0) AS ����
  FROM
       SAMPLE_TBL;
       
-- 2. NVL2(Į��, NULL�� �ƴ� �� ����� ��, NULL�� �� ����� ��)
SELECT 
        NVL2(KOR + ENG + MAT, '����', '���')
  FROM
       SAMPLE_TBL;