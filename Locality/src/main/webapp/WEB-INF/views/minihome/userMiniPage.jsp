<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
body {
	background-color: rgb(173, 169, 169);
}

#wrap {
	width: 100%;
	margin: auto;
	height: 600px;
}

#miniLogo {
	width: 100%;
	margin: auto;
	text-align: center;
	line-height: 600px;
}

#miniLogo>p {
	height: 100px;
	margin: 0;
	font-size: 50px;
	line-height: 600px;
	font-weight: bold;
}

#miniLogo>a {
	font-size: 25px;
	font-weight: bold;
	text-decoration: none;
	color: black;
	line-height: 50px;
}

#miniLogo>a:hover {
	color: red;
}

#menu {
	text-align: center;
}

.btn {
	position: relative;
	bottom: 200px;
	margin: 10px 30px;
}

</style>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${ alertMsg }');
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	<div id="wrap">
        <div id="miniLogo">
            <p>${userName} 미니홈피🏡</p>
            <a href="/local/friendAll">돌아가기🌍</a>
        </div>
        <div id="menu">
            <button class="btn btn-lg btn-secondary" onclick="photo()">사진첩</button>
            <button class="btn btn-lg btn-secondary" onclick="guestBook()">방명록</button>
            <c:choose>
            	<c:when test="${result == 1}">
		            <button class="btn btn-lg btn-danger" id="plusBtn" onclick="friend();">친구추가</button>
            	</c:when>
            	<c:when test="${result == 2}">
		            <button class="btn btn-lg btn-danger" id="friendDelete" onclick="friendDelete();">친구삭제</button>
            	</c:when>
            	<c:otherwise>
            		<button class="btn btn-lg btn-danger" id="friendConfirm" onclick="friendConfirm();">친구승인</button>
            	</c:otherwise>
            </c:choose>
        </div>
    </div>
	
	<script>
		
		const friendNo = ${friendNo};
	  	const friendName = '${friendName}';
	  	
		function photo(){
			location.href='/local/userPhoto/' + friendNo + '/' + friendName;
		}
		
		function guestBook(){
			location.href='/local/userGuestBook/' + friendNo + '/' + friendName;
		}
		
		function friend(){
			$.ajax({
				url: '/local/miniPage/follow/' + friendNo,
				type:'post',
				success: confirm =>{
					if(confirm.data === 1){
						$('#plusBtn').css('display', 'none');
						alert('친구 추가 완료. 승인 대기 중')
					}
				}
			})
		}
		
		function friendDelete(){
			$.ajax({
				url: '/local/miniPage/friendDelete/'+friendNo+'/'+${sessionScope.loginUser.userNo},
				type: 'post',
				success: result =>{
					if(result.data === 1){
						$('#friendDelete').css('display', 'none');
						alert('친구 삭제 완료')
					}
				}
			})
		}
		
		function friendConfirm(){
			$.ajax({
				url: '/local/miniPage/confirmUpdate/'+friendNo+'/'+${sessionScope.loginUser.userNo},
				type: 'post',
				success: result =>{
					if(result.data === 1){
						$('#friendConfirm').css('display', 'none');
						alert('친구 승인 완료')
					}
				}	
			})
		}
	</script>
	
	
</body>
</html>