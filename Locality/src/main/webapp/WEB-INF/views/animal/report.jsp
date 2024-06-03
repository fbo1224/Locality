<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	padding-bottom: 20px;
	margin: 0 auto;
}

.row{
	height:35px; 
	width: 95%; 
	margin: auto;
	margin-top : 40px;

}

.head{
		width: 20%;
		font-size : 20px;
		font-weight : bolder;
		color:gray;

}

.tail {
		width : 80%;


}

.text{
	height:100%;
	width: 100%;
	border-radius : 5px;
	border : 1px solid lightgray;
}

#file {
	width : 87px;
	height : 35px;

}

.box {
		width:20px; 
		height: 20px;
		margin-left : 40px;
		color : skyblue;
}

#check>label {
		font-size : 20px;
		color : gray;

}

#button {

		width: 73%;
		height: 50px;
		border : lightgray;
		background-color : #FFD1E3;
		border-radius : 9px;
		color : gray;
		font-weight: bolder;
		font-size : 20px;
		

}

#date>input{
		height:100%;
		width: 45%;
		border-radius : 5px;
		border : 1px solid lightgray

}

#time{

		margin-left : 62px;
}


</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div id="entire">

		<div id="title">
			<h3 align="center" style="font-weight: bolder; font-size:30px;">실종 제보</h3>
		</div>

		<div id="content" style="width: 1200px; height: 80%; ">
			
			<form action="insertReport" method="post" enctype="multipart/form-data">
			<div id="component"
				style="height: 90%; width: 100%; margin-top: 45px; border: 2px solid #FFD1E3; border-radius : 35px; padding-left:65px;">

				<div class="row"><div class="head">실종장소</div><div class="tail" ><input type="text" class="text" placeholder="실종장소를 입력해주세요" name="reportPlace"/></div></div>
				
				<div class="row"><div class="head">일자/시각</div><div class="tail" id="date"><input type="date" name="reportDate"/><input type="time" id="time" name="reportTime"></div></div>
					
				<div class="row"><div class="head">내용</div><div class="tail"><textarea  rows="8" cols="29" class="text" placeholder="내용을 입력해주세요" name="content"></textarea></div></div>
				
				<div style="margin-top:180px; margin-left: 210px; width:95%;"><input type="file" id="file" name="upfile"/></div>
				
				<!-- 여기서부터는 for문 돌릴 예정  -->
				<div id="check" style="margin-top: 32px; margin-left: 175px; float:left; width:100%;" ><input type="checkbox" class="box" name="animalName" value="설이"/><label>설이</label><input type="checkbox" class="box" name="animalName" value="까미"/><label>까미</label></div>
				
				<div style="margin-top: 45px; margin-bottom: 25px; margin-left: 160px; width:100%;"><button type="submit" id="button" >등록</button></div>
		
		</div>
		</form>
	</div>
</div>
	<jsp:include page="../common/footer.jsp" />


	<script>
	
	//	$('#button').click(()=>{
		
	//		location.href = 'insertReport'
	//	});
	
	
		
	
	</script>
</body>
</html>