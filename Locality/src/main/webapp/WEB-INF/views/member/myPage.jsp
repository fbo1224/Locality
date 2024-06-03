<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#menuName {
	width: 1000px;
	height: 170px;
	text-align: center;
	line-height: 200px;
	font-size: 35px;
	font-weight: bold;
	margin: auto;
}

.myPage {
	width: 500px;
	height: 80px;
	border-bottom: 1px solid black;
	margin: auto;
	text-align: center;
	line-height: 100px;
}

.myPage a {
	color: black;
	font-size: 18px;
}

.myPage a:hover {
	text-decoration: none;
	color: red;
}

#myPageAll{
	margin-bottom: 100px;
}
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div id="menuName">
        <p>마이페이지</p>
    </div>

    <div id="myPageAll">
        <div class="myPage">
            <a href="updateUserForm">개인정보수정</a>
        </div>
        <div class="myPage">
            <a href="">내 반려동물</a>
        </div>
        <div class="myPage">
            <a href="miniPage">미니홈피</a>
        </div>
        <div class="myPage">
            <a onclick="userDelete()" href="#">회원탈퇴</a>
        </div>
    </div>
	
	<form action="userDelete" method="post" id="userDelete">
	</form>
	
	<script>
		function userDelete(){
			
			let check = prompt('탈퇴하실려면 전화번호를 입력해주세요');
			let phone = '${sessionScope.loginUser.phone}';
			
			if(check === phone){
				$('#userDelete').submit();
			}
			else{
				alert('일치하지 않습니다.')
			}
			
		}
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>