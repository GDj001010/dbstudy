-- ���ڿ� �Լ�


-- 1. ��ҹ��� ��ȯ �Լ�
SELECT
       UPPER(EMAIL)   -- �빮��
     , LOWER(EMAIL)   -- �ҹ���
     , INITCAP(EMAIL) -- ù ���ڴ� �빮��, �������� �ҹ���
  FROM
       EMPLOYEES;


-- 2. ���� ��(����Ʈ ��) ��ȯ �Լ�
SELECT
       LENGTH('HELLO')  -- ���� �� : 5
     , LENGTH('�ȳ�')   -- ���� �� : 2
     , LENGTHB('HELLO') -- ����Ʈ �� : 5
     , LENGTHB('�ȳ�')  -- ����Ʈ �� : 6
  FROM
       DUAL;


-- 3. ���ڿ� ���� �Լ�/������
--    1) �Լ�   : CONCAT(A, B)  ����! �μ��� 2���� ���� �����ϴ�.(CONCAT(A, B, C) ���� ���´� �Ұ����ϴ�.)
--    2) ������ : ||   ����! OR ���� �ƴմϴ�! ����Ŭ �����Դϴ�!
SELECT
       CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME)
     , FIRST_NAME || ' ' || LAST_NAME
  FROM
       EMPLOYEES;


-- 4. ���ڿ� �Ϻ� ��ȯ�ϱ�
--    SUBSTR(Į��, BEGIN, LENGTH) : BEGIN���� LENGTH���� ��ȯ
--    ����! BEGIN�� 1���� �����Ѵ�.
SELECT
       SUBSTR(EMAIL, 1, 3)  -- 1��° ���ں��� 3���ڸ� �������ÿ�.
  FROM
       EMPLOYEES;


-- 5. Ư�� ���ڿ��� ��ġ ��ȯ�ϱ�
--    INSTR(Į��, ã�����ڿ�)
--    ����! ��ȯ�Ǵ� ��ġ ������ �ε����� �ƴϹǷ� 0���� �������� �ʰ�, 1���� �����Ѵ�.
--    �� ã���� 0�� ��ȯ�Ѵ�.
SELECT
       INSTR(EMAIL, 'A')  -- 'A'�� ��ġ�� ��ȯ
  FROM
       EMPLOYEES;


-- 6. ���ڿ� ä���(PADDING)
--    1) LPAD(Į��, ��ü��, ä�﹮��)
--    2) RPAD(Į��, ��ü��, ä�﹮��)
SELECT
       LPAD(NVL(DEPARTMENT_ID, 0), 3, '0')
     , RPAD(SUBSTR(EMAIL, 1, 2), 5, '*')
  FROM
       EMPLOYEES;


-- 7. ���ʿ��� ���� ����
--    1) LTRIM(Į��) : ���� ���� ����
--    2) RTRIM(Į��) : ������ ���� ����
--    3) TRIM(Į��)  : ����, ������ ���� ��� ����
SELECT
       '[' || LTRIM('     HELLO') || ']'
     , '[' || RTRIM('HELLO     ') || ']'
     , '[' || TRIM('   HELLO   ') || ']'
  FROM
       DUAL;