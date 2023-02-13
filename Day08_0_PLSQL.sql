/*
    PL/SQL
    
    1. 오라클 전용 문법이고 프로그래밍 처리가 가능한 SQL이다.
    2. 형식
        [DECLATE
            변수 선언]
        BEGIN 시작
            수행할 PL/SQL
        END;  끝
    3. 변수에 저장된 값을 출력하기 위해서 서버 출력을 ON 시켜줘야 한다.
       최초 1번만 실행시켜 두면 된다.(디폴트가 OFF로 되어 있기 때문에)
        SET SERVEROUTPUT ON;
*/

-- 서버출력 ON
SET SERVEROUTPUT ON;

-- 서버출력 확인
BEGIN
   DBMS_OUTPUT.PUT_LINE('Hello World');
END;

/*
    테이블 복사하기
    1. CREATE TABLE과 복사할 데이터의 조회(SELECT)를 이용한다.
    2. PK와 FK 제약조건은 복사되지 않는다.
    3. 복사하는 쿼리
        1) 데이터를 복사하기
            CREATE TABLE 테이블명 AS(SELECT 칼럼 FROM 테이블명);
        2)  데이터를 제외하고 구조만 복사하기(칼럼만 복사하기)
            CREATE TABLE 테이블명 AS(SELECT 칼럼 FROM 테이블명 WHERE 1=2);  조건식에 맞는 데이터가 없기 때문에 데이터들은 들어올 수 없음
*/
-- HR 계정의 EMPLOYEES 테이블을 GDJ61 계정으로 복사해서 기초 데이터로 사용하기

DROP TABLE EMPLOYEES;

CREATE TABLE EMPLOYEES
    AS (SELECT *
          FROM HR.EMPLOYEES);

-- EMPLOYEES 테이블에 PK 생성하기
ALTER TABLE EMPLOYEES
    ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMPLOYEE_ID);

/*
    변수 선언하기
    1. 대입 연산자(:=)를 사용한다.
    2. 종류
        1) 스칼라 변수 : 타입을 직접 지정한다.
        2) 참조 변수   : 특정 칼럼의 타입을 가져다가 지정한다.
        3) 레코드 변수 : 2개 이상의 칼럼을 합쳐서 하나의 타입으로 지정한다.
        4) 행 변수     : 행 전체 데이터를 저장한다.
*/

-- 1. 스칼라 변수
-- 직접 타입을 명시
DECLARE
    NAME VARCHAR2(10 BYTE);
    AGE  NUMBER(3);
BEGIN
    NAME := '제시카';
    AGE  := 30;
    DBMS_OUTPUT.PUT_LINE('이름은' || NAME || '입니다.');
    DBMS_OUTPUT.PUT_LINE('나이는' || AGE || '살입니다.');
END;

-- 2. 참조 변수
--  특정 칼럼의 타입을 그대로 사용하는 변수
--  SELECT절의 INTO를 이용해서 테이블의 데이터를 가져와서 변수에 저장할 수 있다.
--  선언방법 : 변수명 테이블명.칼럼명%TYPE 

DECLARE
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
    LNAME EMPLOYEES.LAST_NAME%TYPE;
    SAL EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT FIRST_NAME, LAST_NAME, SALARY
      INTO FNAME, LNAME, SAL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(FNAME || ',' || LNAME || ',' || SAL);
END;























