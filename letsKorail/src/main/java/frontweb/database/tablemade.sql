-- 1. 테이블 생성
CREATE TABLE koMemberTest(
	kmno NUMBER,
	name varchar2(50),
	mbsnumber NUMBER,
	pwd varchar2(50),
	birthdate DATE,
	gender varchar2(10),
	phone varchar(13),
  	email VARCHAR2(50)
);
SELECT * FROM koMemberTest;
-- 2. 데이터 입력
CREATE SEQUENCE mem_numb;
INSERT INTO komembertest values(mem_numb.nextval,
	   '오길동', 2123254998,7777,
	   to_date('1996-03-01','YYYY-MM-DD'),
	   'Male','010-1234-5678','abc123@abc.com');
INSERT INTO komembertest values(mem_numb.nextval,
	   '홍길순', 2177854623,1234,
	   to_date('2004-06-08','YYYY-MM-DD'),
	   'Female','010-9876-5431','zxc456@abc.com');
-- 3. 조회 sql 작성
-- 4. VO 객체 작성
-- 5. 기능메서드 선언