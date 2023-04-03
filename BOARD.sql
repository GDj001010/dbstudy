-- 시퀀스
DROP SEQUENCE BOARD_SEQ;
CREATE SEQUENCE BOARD_SEQ NOCACHE;

-- 테이블
DROP TABLE BOARD;
CREATE TABLE BOARD (
	BOARD_NO 		NUMBER NOT NULL,
	TITLE 			VARCHAR2(1000 BYTE) NOT NULL,
	CONTENT 		CLOB,			-- CLOB - VARCHAR2 의 최대 크기 4000 BYTE가 넘을 거 같을 때 사용 (CHAR 의 라지사이즈 느낌)
	MODIFIED_DATE 	DATE,
	CREATED_DATE 	DATE NOT NULL,
	CONSTRAINT PK_BOARD PRIMARY KEY(BOARD_NO)
);

-- 행(ROW)
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, '[공지]월요일알림', 'DBCP는 Data Connection Pool을 의미한다.', NULL, SYSDATE);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, '[협조]내일준비물', '물감, 리코더, 공책 가져오기', NULL, SYSDATE);
COMMIT; -- Java 에선 ;을 지워준다.