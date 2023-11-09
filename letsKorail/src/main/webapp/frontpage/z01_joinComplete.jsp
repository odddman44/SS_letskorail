<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 완료</title>
</head>
<style>
    div {
        background-color: aliceblue;
    }
    b {
        color : mediumaquamarine;
    }
    .alertNum {
        font-weight : bold;
    }
</style>
<body>
    <div>
    <h2>정상적으로 <b>코레일멤버십</b>으로 가입되었습니다.</h2><br>
    <p class="alertNum">고객님의 멤버십 번호는 <b><%=request.getAttribute("membershipNumber")%></b>입니다.</p>
        <ul>
            <li>코레일멤버십은 별도의 회원카드를 발급받지 않습니다.</li>
            <li><b>코레일 홈페이지에서 승차권 예약서비스를 이용</b>할 수 있습니다.</li>
            <li><b>이메일 또는 휴대폰인증을 받으시면 홈페이지 로그인 아이디로 사용</b>하실 수 있습니다.</li>
        </ul><br>
    </div>
<a href="index.html"><input type="button" value="메인으로" style="float:right; background-color:skyblue;"/></a>
<script>

</script>
</body>
</html>