<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="frontweb.vo.KoMember"    
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 메인</title>
</head>
<style>
    body {
        font-family: 'Arial', sans-serif; /*폰트 변경*/
        margin:0;
        padding:0;
    }
    h1 {
        color:#333; /*제목 색상 변경*/
        margin-top: 20px;
    }
    .myBasicInfo {
        background:#fff;
        margin:20px auto;
        padding:20px;
        width:90%; /*너비조정*/
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /*그림자효과*/
    }
    .myBasicInfo h3 {
        margin-bottom: 15px;
    }
    #square {
        font-size:20px;
        color:#4D81D5;
    }
    table {
        width:100%;
        border-collapse: collapse;
    }
    table, th, td {
        border:1px solid #ddd;
        padding:8px; 
        text-align:left;
    }
    .label{
        background:#f9f9f9;
        font-weight: bold;
        width:100px;
    }
    .label2{
        background:#f9f9f9;
        font-weight: bold;
        width:200px;
    }
    td[rowspan] {
        vertical-align: top;
    }
    td.rowspan-3 {
        width:100%;
    }
</style>
<body>
    <%
    HttpSession session2 = request.getSession(false);
    KoMember loggedInUser = (session != null) ? (KoMember) session.getAttribute("loggedInUser") : null;
    %>
    <h1>마이페이지</h1><br>
    <div class="myBasicInfo">
        <h3><span id="square">■</span> 나의 기본정보</h3>
        <table>
            <tr>
                <td class="label">회원명</td><td><%= loggedInUser != null ? loggedInUser.getName() : "" %></td>
                <td class="label">멤버십번호</td><td><%= loggedInUser != null ? loggedInUser.getMembershipNumber() : "" %></td>
            </tr>
            <tr>
                <td class="label">비밀번호</td><td>********</td>
                <td class="label">이메일</td><td><%= loggedInUser != null ? loggedInUser.getEmail() : "" %></td>
            </tr>
            <tr>
                <td class="label">전화번호</td><td><%= loggedInUser != null ? loggedInUser.getPhone() : "" %></td>
                <td class="label">휴대폰번호</td><td><%= loggedInUser != null ? loggedInUser.getPhone() : "" %></td>
            </tr>
            <tr>
                <td class="label">주소</td><td colspan="3"><%= loggedInUser != null ? loggedInUser.getAddress() : "" %></td>
            </tr>
        </table>
        <br>
        <table>
            <tr>
                <td class="label2">회원등급</td><td></td>
            </tr>
            <tr>
                <td class="label2">KTX마일리지/포인트</td><td></td>
            </tr>
            <tr>
                <td class="label2">간편현금결제 설정</td><td></td>
            </tr>
        </table>
    </div>
    
</body>
</html>