/*
    ��������(Sub Query)
    1. ���������� �����ϴ� ���������� �ǹ��Ѵ�.
    2. �Ϲ������� ���������� ��ȣ()�� ��� ���������� �����Ѵ�.
    3. ���������� �׻� ������������ ���� ����ȴ�.
*/
/*
    ���������� ���ԵǴ� ��ġ
    1. SELECT��   : ��Į�� ��������
    2. FROM��     : �ζ��� ��
    3. WHERE��    : ��������
*/

/*
    ���������� ���� ����� ���� ����
    1. ���� ��(SINGLEROW) ��������
        1) ��� ���� 1���̴�.
        2) ���� �� ���������� ��ǥ���� ���
            (1) WHERE������ ����� �����(=) Į���� PK �Ǵ� UNIQUE Į���� ���
            (2) �����Լ�ó�� ����� 1������ ��ȯ�ϴ� ���
        3) ���� �� ������������ ����ϴ� ������(���� �� ������)
            (1) ���� �� �����ڸ� ���(=, !=, >, >=, <, <=)
    2. ���� �� ��������
        1) ��� ���� 1�� �̻��̴�.
        2) FROM��, WHERE������ ���� ���ȴ�.
        3) ���� �� ������������ ����ϴ� ������
            (1)���� �� �����ڸ� ���(IN(���� �����), ANY, ALL ��)
*/

-- WHERE���� ��������   (��������

-- 1. �����ȣ�� 1001�� ����� ������ ����(POSITION)�� ���� ����� ��ȸ�Ͻÿ�. 
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY       -- �������
  FROM EMPLOYEE_TBL-- ������̺�
 WHERE POSITION = (SELECT POSITION
                     FROM EMPLOYEE_TBL
                    WHERE EMP_NO = 1001);       -- ���� = (�����ȣ�� 1001�� ����� ����); ��������  �׻� �������� ���� ���� �� ���������� ���� �ȴ�.
                                                -- ���� ���̴� (WHERE������ PK�� ����񱳸� �Ͽ� ��� ���� 1���� ����, ���� �� �������� '=' �����)

-- 2. �μ���ȣ�� 2�� �μ��� ������ ������ �ִ� �μ��� ��ȸ�Ͻÿ�.
SELECT DEPT_NO, DEPT_NAME, LOCATION             -- �μ�����
  FROM DEPARTMENT_TBL                           -- �μ�
 WHERE LOCATION = (SELECT LOCATION
                     FROM DEPARTMENT_TBL
                    WHERE DEPT_NO = 2);         -- ���� = (�μ���ȣ�� 2�� �μ��� ����)
  
-- 3. ���� ���� �޿��� �޴� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY  -- �������
  FROM EMPLOYEE_TBL                                               -- ���
 WHERE SALARY = (SELECT MAX(SALARY)
                   FROM EMPLOYEE_TBL);                            -- �޿� = (���� ���� �޿�)

-- 4. ��� �޿� �̻��� �޴� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT AVG(SALARY)
                   FROM EMPLOYEE_TBL);


