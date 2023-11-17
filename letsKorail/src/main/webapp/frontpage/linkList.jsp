<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="javax.servlet.http.HttpSession" 
import="frontweb.vo.KoMember"   
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #083B82;
            margin: 0;
            padding: 20px;
        }
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .nav-link {
            display: block;
            text-decoration: none;
            color: #083B82;
            padding: 10px;
            border: 1px solid #083B82;
            margin-bottom: 10px;
            background-color: #083B82;
        }
        .nav-link:hover {
            background: aliceblue;
            color: #083B82;
        }
        h4 {
            margin: 0;
            color: white;
        }
        h4:hover {
            font-size: 20px;
            color : #083B82
        }
    </style>
</head>
<body>
    <%
    HttpSession session2 = request.getSession(false);
    KoMember loggedInUser = (session2 != null) ? (KoMember)session2.getAttribute("loggedInUser") : null;
    boolean isLoggedIn = loggedInUser != null;
    boolean isAdmin = loggedInUser != null && loggedInUser.getMembershipNumber() == 1000000001L;
    %>
    <ul>
        <li><a class="nav-link" href="Login.html" target="RightWindow"><h4>코레일멤버십 로그인</h4></a></li>
        <li><a class="nav-link" href="joinForm.html" target="RightWindow"><h4>회원가입</h4></a></li>
        <li>
            <% if(isLoggedIn) { %>
                <a class="nav-link" href="z05_myPageMain.jsp" target="RightWindow"><h4>마이페이지</h4></a>
            <% } else { %>
                <a class="nav-link" href="javascript:alert('로그인이 필요한 페이지입니다.');" target="RightWindow"><h4>마이페이지</h4></a>
            <% } %>
        </li>
        </li>
        <% if(isAdmin) { %>
            <li><a class="nav-link" href="z02_adminPage.jsp" target="RightWindow"><h4>관리자페이지</h4></a></li>
        <% } %>
    </ul>
</body>
</html>