<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="javax.servlet.http.HttpSession"
import="frontweb.vo.KoMember"     
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
    	text-align:right;
    }
    .logout-button {
        background-color:#f0f8ff;
        color: black;
        border: none;
        cursor: pointer;
        padding: 5px 10px;
        margin-left: 10px;
        border-radius: 5px;
    }
</style>
<body>
	<%
	HttpSession session2 = request.getSession(false);
	KoMember loggedInUser = null;
	if(session2 !=null) {
		loggedInUser = (KoMember) session2.getAttribute("loggedInUser");
	}
	%>
    <h2 id="head">
    <a href = "index.jsp"><img src="image/korailHead.png"></a>
    		<% if(loggedInUser != null) { %>
			<span> <%= loggedInUser.getName() %>님이 접속중입니다.</span>
			<form action="z04_logout.jsp" method="post" style="display:inline;">
				<input type="submit" value="로그아웃" class="logout-button"/>
			</form>
		<% } %>
    </h2>
	<hr>
	<iframe src = "myPageList.html" name="leftMenu" width="20%" height="800"></iframe>
	<iframe src = "z05_myPageMain.jsp" name="RightWindow" width="75%" height="800"></iframe>

</body>
</html>