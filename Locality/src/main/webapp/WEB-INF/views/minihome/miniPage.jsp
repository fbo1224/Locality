<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <p>My 미니홈피🏡</p>
            <a href="mainPage">돌아가기🌍</a>
        </div>
        <div id="menu">
            <button class="btn btn-lg btn-secondary" onclick="photo()">사진첩</button>
            <button class="btn btn-lg btn-secondary" onclick="guestBook()">방명록</button>
            <button class="btn btn-lg btn-secondary" onclick="friend()">친구목록</button>
        </div>
        <div>
        	
        </div>
    </div>
	
	<script>
		function photo(){
			location.href='photoBook';
		}
		function guestBook(){
			location.href='guestBook';
		}
		function friend(){
			location.href='friendAll';
		}
	</script>
	
	
</body>
</html>