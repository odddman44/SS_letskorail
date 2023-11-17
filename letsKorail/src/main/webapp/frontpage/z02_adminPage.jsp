<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="java.util.List"
import="frontweb.vo.KoMember"
import="frontweb.database.MembershipDao"
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
</head>
<body>
<%
HttpSession session2 = request.getSession(false);
KoMember loggedInUser = (session2 != null) ? (KoMember)session2.getAttribute("loggedInUser") : null;

// 관리자 로그인 확인
if (loggedInUser != null && loggedInUser.getMembershipNumber() == 1000000001L && "admin".equals(loggedInUser.getPassword())) {
    MembershipDao dao = new MembershipDao();
    String searchName = request.getParameter("name");
    if (searchName == null) searchName = "";
    KoMember name = new KoMember();
    name.setName(searchName);
    List<KoMember> members = dao.getMemberSch(name);
%>
    <h2 align="center">이름으로 회원정보 검색</h2>
    <form method="get">
        <table align="center" width="50%" border>
            <col width="30%">
            <tr><th>이름</th>
            <td><input type="text" name="name" value="<%=searchName %>"/></td></tr>
            <tr><th colspan="2"><input type="submit" value="검색"/></th></tr>
        </table>
    </form>
    <h3 align="center">회원 상세정보</h3>
    <table align="center" width="80%" border>
                <tr>
                	<th>멤버십번호</th>
                	<th>이름</th><th>비밀번호</th><th>생년월일</th><th>성별</th>
                	<th>휴대폰번호</th><th>이메일수신여부</th><th>이메일</th><th>주소</th>
                </tr>
            <% for(KoMember member : members) { %>
                <tr>
                	<td><%=member.getMembershipNumber() %></td>
                	<td><%=member.getName() %></td>
                	<td><%=member.getPassword() %></td>
                	<td><%=member.getBirthdate() %></td>
                	<td><%=member.getGender() %></td>
                	<td><%=member.getPhone() %></td>
                	<td><%=member.getEmailReceiv() %></td>
                	<td><%=member.getEmail() %></td>
                	<td><%=member.getAddress() %></td>
                </tr>
                
            <%  } %>
    </table>
<% 
} else {
    out.println("<script>alert('관리자만 접근 가능합니다.'); location.href='Login.html';</script>");
}
%>
</body>
</html>