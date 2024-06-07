<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../common/errorPage.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>타이틀</title>

<style>
	#entire {
			height: 1000px;
	}
	
	#entire div{
		
		float : left;	
	}
	
	#board_table{
		height: 60%;
		width : 100%;		
	}
	
	#title{
		margin-top: 30px;
		padding-top : 35px;
	}
	
	#table_btn {
	
		width:200px;
		margin-left: 44%;

	}
	
	#report {
		height: 95%;
		width : 15%;
		margin-right : 35px;
		
	}
	
	#report>div {
	border : 1px solid lightgray;
	}
	
	#btn {
		width : 170px;
		background-color :  #FFD1E3;
		color : lightgray;
		font-weight : bolder;  
		border-radius : 9px;
		height : 35px;
		border : none;
		cursor : pointer;
	}
	
	#btn:hover {
		box-shadow : 20px;
		color:gray;
	}
	
	.table-dark>th{
		margin-left : 50px;
	}
	
	#thead{
	background-color : #FFD1E3;
	color : blue;
	}
	
	#text>ul {
			list-style-type : none;
	}
	
	#click{
	width:100%; 
	font-size:17px;  
	margin-left:1380px;
	}
	
	#click>a {
		color:grey;
	
	}
	.image>img{
		height:100%;
		width:100%;
	
	}
	
	
	
	
	
</style>


</head>
<body>

<jsp:include page="../common/header.jsp"/>


<div id="entire">

	<div id="board_table" class="table">
	
		<div id="title" class="table" style="height: 20%; font-family:bolder;"><h2 align="center">실종제보</h2></div>
		
		<div id="content" class="table" style="height: 50%; padding-left : 23%; " >
			
			<!-- 나중에는 for문 돌릴 예정 -->
			<c:forEach items="${list }" var="Report" >
				<div id="report">
				<div class="image" style="height:65%; width : 100%; "><img src="${Report.changeName }" alt="파일"></div>
					<div id="text" style="height:35%; width : 100%; font-size : 11px;">
						<ul>
							<li>이름 : ${Report.animalName }</li>
							<li>종류 : ${Report.animalType } / ${Report.breede }</li>
							<li>나이 : ${Report.age}</li>
							<li>실종장소 : ${Report.reportPlace }</li>
							
						</ul>						

					</div>
					</div>
			</c:forEach>
			</div>
			
			

		<div id="table_btn">
		<button type="button" id="btn" onclick="location.href='report'">실종제보하기</button>
		</div>
	</div>
	<div style="height:38%; width : 100%;">
		<!-- bootStrap 게시판 예정 -->
		<h2 align="center"> 최근 게시글 top 5 </h2>
	
		<div id="click"> <a href="boardList">더보기</a> </div>	
  <table class="table" style="width : 52%; margin-left : 23%; margin-top:25px;">
    <thead>
      <tr id="thead">
        <th>카테고리</th>
        <th colspan="3">제목</th>
        <th>종</th>
        <th>종류</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>카테고리명</td>
        <td colspan="3">제목 </td>
        <td>말티푸</td>
        <td>강아지 </td>
        <td>2024.03.22</td>
        <td>5</td>
      </tr>
       
          </tbody>
  </table>
 
		
	</div>

</div>
</div>
<script>
	
	
	

	/*
	 전체 게시글 불러오기? callback함수
	$(function(){
		findTopBoards
		
	
	});
	
	function findTopBoards(){
		$.ajax({
				url:recentBoards
				success : function (result) {
					console.log(result);
				}
				
				let value = '';
				for(let i in result){
					value += 
				} 
		})
	}

	*/


</script>





<jsp:include page ="../common/footer.jsp"/>

</body>
</html>