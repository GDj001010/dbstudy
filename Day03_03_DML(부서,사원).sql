/*
    DML
    1. Data Manipulation Language
    2. 데이터 조작어
    3. 데이터(행, Row)를 삽입, 수정, 삭제할 때 사용하는 언어이다.
    4. DML 사용 후에는 COMMIT 또는 ROLLBACK 처리를 해야 한다.
    5. 종류
        1) 삽입 : INSERT INTO VALUES
        2) 수정 : UPDATE SET SHERE
        3) 삭제 : DELETE FROM WHERE
*/

-- 참고. 자격증에서는 DML을 INSERT,UPDATE,DELETE + SELECT로 보는 경우도 있다.

-- 테이블 삭제
DROP TABLE EMPLOYEE_TBL;
DROP TABLE DEPARTMENT_TBL;

-- DEPARTMENT_TBL 테이블 생성
CREATE TABLE DEPARTMENT_TBL (
    DEPT_NO   NUMBER            NOT NULL,
    DEPT_NAME VARCHAR2(15 BYTE) NOT NULL,
    LOCATION  VARCHAR2(15 BYTE) NOT NULL
);

-- EMPLOYEE_TBL 테이블 생성
CREATE TABLE EMPLOYEE_TBL (
    EMP_NO    NUMBER            NOT NULL,
    NAME      VARCHAR2(20 BYTE) NOT NULL,
    DEPART    NUMBER            NULL,
    POSITION  VARCHAR2(20 BYTE) NULL,
    GENDER    CHAR(2 BYTE)      NULL,
    HIRE_DATE DATE              NULL, 
    SALARY    NUMBER            NULL
);

-- 기본키
ALTER TABLE DEPARTMENT_TBL
    ADD CONSTRAINT PK_DEPT PRIMARY KEY(DEPT_NO);
ALTER TABLE EMPLOYEE_TBL
    ADD CONSTRAINT PK_EMP PRIMARY KEY(EMP_NO);

-- 외래키
ALTER TABLE EMPLOYEE_TBL
    ADD CONSTRAINT FK_EMP_DEPT FOREIGN KEY(DEPART) 
        REFERENCES DEPARTMENT_TBL(DEPT_NO)
            ON DELETE SET NULL;

-- 시퀀스(번호 생성기) 삭제하기
DROP SEQUENCE SEQ_DEPT;

    
-- 시퀀스(번호 생성기) 만들기
CREATE SEQUENCE SEQ_DEPT
--  옵션 NOCACHE 외우기   
    INCREMENT BY 1 -- 1씩 증가하는 번호는 만든다.      (생략 가능)
    START WITH 1   -- 1부터 번호를 만든다.             (생략 가능)
    NOMAXVALUE     -- 번호의 상한선이 없다.            (생략 가능)  MAXVALUE 100 : 번호를 100까지만 생성한다. 100이후 출력시 아무것도 안 나옴.
    NOMINVALUE     -- 번호의 하한선이 없다.            (생략 가능)  MINVALUE 100 : 번호의 최소값이 100이다.
    NOCYCLE        -- 번호 순환이 없다.                (생략 가능)  CYCLE        : 번호가 MAXVALUE에 도달하면 다음 번호는 MINVALUE이다.
    NOCACHE        -- 메모리 캐시를 사용하지 않는다.                CACHE        : 메모리 캐시를 사용한다. (사용하지 않는 것이 좋다.)
    ORDER          -- 번호 건너뛰기가 없다.                         NOORDER      : 번호 건너뛰기가 가능하다.
;


-- 시퀀스에서 번호 뽑는 함수 : NEXTVAL 넥스트밸류  ( SEQ_DEPT.NEXTVAL )
-- SELECT SEQ_DEPT.NEXTVAL FROM DUAL;  -- 오라클에서는 테이블에 없는 데이터를 조회하려면 DUAL 테이블을 사용한다.

-- 데이터 입력하기(Parent Key를 먼저 입력해야 한다.)
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(SEQ_DEPT.NEXTVAL, '영업부', '대구');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(SEQ_DEPT.NEXTVAL, '인사부', '서울');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(SEQ_DEPT.NEXTVAL, '총무부', '대구');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(SEQ_DEPT.NEXTVAL, '기획부', '서울');
COMMIT;


-- INSERT INTO DEPARTMENT_TBL VALUES(1, '영업부', '대구'); 순서대로 값들이 다 들어감
-- INSERT INTO DEPARTMENT_TBL(DEPT_NAME, LOCATION)VALUES('총무부', '대구'); DEPT_NO 에 값을 넣어주기 싫다면 값을 넣어줄 칼럼만 표시
    
    

-- 시퀀스 삭제하기
DROP SEQUENCE SEQ_EMPL;

-- 시퀀스 만들기
CREATE SEQUENCE SEQ_EMPL
    START WITH 1001
    NOCACHE
    ORDER
;


-- 데이터 입력하기
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY)VALUES(SEQ_EMPL.NEXTVAL, '구창민', 1, '과장', 'M', '95/05/01', 5000000);
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY)VALUES(SEQ_EMPL.NEXTVAL, '김민서', 1, '사원', 'M', '17/09/01', 2500000);
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY)VALUES(SEQ_EMPL.NEXTVAL, '이은영', 2, '부장', 'F', '90/09/01', 5500000);
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY)VALUES(SEQ_EMPL.NEXTVAL, '한성일', 2, '과장', 'M', '93/04/01', 5000000);
COMMIT;


    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    