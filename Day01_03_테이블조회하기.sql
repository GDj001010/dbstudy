/*
    DQL
    1. Data Query Language
    2. 데이터 질의(조회) 언어
    3. 테이블의 데이터를 조회하는 언어이다.
    4. 테이블 내용의 변경이 생기지 않는다.
        (트랜잭션의 대상이 아니고, COMMIT이 필요하지 않다.)
    5. 형식([]는 생략 가능)
        "SELECT 조회할칼럼, 조회할칼럼, 조회할칼럼", ....    ← SELECT 절
        "FROM 테이블이름"     ← FROM 절
            [WHERE 조건식]
            [GROUP BY 그룹화할칼럼 [HAVING 그룹조건식]]
            [ORDER BY 정렬할칼럼 정렬방식]
    6. 순서
     ④SELECT 조회할칼럼, 조회할칼럼, 조회할칼럼, ...
     ①FROM 테이블이름
     ②[WHERE 조건식]
     ③[GROUP BY 그룹화할칼럼 [(4)HAVING 그룹조건식]]
     ⑤[ORDER BY 정렬할칼럼 정렬방식]
        
*/

/*
    트랜잭션
    1. Transaction
    2. 여러 개의 세부 작업으로 구성된 하나의 작업을 의미한다.
    3. 모든 세부 작업이 성공하면 COMMIT(저장)하고, 하나라도 실패하면 모든 세부 작업의 취소를 진행한다. 
        (ALL or Nothing)
    4. 삽입 수정 삭제 3가지 가능
*/

-- 조회 실습
-- 1. 사원 테이블에서 사원명 조회하기
-- 1) 기본 방식

SELECT ENAME
  FROM EMP;

-- 2) 오너 명시하기(테이블을 가지고 있는 계정) 
SELECT ENAME
  FROM SCOTT.EMP;     -- SCOTT 계정에 들어있는 EMP 테이블


-- 3) 테이블 명시하기(칼럼을 가지고 있는 테이블) 
SELECT EMP.ENAME  -- EMP 테이블의 ENAME 칼럼
  FROM EMP;


-- 4) 테이블 별명 지정하기
SELECT E.ENAME
  FROM EMP E;         -- 쿼리 안에 EMP 테이블의 별명을 E로 부여한다.(E로 바뀌는 게 아님)  AS(ALIAS)를 사용할 수 없다.

-- 5) 칼럼 별명 지정하기
SELECT E.ENAME AS 사원명      -- ENAME → 사원명으로 칼럼의 별명을 바꿈 AS(ALIAS)를 사용할 수 있다.
  FROM EMP E;



-- 2. 사원 테이블의 모든 칼럼 조회하기
-- 1) * 활용하기(*는 모든 칼럼을 의미한다.)
SELECT *
  FROM EMP;
  
-- 2) 모든 칼럼 직접 작성하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP;
  
-- 3. 동일한 데이터는 한 번만 조회하기
SELECT DISTINCT JOB
  FROM EMP;



-- 4. JOB이 MANAGER인 사원 목록 조회하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE JOB = 'MANAGER';         -- DB에선 "=" ← 같다라는 뜻 
 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE JOB IN('MANAGER');       

-- 5.SAL이 1500 초과인 사원 목록 조회하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE SAL > 1500;  
 
-- 6. SAL이 2000 ~ 2999 사이인 사원 목록 조회하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE SAL BETWEEN 2000 AND 2999;  

-- 7. COMM을 받는 사원 목록 조회하기
-- NULL 체크하는 코드
--  1) NULL 이다      : IS NULL
--  2) NULL 아니다    : IS NOT NULL
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
  FROM EMP
 WHERE COMM IS NOT NULL 
   AND COMM != 0;


-- 8. ENAME이 A로 시작하는 사원 목록 조회하기  
--    1) WILD CARD
--      (1) %   : 글자 수 제한 없는 모든 문자  주로 사용
--      (2) _   : 1글자로 제한 된 모든 문자
--    2) 연산자
--      (1) LIKE        : WILD CARD를 포함한다.
--      (2) NOT LIKE    : WILD CARD를 포함하지 않는다.
--          A%      : A로 시작하는 모든 문자
--          %A      : A로 끝나는 모든 문자
--          %A%     :  A가 어디에든 들어가는 모든 문자
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
  FROM EMP
 WHERE ENAME LIKE 'A%';