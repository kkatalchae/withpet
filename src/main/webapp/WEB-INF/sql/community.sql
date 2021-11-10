-- 박예은
select * from tab;

select * from community;

/* 커뮤니티 */
CREATE TABLE community (
	com_no NUMBER NOT NULL, /* 번호 */
	com_title VARCHAR2(50) NOT NULL, /* 제목 */
	com_writer VARCHAR2(20) NOT NULL, /* 작성자 */
	com_readcnt NUMBER NOT NULL, /* 조회수 */
	com_reg DATE NOT NULL, /* 작성일 */
	com_content VARCHAR2(500) NOT NULL, /* 내용 */
	com_file VARCHAR2(100), /* 첨부파일 */
	com_likecnt NUMBER /* 추천수 */
);

-- 유니크 인덱스 생성
-- CREATE UNIQUE INDEX 인덱스명 ON 테이블명 (컬럼명);
CREATE UNIQUE INDEX PK_community ON community (com_no ASC);

-- 제약조건 생성
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);
ALTER TABLE community ADD CONSTRAINT PK_community PRIMARY KEY (com_no);

-- 시퀀스
create sequence community_seq	
start with 1
increment by 1
nocache;


-- 인덱스 삭제 : drop index 인덱스명
drop index PK_community;

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE hospital DROP CONSTRAINT PK_hospital
-- 출처: https://mine-it-record.tistory.com/39 [나만의 기록들]

-- 시퀀스 삭제
DROP SEQUENCE community_seq

-- 테이블 삭제
drop table community CASCADE CONSTRAINTS purge;