

/*
    다대다(M:N) 관계
    1. 현실에서 빈번히 나타나지만 주의해야 하는 관계이다.
    2. 두 테이블을 다대다 관계로 직접 연결하는 것은 불가능하다.
    3. 두 테이블을 관계 맺어 줄 별도의 테이블이 추가로 필요하다.
    4. 다대다(M:N) 관계 1개는 일대다(1:M) 관계 2개로 만들 수 있다.
*/

-- 테이블 삭제(주의! 생성의 역순으로 삭제할 것!)
DROP TABLE ENROLL_TBL;
DROP TABLE SUBJECT_TBL;
DROP TABLE STUDENT_TBL;

/*
    참고. 테이블 삭제 순서를 무시하고 삭제할 수 있는 옵션이 있다.(아래는 생성 순서대로 삭제하기 예시)
    DROP TABLE STUDENT_TBL CASCADE CONSTRAINTS;
    DROP TABLE SUBJECT_TBL CASCADE CONSTRAINTS;
    DROP TABLE ENROLL_TBL CASCADE CONSTRAINTS;
    추천하는 것은 아니므로 알고 계시는 걸로 만족하기!
*/

-- 학생 테이블 생성
CREATE TABLE STUDENT_TBL (
    STU_NO    VARCHAR2(5 BYTE)  NOT NULL,
    STU_NAME  VARCHAR2(15 BYTE) NULL,
    STU_AGE   NUMBER(3)         NULL,
    CONSTRAINT PK_STUDENT PRIMARY KEY(STU_NO)
);

-- 과목 테이블 생성
CREATE TABLE SUBJECT_TBL (
    SJT_CODE  VARCHAR2(1 BYTE)  NOT NULL,
    SJT_NAME  VARCHAR2(10 BYTE) NULL,
    PROFESSOR VARCHAR2(15 BYTE) NULL,
    CONSTRAINT PK_SUBJECT PRIMARY KEY(SJT_CODE)
);

-- 수강신청 테이블 생성
CREATE TABLE ENROLL_TBL (
    ENR_NO   NUMBER           NOT NULL,
    STU_NO   VARCHAR2(5 BYTE) NOT NULL,
    SJT_CODE VARCHAR2(1 BYTE) NOT NULL,
    CONSTRAINT PK_ENROLL PRIMARY KEY(ENR_NO),
    CONSTRAINT FK_ENROLL_STUDENT FOREIGN KEY(STU_NO) REFERENCES STUDENT_TBL(STU_NO) ON DELETE CASCADE, 
    CONSTRAINT FK_ENROLL_SUBJECT FOREIGN KEY(SJT_CODE) REFERENCES SUBJECT_TBL(SJT_CODE) ON DELETE CASCADE
);










