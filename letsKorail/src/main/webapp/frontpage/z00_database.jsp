<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"
import="java.sql.*"
import="frontweb.vo.KoMember"
import="frontweb.database.MembershipDao"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
    <h2>회원가입 처리 중...</h2>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String password = request.getParameter("password");
String birthdate = request.getParameter("birthdate");
String gender = request.getParameter("gender");
String phone = request.getParameter("phone");
String emailReceiv = request.getParameter("emailReceiv");
String email = request.getParameter("email");
String address = request.getParameter("fullAddress");
// long membershipNumber = Long.parseLong(request.getParameter("membershipNumber")); 프런트에서 생성한 멤버십번호 제거


KoMember member = new KoMember();
// member 객체에 데이터 설정
member.setName(name);
member.setPassword(password);
member.setBirthdate(new SimpleDateFormat("yyyy-MM-dd").parse(birthdate));
member.setGender(gender);
member.setPhone(phone);
member.setEmailReceiv(emailReceiv);
member.setEmail(email);
member.setAddress(address);


MembershipDao dao = new MembershipDao();

// 멤버십 번호관련
long membershipNumber;
boolean isUnique;

do{
	membershipNumber = (long)(Math.random()*(9999999999L - 1000000001L)) + 1000000001L;
	isUnique = dao.isMembershipNumberUnique(membershipNumber);
}while(!isUnique);

member.setMembershipNumber(membershipNumber);

//데이터베이스에 저장
try {
    dao.addMember(member);
    out.println("<h2>회원가입 성공</h2>");
} catch (Exception e) {
    out.println("<h2>회원가입 실패</h2>");
    e.printStackTrace();
}
// 데이터 전송 파트
response.sendRedirect("z01_joinComplete.jsp?membershipNumber=" + membershipNumber);
%>

</body>
</html>