-- 5. ��� �ټ� ���� �� �̻��� �ٹ��� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) > (SELECT AVG(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
                                               FROM EMPLOYEE_TBL);
                                               
-- 6. �μ���ȣ�� 2�� �μ��� �ٹ��ϴ� ������� ���ް� ��ġ�ϴ� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY           
  FROM EMPLOYEE_TBL                                                        
 WHERE POSITION IN (SELECT POSITION
                      FROM EMPLOYEE_TBL
                     WHERE DEPART = 2);   -- ���������� WHERE������ ����� Į���� PK�� UNIQUE Į���� �ƴϹǷ� ���� �� ���������̴�.                 
                                          -- ���� ���� �� �������� ��ȣ(=) ��� ���� �� ������(IN)�� ����ؾ� �Ѵ�.
                                         
-- 7. �μ����� '������'�� �μ��� �ٹ��ϴ� ����� ��ȸ�Ͻÿ�.
-- ��������
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY  -- ���� �� �� Ʋ�� ���
  FROM EMPLOYEE_TBL
 WHERE DEPART = (SELECT DEPT_NO
                   FROM DEPARTMENT_TBL
                  WHERE DEPT_NO = 1);  -- ������������ WHERE������ ����� DEPT_NO Į���� PK/UNIQUE�� �ƴϹǷ� ���� �� ���������̴�.

SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY  
  FROM EMPLOYEE_TBL
 WHERE DEPART IN (SELECT DEPT_NO                            -- ���� ���̹Ƿ� ���� �� ������(=) ��� ���� �� ������(IN)�� ����ؾ��Ѵ�.
                   FROM DEPARTMENT_TBL
                  WHERE DEPT_NAME = '������'); 
-- ����
SELECT E.EMP_NO, E.NAME, E.DEPART, E.POSITION, E.GENDER, E.HIRE_DATE, E.SALARY
  FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART
 WHERE DEPT_NAME = '������';
                            
        
-- 8. ������ '����'�� ������� �ٹ��ϴ� �μ� ������ ��ȸ�Ͻÿ�.

-- ��������
SELECT DEPT_NO, DEPT_NAME, LOCATION
  FROM DEPARTMENT_TBL
 WHERE DEPT_NO IN (SELECT DEPART
                    FROM EMPLOYEE_TBL
                   WHERE POSITION = '����');

-- ����
SELECT D.DEPT_NO, D.DEPT_NAME, D.LOCATION
  FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART
 WHERE POSITION = '����';


-- 9. '������'���� ���� ���� �޿����� �� ���� �޿��� �޴� ����� ��ȸ�Ͻÿ�.
-- ��������
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY  
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT MAX(SALARY)
                   FROM EMPLOYEE_TBL
                  WHERE DEPART IN (SELECT DEPT_NO
                                    FROM DEPARTMENT_TBL
                                   WHERE DEPT_NAME = '������'));


-- ����. ���������� �������� Ǯ��
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY  
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT MAX(E.SALARY)
                   FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
                     ON D.DEPT_NO = E.DEPART
                  WHERE D.DEPT_NAME = '������');


/*
    �ζ��� ��(InLine View) View - ���̺��̶� �θ� �� �ִ�. 
    1. �������� ���Ե� ��(���� ���̺�)�̴�.
    2. FROM���� ���ԵǴ� ���������� �ǹ��Ѵ�.
    3. ���� ��/���� �� ������ �ʿ� ����.
    4. �ζ��� �信 ���Ե� Į���� ������������ ����� �� �ִ�.
    5. �ζ��� �並 �̿��ؼ� SELECT���� ���� ������ ������ �� �ִ�.
*/

/*
    ���� Į��
    1. PSEUDO COLUMN (P�� ����)
    2. ���������� ����Ǿ� ���� ���� Į���� �ǹ��Ѵ�.
    3. ����� �� ������ �Ϻ� ��뿡 ������ �ִ�.
    4. ����
        1) ROWID    : ��(ROW)�� ID = � ���� ��� ����Ǿ� �ִ��� �˰� �ִ� Į��(������ ���� ��ġ)
        2) ROWNUM   : ��(ROW) ��ȣ = � ���� ����
*/
-- ROWID
SELECT ROWID, EMP_NO, NAME
  FROM EMPLOYEE_TBL;

-- ����Ŭ�� ���� ���� �˻��� ROWID�� �̿��� �˻��̴�.  - ���ʽ�
-- �ǹ����� ����� �Ұ����ϱ� ������ ��� �ε���(INDEX)�� Ȱ���Ѵ�.
SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWID = 'AAAE/qAABAAALC5AAA';
 
 /*
    ROWNUM�� ���� ����
    1. ROWNUM�� 1�� �����ϴ� ������ �������� ����� �� �ִ�.
    2. ROWNUM�� 1�� �������� �ʴ� ������ �������� ����� �� ����.
    3. ��� ROWNUM�� ����Ϸ��� ROWNUM�� ������ �����ϰ� �� ������ ����ϸ� �ȴ�.
*/


SELECT E.EMP_NO, E.NAME, E.DEPART
  FROM (SELECT EMP_NO, NAME, DEPART
          FROM EMPLOYEE_TBL
         ORDER BY EMP_NO) E;    -- �������� ����� ���̺�� �νĵȴ� = InLine Vuew(���� ���̺�)
                                  -- ���̺�� ���� ������ �� �� ���� ���������� ������ E�� �� FROM�� ���������� "����" �ֱ�
                                  -- ���������� ������ ���� �ǹǷ� ORDER BY(����)�� ���� ���ĵ� Į������ ����.
                                  
SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWNUM = 1;  -- ROWNUM�� 1�� ������ ������ ���ǹǷ� ����
 
SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWNUM <= 2;  -- ROWNUM�� 1�� ������ ������ ���ǹǷ� ����

SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWNUM = 2;  -- ROWNUM�� 1�� ������ ������ �ƴϹǷ� �Ұ���


SELECT ROWNUM AS RN, EMP_NO, NAME
  FROM EMPLOYEE_TBL  -- ���� ������ ���� �ʱ� ������ ������ �Ұ����ϴ�. (������ ����� �� ����.)
 WHERE RN = 2;       -- ���� ������ WHERE������ ���� ó���ϸ� �ذ�ȴ�.
                     -- ������ �����ϴ� �ζ��� �並 ����ϸ� ���� ���� ������ �����ǹǷ� �ذ�ȴ�.

SELECT E.EMP_NO, E.NAME
  FROM (SELECT ROWNUM AS RN, EMP_NO, NAME
          FROM EMPLOYEE_TBL) E
 WHERE E.RN = 2;

-- FROM���� ��������  (�ζ��� ��

-- 1. ������ 2��°�� ���� ����� ��ȸ�Ͻÿ�. ����-��ȣ-2�� ��������
--  1) ���������� �����Ѵ�.
--  2) ���� ����� �� ��ȣ(ROWNUM)�� ���δ�.
--  3) ���ϴ� �� ��ȣ�� ��ȸ�Ѵ�.

--  1) ROWNUM Į�� ����ϱ�
SELECT E.EMP_NO, E.NAME, E.DEPART, E.POSITION, E.GENDER, E.HIRE_DATE, E.SALARY
  FROM (SELECT ROWNUM AS RN, A.EMP_NO, A.NAME, A.DEPART, A.POSITION, A.GENDER, A.HIRE_DATE, A.SALARY
          FROM (SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
                  FROM EMPLOYEE_TBL
                 ORDER BY SALARY DESC) A) E     -- ������ ���̺��� A
 WHERE E.RN = 3;                                -- ���� ����� ���ȣ�� ���� ���̺��� E
    

--  2) ROW_NUMBER() �Լ� ����ϱ� -- �����ϱ�
SELECT E.EMP_NO, E.NAME, E.DEPART, E.POSITION, E.GENDER, E.HIRE_DATE, E.SALARY
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS RN, EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
          FROM EMPLOYEE_TBL) E    
 WHERE E.RN = 2;   


-- 2. 3 ~ 4��°�� �Ի��� ����� ��ȸ�Ͻÿ�.
SELECT E.EMP_NO, E.NAME, E.DEPART, E.POSITION, E.GENDER, E.HIRE_DATE, E.SALARY
  FROM (SELECT ROWNUM AS RN, A.EMP_NO, A.NAME, A.DEPART, A.POSITION, A.GENDER, A.HIRE_DATE, A.SALARY
          FROM (SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
                  FROM EMPLOYEE_TBL
                 ORDER BY HIRE_DATE ASC) A )E
 WHERE E.RN = 3 OR E.RN = 4;
 --    E.RN IN (3,4); 
 --    E.RN BETWEEN 3 AND 4;
SELECT E.EMP_NO, E.NAME, E.DEPART, E.POSITION, E.GENDER, E.HIRE_DATE, E.SALARY
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY HIRE_DATE ASC) AS RN, EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
          FROM EMPLOYEE_TBL) E
 WHERE E.RN BETWEEN 3 AND 4;


-- SELECT���� ��������  (��Į�� ��������
/*
    ��Į�� ��������
    1. SELECT������ �ϳ��� ���� ��ȯ�ϴ� ���������̴�.
    2. ��ġ���� �ʴ� ������ NULL���� ��ȯ�Ѵ�.
    3. ������ ����� ���� ����� �ܺ������̴�.
*/

-- �μ���ȣ�� 1�� �μ��� �ٹ��ϴ� �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
SELECT
        E.EMP_NO
      , E.NAME
      , E.DEPART
      , (SELECT D.DEPT_NAME
           FROM DEPARTMENT_TBL D
          WHERE D.DEPT_NO = E.DEPART
            AND DEPT_NO = 1)
  FROM
        EMPLOYEE_TBL E;
        
-- ����. �������� Ǯ���
SELECT
        E.EMP_NO
      , E.NAME
      , E.DEPART
      , D.DEPT_NAME
  FROM DEPARTMENT_TBL D  RIGHT OUTER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART AND D.DEPT_NO = 1;