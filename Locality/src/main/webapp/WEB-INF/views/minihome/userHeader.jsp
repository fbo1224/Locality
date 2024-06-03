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
body{
	background-color: rgba(153, 150, 146, 0.61);
}
#miniLogo {
	width: 100%;
	height: 200px;
	margin: auto;
	text-align: center;
	box-shadow: 2px 2px 2px rgba(105, 103, 103, 0.89);
	border-radius: 20px;
	background-color: rgb(180, 183, 184);
}

#miniLogo>p {
	height: 100px;
	margin: 0;
	font-size: 30px;
	line-height: 150px;
	font-weight: bold;
}

#miniLogo>a {
	font-size: 15px;
	font-weight: bold;
	text-decoration: none;
	color: black;
	line-height: 50px;
}

#miniLogo>a:hover {
	color: red;
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

	<div id="miniLogo">
		<p>${friendName} 미니홈피🏡</p>
		<a onclick="history.back();">🔙   Main이동</a>
	</div>
	<br>
	
</body>
</html>