-- 기타 함수

-- 1. 순위 구하기
--      1) RANK() OVER(ORDER BY 순위구할칼럼 ASC)  : 오름차순 순위 (낮은 값이 1등), ORDER BY와 같이 ASC는 생략 가능
--      2) RANK() OVER(ORDER BY 순위구할칼럼 DESC) : 내림차순 순위 (높은 값이 1등)
--      3) 동점자는 같은 등수로 처리
--      4) 순위 순으로 정렬된 상태로 조회 된다.
SELECT
        EMPLOYEE_ID
      , FIRST_NAME || ' ' || LAST_NAME AS NAME
      , SALARY
      , RANK() OVER(ORDER BY SALARY DESC) AS 연봉순위
  FROM
       EMPLOYEES;
       
-- 2. 분기 처리하기
--   1) DECODE(표현식       JAVA IF같은 느낌
--          , 값1, 결과1
--          , 값2, 결과2
--          , ...)
--      표현식=값1이면 결과1을 반환, 표현식=값2이면 결과2를 반환, ...
--      표현식과 값의 동등 비교(=)만 가능하다.
SELECT
       EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , DEPARTMENT_ID
     , DECODE(DEPARTMENT_ID
         , 10, 'Administration'
         , 20, 'Marketing'
         , 30, 'Purchasing'
         , 40, 'Humean Resources'
         , 50, 'Shipping'
         , 60, 'IT') AS DEPARTMENT_NAME
  FROM
       EMPLOYEES
 WHERE
       DEPARTMENT_ID IN(10, 20, 30, 40, 50, 60);
       
-- 2) 분기표현식             
-- CASE                     JAVA IF같은 느낌
--      WHEN 조건식1 THEN 결과값1
--      WHEN 조건식2 THEN 결과값2
--      ...
--      ELSE 결과값N
-- END
SELECT
       EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
     , CASE
            WHEN SALARY >= 15000 THEN 'A'
            WHEN SALARY >= 10000 THEN 'B'
            WHEN SALARY >= 5000 THEN 'C'
            ELSE 'D'
   END AS GREADE
  FROM
       EMPLOYEES;
   
   
-- 3. 행 번호 반환하기                  오름차순 내림차순 둘 중 하나
--    ROW_NUMBER() OVER(ORDER BY 정렬할칼럼 ASC|DESC)  RANK 함수와 똑같은 형식
--    정렬 결과에 행 번호를 추가해서 반환하는 함수이다.
--    목록 가져올 때 자주 사용
SELECT
       ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS 월급순위
     , EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
  FROM
       EMPLOYEES;
       
       
SELECT A.RN, A.EMPLOYEE_ID, A.FIRST_NAME, A.LAST_NAME, A.EMAIL, A.PHONE_NUMBER, A.HIRE_DATE, A.JOB_ID, A.SALARY, A.COMMISSION_PCT, A.MANAGER_ID, NVL(A.DEPARTMENT_ID, 0), NVL(A.DEPARTMENT_NAME, 'NONE')
		  FROM (SELECT ROW_NUMBER() OVER(ORDER BY EMPLOYEE_ID ASC) AS RN, E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.EMAIL, E.PHONE_NUMBER, E.HIRE_DATE, E.JOB_ID, E.SALARY, E.COMMISSION_PCT, E.MANAGER_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
		          FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
		            ON D.DEPARTMENT_ID = E.DEPARTMENT_ID) A
		 WHERE A.RN BETWEEN 1 AND 107;
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       