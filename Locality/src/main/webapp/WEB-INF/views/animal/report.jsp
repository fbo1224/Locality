<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
#entire {
	height: 1000px;
}

#content {
	height: 912px;
	width: 100%;
	margin-left: 500px;
}

#content div {
	float: left;
}

#title {
	padding-top: 50px;
	padding-bottom: 75px;
	margin: 0 auto;
}




</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div id="entire">

		<div id="title">
			<h3 align="center" style="font-weight: bolder;">실종 제보</h3>
		</div>

		<div id="content" style="width: 920px; height: 80%;">
			

			<div id="component"
				style="height: 75%; width: 100%; margin-top: 45px; border: 2px solid lightgray; border-radius : 35px;">

				
				
				
				

		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />


	<script>
		
	</script>
</body>
</html>