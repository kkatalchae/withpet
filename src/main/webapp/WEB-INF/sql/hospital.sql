-- 송하은
select * from tab;

select * from hospital;

/* 병원 */
CREATE TABLE hospital (
	hos_no NUMBER NOT NULL, /* 번호 */
	hos_writer VARCHAR2(20) NOT NULL, /* 작성자 */
	hos_name VARCHAR2(50) NOT NULL, /* 동물병원 이름 */
	hos_region VARCHAR2(12) NOT NULL, /* 지역 */
	hos_addr VARCHAR2(100) NOT NULL, /* 주소 */
	hos_tel VARCHAR2(30), /* 전화번호 */
	hos_file VARCHAR2(30), /* 병원 이미지 */
	hos_lat VARCHAR2(100) NOT NULL, /* 위도 */
	hos_long VARCHAR2(100) NOT NULL, /* 경도 */
	hos_time VARCHAR2(50) NOT NULL, /* 운영시간 */
	hos_24 CHAR NOT NULL, /* 24시 여부 */
	hos_holiday CHAR NOT NULL, /* 연중무휴 여부 */
	hos_parking CHAR NOT NULL, /* 주차 가능 여부 */
	hos_content VARCHAR2(500) NOT NULL, /* 설명 */
	hos_link VARCHAR2(300) NOT NULL, /* 링크 */
	hos_readcnt NUMBER NOT NULL, /* 조회수 */
	hos_likecnt NUMBER /* 추천수 */
);
-- 유니크 인덱스 생성
-- CREATE UNIQUE INDEX 인덱스명 ON 테이블명 (컬럼명);
CREATE UNIQUE INDEX PK_hospital ON hospital (hos_no ASC);

-- 제약조건 생성
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);
ALTER TABLE hospital ADD CONSTRAINT PK_hospital PRIMARY KEY (hos_no);

-- 시퀀스
create sequence hospital_seq	
start with 1
increment by 1
nocache;


-- 인덱스 삭제 : drop index 인덱스명
drop index PK_hospital;

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE hospital DROP CONSTRAINT PK_hospital
-- 출처: https://mine-it-record.tistory.com/39 [나만의 기록들]

-- 시퀀스 삭제
DROP SEQUENCE hospital_seq

-- 테이블 삭제
drop table hospital CASCADE CONSTRAINTS purge;