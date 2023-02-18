/*
    DQL
    1. Data Query Language
    2. ������ ����(��ȸ) ���
    3. ���̺��� �����͸� ��ȸ�ϴ� ����̴�.
    4. ���̺� ������ ������ ������ �ʴ´�.
        (Ʈ������� ����� �ƴϰ�, COMMIT�� �ʿ����� �ʴ�.)
    5. ����([]�� ���� ����)
        "SELECT ��ȸ��Į��, ��ȸ��Į��, ��ȸ��Į��", ....    �� SELECT ��
        "FROM ���̺��̸�"     �� FROM ��
            [WHERE ���ǽ�]
            [GROUP BY �׷�ȭ��Į�� [HAVING �׷����ǽ�]]
            [ORDER BY ������Į�� ���Ĺ��]
    6. ����
     ��SELECT ��ȸ��Į��, ��ȸ��Į��, ��ȸ��Į��, ...
     ��FROM ���̺��̸�
     ��[WHERE ���ǽ�]
     ��[GROUP BY �׷�ȭ��Į�� [(4)HAVING �׷����ǽ�]]
     ��[ORDER BY ������Į�� ���Ĺ��]
        
*/

/*
    Ʈ�����
    1. Transaction
    2. ���� ���� ���� �۾����� ������ �ϳ��� �۾��� �ǹ��Ѵ�.
    3. ��� ���� �۾��� �����ϸ� COMMIT(����)�ϰ�, �ϳ��� �����ϸ� ��� ���� �۾��� ��Ҹ� �����Ѵ�. 
        (ALL or Nothing)
    4. ���� ���� ���� 3���� ����
*/

-- ��ȸ �ǽ�
-- 1. ��� ���̺��� ����� ��ȸ�ϱ�
-- 1) �⺻ ���

SELECT ENAME
  FROM EMP;

-- 2) ���� ����ϱ�(���̺��� ������ �ִ� ����) 
SELECT ENAME
  FROM SCOTT.EMP;     -- SCOTT ������ ����ִ� EMP ���̺�


-- 3) ���̺� ����ϱ�(Į���� ������ �ִ� ���̺�) 
SELECT EMP.ENAME  -- EMP ���̺��� ENAME Į��
  FROM EMP;


-- 4) ���̺� ���� �����ϱ�
SELECT E.ENAME
  FROM EMP E;         -- ���� �ȿ� EMP ���̺��� ������ E�� �ο��Ѵ�.(E�� �ٲ�� �� �ƴ�)  AS(ALIAS)�� ����� �� ����.

-- 5) Į�� ���� �����ϱ�
SELECT E.ENAME AS �����      -- ENAME �� ��������� Į���� ������ �ٲ� AS(ALIAS)�� ����� �� �ִ�.
  FROM EMP E;



-- 2. ��� ���̺��� ��� Į�� ��ȸ�ϱ�
-- 1) * Ȱ���ϱ�(*�� ��� Į���� �ǹ��Ѵ�.)
SELECT *
  FROM EMP;
  
-- 2) ��� Į�� ���� �ۼ��ϱ�
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP;
  
-- 3. ������ �����ʹ� �� ���� ��ȸ�ϱ�
SELECT DISTINCT JOB
  FROM EMP;



-- 4. JOB�� MANAGER�� ��� ��� ��ȸ�ϱ�
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE JOB = 'MANAGER';         -- DB���� "=" �� ���ٶ�� �� 
 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE JOB IN('MANAGER');       

-- 5.SAL�� 1500 �ʰ��� ��� ��� ��ȸ�ϱ�
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE SAL > 1500;  
 
-- 6. SAL�� 2000 ~ 2999 ������ ��� ��� ��ȸ�ϱ�
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE SAL BETWEEN 2000 AND 2999;  

-- 7. COMM�� �޴� ��� ��� ��ȸ�ϱ�
-- NULL üũ�ϴ� �ڵ�
--  1) NULL �̴�      : IS NULL
--  2) NULL �ƴϴ�    : IS NOT NULL
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
  FROM EMP
 WHERE COMM IS NOT NULL 
   AND COMM != 0;


-- 8. ENAME�� A�� �����ϴ� ��� ��� ��ȸ�ϱ�  
--    1) WILD CARD
--      (1) %   : ���� �� ���� ���� ��� ����  �ַ� ���
--      (2) _   : 1���ڷ� ���� �� ��� ����
--    2) ������
--      (1) LIKE        : WILD CARD�� �����Ѵ�.
--      (2) NOT LIKE    : WILD CARD�� �������� �ʴ´�.
--          A%      : A�� �����ϴ� ��� ����
--          %A      : A�� ������ ��� ����
--          %A%     :  A�� ��𿡵� ���� ��� ����
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
  FROM EMP
 WHERE ENAME LIKE 'A%';