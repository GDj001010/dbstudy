/*
    DDL
    1. DaTa Definition Language
    2. 데이터 정의어
    3. 데이터베이스 객체(USER, TABLE, SEQUENCE, VIEW, INDEX 등)를 생성/수정/삭제하는 언어이다.
    4. 완료된 작업을 취소할 수 없다.(COMMIT 할 필요가 없다. ROLLBACK을 할 수 없다.)
    5. 종류
        1) CREATE : 생성
        2) ALTER  : 수정
        3) DROP   : 삭제
*/


DROP TABLE CUSTOMER_TBL;
DROP TABLE BANK_TBL;


CREATE TABLE BANK_TBL (
   BANK_CODE VARCHAR2(20 BYTE),
   BANK_NAME VARCHAR2(30 BYTE),
   CONSTRAINT PK_BANK PRIMARY KEY(BANK_CODE)
);

CREATE TABLE CUSTOMER_TBL (
          NO NUMBER,
        NAME VARCHAR2(30 BYTE) NOT NULL,
       PHONE VARCHAR2(30 BYTE) UNIQUE,
         AGE NUMBER(3)         CHECK(AGE BETWEEN 0 AND 100),
   BANK_CODE VARCHAR2(20 BYTE),
   CONSTRAINT PK_CUSTOMER PRIMARY KEY(NO),
   CONSTRAINT FK_CUSTOMER_BANK FOREIGN KEY(BANK_CODE) REFERENCES BANK_TBL(BANK_CODE)
);

/*
    테이블 변경하기
    1. 칼럼 추가   : ALTER TABLE 테이블명 ADD 칼럼명 데이터타입 [제약조건]  ← 생략 가능 필요하면 넣기
    2. 칼럼 삭제   : ALTER TABLE 테이블명 DROP COLUMN 칼럼명
    3. 칼럼 수정   : ALTER TABLE 테이블명 MODIFY 칼럼명 데이터타입 [제약조건] (칼럼의 데이터타입, 제약조건 수정)
    4. 칼럼 이름   : ALTER TABLE 테이블명 RENAME COLUMN 기존칼럼명 TO 신규칼럼명
    5. 테이블 이름 : ALTER TABLE 테이블명 RENAME TO 신규테이블명
*/

-- 1. BANK_TBL 테이블에 연락처(BANK_TEL) 칼럼을 추가하시오.
ALTER TABLE BANK_TBL 
    ADD BANK_TEL VARCHAR2(20 BYTE) NOT NULL;

-- 2. CUSTOMER_TBL 테이블에서 나이(AGE) 칼럼을 삭제하시오.
ALTER TABLE CUSTOMER_TBL
    DROP COLUMN AGE;

-- 3. BANK_TBL 테이블의 은행명(BANK_NAME) 칼럼의 데이터타입을 VARCHAR2(15 BYTE)로 수정하시오.
ALTER TABLE BANK_TBL 
    MODIFY BANK_NAME VARCHAR2(15 BYTE);

-- 4. CUSTOMER_TBL 테이블에서 고객명(NAME) 칼럼의 이름을 CUST_NAME으로 변경하시오.
ALTER TABLE CUSTOMER_TBL
    RENAME COLUMN NAME TO CUST_NAME;








































