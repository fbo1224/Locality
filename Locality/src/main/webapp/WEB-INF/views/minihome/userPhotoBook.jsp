<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main {
	width: 1250px;
	margin: auto;
	height: auto;
	margin-bottom: 50px;
}
.image {
	display: inline-block;
	text-align: center;
	width: 396px;
	height: 300px;
	box-shadow: 2px 2px 2px gray;
	margin-bottom: 25px;
}
.image>img {
	width: 350px;
	height: 250px;
}
.image>p {
	margin: 0;
	margin-bottom: 15px;
	font-size: 18px;
	font-weight: 600;
}
.image>img:hover {
	transform: scale(1.5);
	transition-duration: 0.5s;
}
#insertImg {
	width: 1200px;
	margin: auto;
	height: 80px;
	text-align: right;
}
#insertImg>h1{
	position: relative;
	top: 200px;
	right: 340px;
}
</style>
</head>
<body>
	<jsp:include page="userHeader.jsp"/>
	
	<div id="main">
		<c:choose>
			<c:when test="${ empty photoList }">
				<div id="insertImg">
    				<h1>이미지가 존재하지 않습니다.</h1>
    			</div>
			</c:when>
			<c:otherwise>
				<div id="insertImg">
				</div>
				<c:forEach var="photo" items="${photoList}">
					<div class="image">
	    			   	<img src="<c:url value='/resources/photoUpload/${photo.changeName}'/>" alt="사진"/>
    			    	<p>${ photo.createDate }</p>
    			    </div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<script>
		function mainPage(){
			location.href=''
		}
		
	</script>
</body>
</html>