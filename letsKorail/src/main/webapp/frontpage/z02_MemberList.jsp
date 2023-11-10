<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="frontweb.database.MembershipDao"
    import="frontweb.vo.KoMember"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MembershipDao dao = new MembershipDao();
	
	// form으로부터 입력된 데이터 수집..
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	
	// birthdate를 날짜로 변환
    String birthdateString = request.getParameter("birthdate");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date birthdate = dateFormat.parse(birthdateString);
    
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String emailReceiv = request.getParameter("emailReceiv");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	// membershipNumber를 long으로 파싱
	long membershipNumber = Long.parseLong(request.getParameter("membershipNumber")); 
	
	// 수집한 데이터로 KoMember 객체 생성
    KoMember member = new KoMember(name, password,birthdate,gender,
    		phone,emailReceiv,email,address,membershipNumber);

    // 데이터베이스에 회원 추가
    dao.addMember(member);
	%>
</body>
</html>