----- 1. 테이블 생성
CREATE TABLE koMember (
    member_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    birthdate DATE NOT NULL,
    gender VARCHAR2(10) NOT NULL,
    phone VARCHAR2(15) NOT NULL,
    emailReceiv VARCHAR2(20) NOT NULL,
    email VARCHAR2(50),
    address VARCHAR2(100),
    membershipNumber NUMBER
);
----- 2. 데이터 입력
CREATE SEQUENCE member_id_sequence
START WITH 1
INCREMENT BY 1;
-- 시퀀스 삭제
DROP SEQUENCE member_id_sequence;

-- 멤버 추가
INSERT INTO koMember 
(member_id, name, password, birthdate, gender, phone, emailReceiv, email, address, membershipNumber)
VALUES (member_id_sequence.NEXTVAL, '관리자', 'admin', TO_DATE('2023-01-01', 'YYYY-MM-DD'),
'male', '010-0000-0000', 'yes', 'admin@korail.com',
'(34618)대전광역시 동구 중앙로 240', 1000000001);

-- 멤버 조회(MEMBER_ID 순서)
SELECT * 
FROM komember
ORDER BY MEMBER_ID;

-- 멤버 삭제하기
DELETE
FROM KOMEMBER
WHERE MEMBERSHIPNUMBER =378571521;

----- 3. 조회 sql 작성
SELECT *
FROM KOMEMBER
WHERE name LIKE '%관리자%';
----- 4. VO 객체 작성
/*
class KomemberTest{
    private String name;
    private String password;
    private Date birthdate; 
    private String gender;
    private String phone;
    private String emailReceiv;
    private String email;
    private String address;
    private long membershipNumber;
}
 */
----- 5. 기능메서드 선언
-- 멤버십 중복여부 확인
SELECT count(*)
FROM KOMEMBER 
WHERE MEMBERSHIPNUMBER =1000000001;
-- 로그인 메서드
SELECT *
FROM KoMember
WHERE MEMBERSHIPNUMBER = 1000000001 AND PASSWORD = 'admin';