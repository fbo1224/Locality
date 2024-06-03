<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		width : 200px;
		background-color :  #7EA1FF;
		color : white;
		font-weight : bolder;  
		border-radius : 5px;
		height : 40px;
		border : none;
	}
	
	#btn:hover {
		box-shadow : 20px;
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
	
	
	
	
	
</style>


</head>
<body>

<jsp:include page="../common/header.jsp"/>


<div id="entire">

	<div id="board_table" class="table">
	
		<div id="title" class="table" style="height: 20%; font-family:bolder;"><h2 align="center">실종제보</h2></div>
		
		<div id="content" class="table" style="height: 50%; padding-left : 23%; " >
			
			<!-- 나중에는 for문 돌릴 예정 -->
			<div id="report">
			<div class="image" style="height:65%; width : 100%; ">Image</div>
					<div id="text" style="height:35%; width : 100%; font-size : 11px;">
						<ul>
							<li>이름 : 까미</li>
							<li>종류 : 고양이 / 코리안숏헤어</li>
							<li>나이 : 6살</li>
							<li>실종장소 : 연희동 어딘가</li>
							
						</ul>						

					</div>
			</div>
		
			<div id="report" style="margin-right : 35px;">
			<div class="image" style="height:65%; width : 100%; ">Image</div>
			<div id="text" style="height:35%; width : 100%;">text</div>
			</div>
			
			<div id="report" style="margin-right : 35px;">
			<div class="image" style="height:65%; width : 100%;">Image</div>
			<div id="text" style="height:35%; width : 100%;" >text</div>
			</div>
			
			<div id="report" style="margin-right : 35px;">
			<div class="image" style="height:65%; width : 100%; " >Image</div>
			<div id="text" style="height:35%; width : 100%;">text</div>
			</div>
		
		
		</div>
		<div id="table_btn">
		<button type="button" id="btn" onclick="location.href='report'">실종제보</button>
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