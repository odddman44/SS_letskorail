<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="javax.servlet.http.HttpSession"
import="frontweb.vo.KoMember"    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LET'S KORAIL!</title>
</head>
<style>
    #head {
        top: 0;
        width: 100%;
        color: white;
        background-color: #083B82;
        font-style: italic;
        text-align: center;
        padding: 20px;
        z-index: 1000;
    }
    h2 > span {
    font-size:10px;
    }
</style>
<body>
	<%
	//HttpSession session = request.getSession(false);
	KoMember loggedInUser = null;
	if(session !=null) {
		loggedInUser = (KoMember) session.getAttribute("loggedInUser");
	}
	%>
	<h2 id="head">
		<a href = "index.jsp"><img src="image/korailHead.png"></a>
		<% if(loggedInUser != null) { %>
			<span> <%= loggedInUser.getName() %>님이 접속중입니다.</span>
		<% } %>
	</h2> 
	<hr>
	<iframe src = "linkList.html" name="leftMenu" width="20%" height="800"></iframe>
	<iframe src = "mainPage.html" name="RightWindow" width="75%" height="800"></iframe>
</body>
</html>