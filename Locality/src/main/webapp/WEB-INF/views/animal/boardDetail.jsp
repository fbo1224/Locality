<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#entire {
	height: 1000px;
}

#entire div {
	border : 1px lightpink;
}
#content {
	height: 912px;
	width: 100%;
	margin-left: 500px;
	margin : auto;
}
		
#title {
	
	padding-top: 150px;
	margin: 0 auto;
	border-bottom : 1px solid lightgrey;
	
	
}

#information>span{
		margin-left : 14px;
		color:grey;
		font-size : 14px;
		
}

#img-area {
		width: 50%;
		height : 50%;
		margin:auto;
		margin-top : 50px;
}

#img-area>img {
	width : 100%;
	height : 80%;
	margin: auto;
	margin-top : 50px;
}		

#category{
		border-radius : 8px;
		border : none;
		height : 25px;
		width : 150px;
		margin-left : 1390px;
		color : white;
		font-size : 15px;
		background-color :#7EA1FF

}

#revise {
		float : right;
		color : gray;
		margin-top : -50px;
}

#revise>a{
		color : gray;
}

#revise> a : hover {
		background-color : #FFFAB7;
}

.index {
		border:none;
		background-color : #FFD1E3;
		border-radius : 9px;
		width : 100px;
		height : 30px;
		margin-left : 15px;
		color : gray;
	}

	

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div id="entire">
<div id="title" style="border-bottom: 1px solid lightgray;">
			<h3 align="center" style="font-weight: bolder; font-size:30px;">${AnimalBoard.title }</h3>
			<div style="height : 29px;"><button id="category">${AnimalBoard.categoryName }</button></div>
		</div>

		<div id="content" style="width: 1200px; height: 75%; ">
			<div id="information" style="float:right; height:5%; width: 25%; ">
			<span>${AnimalBoard.writer }</span> <span>${AnimalBoard.writeDate }</span> <span>조회수 ${AnimalBoard.viewCount }</span>
			</div>
			<div id="img-area" ><img src="${AnimalBoard.uploadedFile }" alt="file" >
			<span></span>
			</div>
			<div id="component" style="width: 65%; height:26%; margin:auto; margin-top:43px; text-align:center; font-size : 15px;">${AnimalBoard.content }</div>
			<div id="revise" style=" width: 11%; height : 4%;  font-size : 14px;" ><button onclick="location.href=updateDetail?boardNo=${AnimalBoard.boardNo }">수정하기</button>/<button onclick="deleteDetail?boardNo=${AnimalBoard.boardNo }">삭제하기</button></div>
			<div  style="width:30%; height: 9%; margin:auto; margin-top : 15px;">
				<button class="index" onclick="location.href='viewDetail?boardNo='+${AnimalBoard.boardNo-1}">이전</button> <button class="index" onclick="location.href='boardList'">목록</button> <button class="index" onclick="location.href='viewDetail?boardNo='+${AnimalBoard.boardNo+1}">다음</button>
			</div>
		</div>
		
</div>
<jsp:include page ="../common/footer.jsp"/>

</body>
</html>