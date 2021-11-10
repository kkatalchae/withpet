-- 김병채
select * from tab;

-- member
select * from member;

-- 최고 관리자
insert into member values()


/* 회원 */
CREATE TABLE member (
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	nick VARCHAR2(20), /* 닉네임 */
	pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	addr VARCHAR2(100) NOT NULL, /* 주소 */
	name VARCHAR2(20) NOT NULL, /* 이름 */
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	phone NUMBER(12) NOT NULL, /* 휴대폰 */
	gender VARCHAR2(20) NOT NULL, /* 성별 */
	regdate DATE NOT NULL, /* 가입일 */
	profile VARCHAR2(100), /* 프로필 */
	role VARCHAR2(20) NOT NULL /* 회원 유형 */
);
-- 유니크 인덱스 생성
-- CREATE UNIQUE INDEX 인덱스명 ON 테이블명 (컬럼명);
CREATE UNIQUE INDEX PK_member ON member (id ASC);

-- 제약조건 생성
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);
ALTER TABLE member ADD CONSTRAINT PK_member PRIMARY KEY (id);


-- 인덱스 삭제 : drop index 인덱스명
drop index PK_member;

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE member DROP CONSTRAINT PK_member
-- 출처: https://mine-it-record.tistory.com/39 [나만의 기록들]

-- 테이블 삭제
drop table MEMBER CASCADE CONSTRAINTS purge;



-- 사업자
select * from business;

/* 사업자 */
CREATE TABLE business (
	bus_no VARCHAR2(100) NOT NULL, /* 사업자번호 */
	bus_name VARCHAR2(50) NOT NULL, /* 회사명 */
	bus_addr VARCHAR2(200) NOT NULL, /* 회사 주소 */
	bus_tel VARCHAR2(50) NOT NULL, /* 연락처 */
	bus_sort VARCHAR2(50) NOT NULL, /* 종류 */
	bus_id VARCHAR2(50) NOT NULL /* 사업자 */
);
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]

-- 테이블 삭제
drop table business CASCADE CONSTRAINTS purge;



/* 펫 */
CREATE TABLE pet (
	pet_sort VARCHAR2(20) NOT NULL, /* 종류 */
	pet_kind VARCHAR2(30), /* 품종 */
	pet_name VARCHAR2(30) NOT NULL, /* 이름 */
	pet_gender VARCHAR2(10) NOT NULL, /* 성별 */
	pet_birth VARCHAR2(30), /* 생년월일 */
	pet_photo VARCHAR2(200), /* 사진 */
	pet_info VARCHAR2(500), /* 특이사항 */
	pet_parent VARCHAR2(20) NOT NULL /* 보호자 */
);
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]

-- 테이블 삭제
drop table pet CASCADE CONSTRAINTS purge;
