/*
    GROUP BY��
    1. GROUP BY������ ������ Į���� �����ʹ� ������ �����ͳ��� �ϳ��� �𿩼� ��ȸ�ȴ�.
    2. SELECT������ ��ȸ�Ϸ��� Į���� "�ݵ��" GROUP BY���� �־�� �Ѵ�.(�ʼ� ��Ģ)
*/

-- 1. ������ DEPARTMENT_ID�� �׷�ȭ�Ͽ� ��ȸ�Ͻÿ�.
SELECT DEPARTMENT_ID
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;

-- 2. ������ DEPARTMENT_ID�� �׷�ȭ�Ͽ� FIRST_NAME�� DEPARTMENT_ID�� ��ȸ�Ͻÿ�. (�����ϴ� ������)
SELECT FIRST_NAME, DEPARTMENT_ID  -- FIRST_NAME Į���� GROUP BY���� ���� ������ ������� �ʴ´�.
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;

-- 3. GROUP BY���� ���� �����Լ��� ��ü �����͸� ������� �Ѵ�.
SELECT
       COUNT(*) AS ��ü�����
     , SUM(SALARY) AS ��ü���������
     , AVG(SALARY) AS ��ü����������
     , MAX(SALARY) AS ��ü�������ŷ
     , MIN(SALARY) AS ��ü���������
  FROM
       EMPLOYEES;


-- 4. GROUP BY���� �����ϸ� ���� �׷쳢�� �����Լ��� ����ȴ�.
SELECT
       DEPARTMENT_ID
     , COUNT(*) AS �μ��������
     , SUM(SALARY) AS �μ���������
     , AVG(SALARY) AS �μ����������
     , MAX(SALARY) AS �μ�������ŷ
     , MIN(SALARY) AS �μ���������
  FROM
       EMPLOYEES
 GROUP BY
       DEPARTMENT_ID;

-- ����. GROUP BY ���� �����Լ� ����ϱ�
SELECT
       DISTINCT DEPARTMENT_ID
     , COUNT(*) OVER(PARTITION BY DEPARTMENT_ID) AS �μ��������
     , SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS �μ���������
     , AVG(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS �μ����������
     , MAX(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS �μ�������ŷ
     , MIN(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS �μ���������
  FROM
       EMPLOYEES;


/*
    ���� �����ϱ�
    1. GROUP BY���� �׷�ȭ �� ���(���)�� �������� ���ɿ� �����ϴ�.
    2. GROUP BY ������ ó���� �� �ִ� ������ WHERE���� ó���ϴ� ���� �����ϴ�.
    3. GROUP BY ���Ŀ��� ó���� �� �ִ� ������ HAVING���� ó���Ѵ�.
*/

-- 5. DEPARTMENT_ID�� NULL�� �μ��� �����ϰ�, ��� �μ��� �μ��� ��� ���� ��ȸ�Ͻÿ�.
--    �ؼ�) DEPARTMENT_ID�� NULL �μ��� ���ܴ� GROUP BY ������ ó���� �� �����Ƿ� WHERE���� ó���Ѵ�.
SELECT
       DEPARTMENT_ID
     , COUNT(*) AS �μ��������
  FROM
       EMPLOYEES
 WHERE
       DEPARTMENT_ID IS NOT NULL
 GROUP BY
       DEPARTMENT_ID;


-- 6. �μ��� �ο� ���� 5�� ������ �μ��� ��ȸ�Ͻÿ�.
--    �ؼ�) �μ��� �ο� ���� GROUP BY ���Ŀ� Ȯ���� �� �����Ƿ� HAVING������ ������ ó���Ѵ�.
SELECT
       DEPARTMENT_ID
     , COUNT(*) AS �μ��������
  FROM
       EMPLOYEES
 GROUP BY
       DEPARTMENT_ID
HAVING
       COUNT(*) <= 5;