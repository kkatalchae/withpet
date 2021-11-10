-- 진승범
select * from tab;


-- notice
select * from notice;

-- 테이블 삭제
drop table notice CASCADE CONSTRAINTS purge;

/* 공지사항 */
CREATE TABLE notice (
	not_no NUMBER primary key, /* 번호 */
	not_title VARCHAR2(50) NOT NULL, /* 제목 */
	not_writer VARCHAR2(20) NOT NULL, /* 작성자 */
	not_readcnt NUMBER NOT NULL, /* 조회수 */
	not_reg DATE NOT NULL, /* 작성일 */
	not_content VARCHAR2(500) NOT NULL, /* 내용 */
	not_file VARCHAR2(100) /* 첨부파일 */
);

-- 유니크 인덱스 생성 
-- CREATE UNIQUE INDEX 인덱스명 ON 테이블명 (컬럼명);
CREATE UNIQUE INDEX PK_notice ON notice (not_no ASC);

--제약조건 생성
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);
ALTER TABLE notice ADD CONSTRAINT PK_notice PRIMARY KEY (not_no);

-- 시퀀스
create sequence notice_seq	
start with 1
increment by 1
nocache;


-- 인덱스 삭제 : drop index 인덱스명
drop index PK_notice;

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE notice DROP CONSTRAINT PK_notice
-- 출처: https://mine-it-record.tistory.com/39 [나만의 기록들]

-- 시퀀스 삭제
DROP SEQUENCE notice_seq

-- 테이블 삭제
drop table notice CASCADE CONSTRAINTS purge;





-- qna
select * from qna;

/* Q&A */
CREATE TABLE qna (
	qna_no NUMBER NOT NULL, /* 번호 */
	qna_title VARCHAR2(50) NOT NULL, /* 제목 */
	qna_writer VARCHAR2(20) NOT NULL, /* 작성자 */
	qna_readcnt NUMBER NOT NULL, /* 조회수 */
	qna_reg DATE NOT NULL, /* 작성일 */
	qna_content VARCHAR2(500) NOT NULL, /* 내용 */
	qna_file VARCHAR2(100), /* 첨부파일 */
	qna_ref NUMBER, /* 댓글 그룹 */
	qna_lev NUMBER, /* 댓글 레벨 */
	qna_seq NUMBER /* 댓글 순서 */
);

-- 유니크 인덱스 생성
CREATE UNIQUE INDEX PK_qna ON qna (qna_no ASC);

-- 제약조건 생성
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);
ALTER TABLE qna ADD CONSTRAINT PK_qna PRIMARY KEY (qna_no);

-- 시퀀스
create sequence qna_seq	
start with 1
increment by 1
nocache;


-- 인덱스 삭제 : drop index 인덱스명
drop index PK_qna;

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE qna DROP CONSTRAINT PK_qna
-- 출처: https://mine-it-record.tistory.com/39 [나만의 기록들]

-- 시퀀스 삭제
DROP SEQUENCE qna_seq

-- 테이블 삭제
drop table qna CASCADE CONSTRAINTS purge;
