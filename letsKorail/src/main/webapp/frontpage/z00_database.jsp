<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
    <h2>회원가입 완료</h2>
    <%
        // 요청으로부터 파라미터를 받아옵니다.
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String birthdate = request.getParameter("birthdate");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String emailReceiv = request.getParameter("emailReceiv");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String membershipNumber = request.getParameter("membershipNumber");
		
        // 데이터베이스에 저장하는 로직을 여기에 추가할 수 있습니다.
        // 예를 들어, JDBC를 사용하여 데이터베이스에 연결하고, INSERT 쿼리를 실행할 수 있습니다.
		
        // 데이터 전송 파트
         response.sendRedirect("z01_joinComplete.jsp?membershipNumber=" + membershipNumber);
        
        // 출력 예시
    %>
    <p>이름: <%= name %></p>
    <p>비밀번호: <%= password %></p>
    <p>생년월일: <%= birthdate %></p>
    <p>성별: <%= gender %></p>
    <p>휴대폰번호: <%= phone %></p>
    <p>이메일 수신 여부: <%= emailReceiv %></p>
    <p>이메일 주소: <%= email %></p>
    <p>주소: <%= address %></p>
    <p>멤버십 번호: <%= membershipNumber %></p>
</body>
</html>