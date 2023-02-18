/*
    ���̺�
    1. �����ͺ��̽��� ���� ��ǥ���� ��ü�̴�.
    2. �����͸� �����ϴ� ��ü�̴�.
    3. ǥ �������� �����͸� �����Ѵ�.
    4. ���̺� �⺻ ���
        1) �� : column, �Ӽ�(attribute),   �ʵ�(field)
        2) �� : row,    ��ü(entity),      ���ڵ�(record)    
*/

/*
    ����Ŭ�� ������ Ÿ��
    1. CHAR(size)       : ���� ���� ���� Ÿ��(size : 1 ~ 2000����Ʈ) - ����� ������ ���̰� �����Ǿ� ���� �� ���
    2. VARCHAR2(size)    : ���� ���� ���� Ÿ��(size : 1 ~ 4000����Ʈ)
    3. DATE             : ��¥/�ð� Ÿ��
    4. TIMESTAMP        : ��¥/�ð� Ÿ��(���� �� �����ϴ�.)
    5. NUMBER(p,s)      : p(���е�), s(������)�� ǥ���ϴ� ���� Ÿ��
        1) ���е� : �����ο� �Ҽ��θ� ��� �����ϴ� ��ü ��ȿ ���ڰ� �� ���ΰ�?
        2) ������ : �Ҽ����� ��ü ��ȿ ���ڰ� �� ���ΰ�?
        ����)
            (1) NUMBER      : �ִ� 38�ڸ� ����(22����Ʈ) ǥ�� ����
            (2) NUMBER(3)   : �����ΰ� �ִ� 3�ڸ��� ���� (�ִ� 999)
            (3) NUMBER(5,2) : ��ü 5�ڸ�, �Ҽ��� 2�ڸ� (���� : 123.45)
            (4) NUMBER(2,2) : 1 �̸��� �Ҽ��� 2�ڸ��� �Ǽ� (���� : 0.15) - �������� 0�� ��ȿ �ڸ��� �ƴϴ�.
*/
/*
    ��������(Constraint)
    1. ��
        1) NULL �Ǵ� ����
        2) NOT NULL
    2. �ߺ� ������ ����
        UNIQUE
    3. ���� ����
        CHECK
    4. PK (�⺻Ű) NOT NULL + UNIQUE
        PRIMARY KEY     NOT NULL + UNIQUE �� ��ü�� ��ü���Ἲ�̶� �θ�.
                    1(PK) : M(FK) (1 �� �ٰ���)
    5. FK (�ܷ�Ű, ����Ű)      ���� ���Ἲ 
        FOREIGN KEY     FK�� PK�� �����Ѵ�. FK�� �����ϴ� ���� ���� �� �ִ�.
*/
-- ���� ���̺�
DROP TABLE PRODUCT;

CREATE TABLE PRODUCT(
    CODE         VARCHAR2(2 BYTE)  NOT NULL UNIQUE,
    MODEL        VARCHAR2(10 BYTE) NULL,
    CATEGORY     VARCHAR2(5 BYTE)   CHECK(CATEGORY = 'MAIN' OR CATEGORY = 'SUB'), -- CHECK(CATEGORY IN('MAIN', 'SUB'));
    PRICE        NUMBER     CHECK(PRICE >= 0),
    AMOUNT       NUMBER(2)  CHECK(AMOUNT >= 0 AND AMOUNT <= 100),                 -- CHECK(AMOUNT BETWEEN 0 AND 100)
    MANUFACTURED DATE
);    

