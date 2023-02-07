-- 문자열 함수


-- 1. 대소문자 변환 함수
SELECT 
        UPPER(EMAIL)    -- 대문자로 변환
      , LOWER(EMAIL)    -- 소문자로 변환
      , INITCAP(EMAIL)  -- 첫 글자는 대문자, 나머지는 소문자
  FROM
        EMPLOYEES;


-- 2. 글자 수(바이트 수) 반환 함수
SELECT
        LENGTH('HELLO')     -- 글자 수 : 5글자
      , LENGTH('안녕')      -- 글자 수 : 2글자
      , LENGTHB('HELLO')    -- 바이트 수 : 5
      , LENGTHB('안녕')     -- 바이트 수 : 6 (한글은 UTF-8처리를 했기 때문에 한 글자당 3BYTE)
  FROM DUAL;
  
  
-- 3. 문자열 연결 함수/연산자
--     1) 함수    : CONCAT(A, B) = A와 B를 연결함, 주의 : 인수가 2개만 전달 가능하다.(CONCAT(A, B, C) 같은 형태는 불가능하다.
--     2) 연산자  : || 주의! OR연산 아니다, 오라클 전용이다.
SELECT
        CONCAT(FIRST_NAME, LAST_NAME)
 FROM EMPLOYEES;

SELECT
        CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME)
      , FIRST_NAME || ' ' || LAST_NAME      -- DB에선 '||'가 자바의 '+'와 같다  DB에서 작업을 하는게 좋음
 FROM EMPLOYEES;










