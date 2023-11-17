<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="javax.servlet.http.HttpSession"
import="frontweb.database.MembershipDao"
import="frontweb.vo.KoMember"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 프로세스</title>
</head>
<body>
<%
long membershipNumber = Long.parseLong(request.getParameter("membershipNumber"));
String password = request.getParameter("password");

MembershipDao dao = new MembershipDao();
KoMember komem = dao.login(membershipNumber, password);

if(komem != null){
	HttpSession session2 = request.getSession();
	session.setAttribute("loggedInUser", komem);
	
	out.println("<script type='text/javascript'>");
	out.println("alert('"+ komem.getName() +" 님, 환영합니다!');");
	out.println("window.top.location='index.jsp';");
	out.println("</script>");
}else {
    out.println("<script type='text/javascript'>");
    out.println("alert('없는 회원정보입니다. 다시한번 ID와 비밀번호를 확인해주세요');");
    out.println("location='Login.html';");
    out.println("</script>");
}
%>

</body>
</html>