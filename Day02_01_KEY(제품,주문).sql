/*
    KEY 제약조건
    1. 기본키(PK) PRIMARY KEY
        1) 개체무결성
        2) PK는 NOT NULL + UNIQUE 해야 한다.
    2. 외래키(FK) FOREIGN KEY
        1) 참조무결성
        2) FK는 참조하는 값만 가질 수 있다.
*/
/*
    일대다관계(1:M) 관계
    1. PK와 FK를 가진 테이블 간의 관계이다.
        1) 부모 테이블 : 1, PK를 가진 테이블
        2) 자식 테이블 : M, FK를 가진 테이블
    2. 생성과 삭제 규칙
        1) 생성 규칙 : "반드시" 부모 테이블을 먼저 생성한다.
        2) 삭제 규칙 : "반드시" 자식 테이블을 먼저 삭제한다.
*/
/*
    외래키 제약조건 옵션
    부모가 지워졌을 때 "참조무결성" 위배가 나옴 - FK
    1. 부모가 지워졌을 때를 대비한 옵션 ONDELETE
        1) 부모가 죽으면 나도 죽는다 ( 같이 지워버림 ) 
            CASCADE
            ON DELETE CASCADE
        2) 부모가 죽으면 NULL 처리 한다 (주문내역은 살리면서 FK 칸만 NULL 처리 )
            SET NULL
            ON DELETE SET NULL
*/
/*
    외래키 제약 조건의 옵션
    1. ON DELETE CASCADE  실선
        1) 참조 중인 PARENT KEY가 삭제되면 해당 PARENT KEY를 가진 행 전체를 함께 삭제한다.
        2) 예시) 회원 탈퇴 시 작성한 모든 게시글이 함께 삭제됩니다.
                 게시글 삭제 시 해당 게시글에 달린 모든 댓글이 함께 삭제됩니다.
    2. ON DELETE SET NULL  점선
        1) 참조 중인 PARENT KEY가 삭제되면 해당 PARENT KEY를 가진 칼럼 값만 NULL로 처리한다.
        2) 예시) 어떤 상품을 제거하였으나 해당 상품의 주문 내역은 남아 있는 경우
*/
-- 테이블 삭제               삭제를 몰아서 위쪽에 배치, 생성은 아래쪽 배치
DROP TABLE ORDER_TBL;           -- 자식 테이블 먼저 삭제 후 부모 테이블 삭제
DROP TABLE PRODUCT_TBL;

-- 제품 테이블 (부모 테이블)
CREATE TABLE PRODUCT_TBL (
    PROD_NO NUMBER NOT NULL,        
    PROD_NAME VARCHAR2(10 BYTE),
    PROD_PRICE NUMBER,
    PROD_STOCK NUMBER,
    CONSTRAINT PK_PROD PRIMARY KEY(PROD_NO)  -- PK 기본키
);

-- 주문 테이블 (자식 테이블)
CREATE TABLE ORDER_TBL (
    ORDER_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(10 BYTE),
    PROD_NO NUMBER , 
    ORDER_DATE DATE,
    CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_NO),    -- PK 기본키
    CONSTRAINT FK_ORDER_PROD FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO) ON DELETE CASCADE  -- FK 외래키
);

-- CONSTRAINT : 제약조건
-- REFERENCES : 참조

/*
    제약조건 테이블
    1. SYS, SYSTEM 관리 계정으로 접속해서 확인한다.
    2. 종류
        1) ALL_CONSTRAINTS
        2) USER_CONSTRAINTS   사용자용 제약조건
        3) DBA_CONSTRAINTS
        _ 뒤에 조회할 대상   예시) USER_TABLE"S"  유저에 테이블들
        
*/

-- 테이블 구조 확인하는 쿼리문 (설명)
-- DESCRIBE USER_CONSTRAINTS;

-- 테이블에 칼럼 중 PK로 시작하는 로우(행, 값) 조회
/*
SELECT * 
  FROM ALL_CONSTRAINTS
 WHERE CONSTRAINT_NAME LIKE 'PK%';
*/