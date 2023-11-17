<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="javax.servlet.http.HttpSession"
%>
<%
HttpSession session2 = request.getSession(false);
if (session2 != null) {
    session2.invalidate(); // 세션 종료
}
response.sendRedirect("index.jsp"); // 로그인 페이지로 리디렉션
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>