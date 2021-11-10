-- 이성곤
select * from tab;

/* 상품 */
select * from product;

CREATE TABLE product (
	pro_no NUMBER NOT NULL, /* 상품 번호 */
	pro_writer VARCHAR2(20) NOT NULL, /* 작성자 */
	pro_name VARCHAR2(50) NOT NULL, /* 상품 이름 */
	pro_check NUMBER NOT NULL, /* 재고 */
	pro_content VARCHAR2(2000) NOT NULL, /* 설명 */
	pro_img VARCHAR2(100) NOT NULL, /* 상품 이미지 */
	pro_price VARCHAR2(50) NOT NULL, /* 가격 */
	pro_readcnt NUMBER NOT NULL, /* 조회수 */
	pro_likecnt NUMBER /* 추천수 */
);
-- 유니크 인덱스 생성
-- CREATE UNIQUE INDEX 인덱스명 ON 테이블명 (컬럼명);
CREATE UNIQUE INDEX PK_product ON product (pro_no ASC);

-- 제약조건 생성
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);
ALTER TABLE product ADD CONSTRAINT PK_product PRIMARY KEY (pro_no);

-- 시퀀스
create sequence product_seq	
start with 1
increment by 1
nocache;


-- 인덱스 삭제 : drop index 인덱스명
drop index PK_product;

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE product DROP CONSTRAINT PK_product
-- 출처: https://mine-it-record.tistory.com/39 [나만의 기록들]

-- 시퀀스 삭제
DROP SEQUENCE product_seq

-- 테이블 삭제
drop table product CASCADE CONSTRAINTS purge;







/* 장바구니 */
select * from basket;

CREATE TABLE basket (
	pro_no NUMBER NOT NULL, /* 상품 번호 */
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	price VARCHAR2(50) NOT NULL, /* 가격 */
	pro_check NUMBER NOT NULL /* 수량 */
);
-- 유니크 인덱스 생성
CREATE UNIQUE INDEX PK_basket ON basket (pro_no ASC);

-- 제약조건 생성
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);
ALTER TABLE basket ADD CONSTRAINT PK_basket PRIMARY KEY (pro_no);

-- 시퀀스
create sequence hospital_seq	
start with 1
increment by 1
nocache;


-- 인덱스 삭제 : drop index 인덱스명
drop index PK_basket;

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE basket DROP CONSTRAINT PK_basket
-- 출처: https://mine-it-record.tistory.com/39 [나만의 기록들]

-- 시퀀스 삭제
DROP SEQUENCE basket_seq

-- 테이블 삭제
drop table basket CASCADE CONSTRAINTS purge;





/* 주문 */
select * from orders;

CREATE TABLE orders (
	op_no VARCHAR2(50) NOT NULL, /* 주문번호 */
	ord_reg VARCHAR2(20) NOT NULL, /* 주문일시 */
	ord_info VARCHAR2(100) NOT NULL, /* 결제정보 */
	addr VARCHAR2(100) NOT NULL, /* 주소 */
	price VARCHAR2(50) NOT NULL /* 주문가격 */
);
-- 유니크 인덱스 생성
CREATE UNIQUE INDEX PK_orders ON order (op_no ASC);

-- 제약조건 생성
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);
ALTER TABLE order ADD CONSTRAINT PK_orders PRIMARY KEY (op_no);

-- 시퀀스
create sequence orders_seq	
start with 1
increment by 1
nocache;


-- 인덱스 삭제 : drop index 인덱스명
drop index PK_orders;

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE orders DROP CONSTRAINT PK_orders
-- 출처: https://mine-it-record.tistory.com/39 [나만의 기록들]

-- 시퀀스 삭제
DROP SEQUENCE orders_seq

-- 테이블 삭제
drop table orders CASCADE CONSTRAINTS purge;





/* 주문 상품 */
select * from order_product;

CREATE TABLE order_product (
	op_no VARCHAR2(50) NOT NULL, /* 주문번호 */
	pro_no NUMBER NOT NULL, /* 상품 번호 */
	pro_name VARCHAR2(20) NOT NULL, /* 상품이름 */
	pro_check NUMBER NOT NULL, /* 수량 */
	price VARCHAR2(50) NOT NULL /* 가격 */
);
-- 유니크 인덱스 생성
CREATE UNIQUE INDEX PK_order_product ON order_product (op_no ASC);

-- 제약조건 생성
-- ALTER TABLE 테이블명 ADD CONSTRAINT 기본키명(본인이 지정) PRIMARY KEY (기본키가 될 컬럼);
ALTER TABLE order_product ADD CONSTRAINT PK_order_product PRIMARY KEY (op_no);

-- 시퀀스
create sequence order_product_seq	
start with 1
increment by 1
nocache;


-- 인덱스 삭제 : drop index 인덱스명
drop index PK_order_product;

-- 제약조건 삭제 : ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE order_product DROP CONSTRAINT PK_order_product
-- 출처: https://mine-it-record.tistory.com/39 [나만의 기록들]

-- 시퀀스 삭제
DROP SEQUENCE order_product_seq

-- 테이블 삭제
drop table order_product CASCADE CONSTRAINTS purge;