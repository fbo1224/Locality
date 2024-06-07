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
		


#content {
	height: 912px;
	width: 100%;
	margin: auto;
	
}

#content div {
	float: left;
}

#title{
		margin-top: 40px;
		padding-top:29px;
	}

.box {
		width:15x; 
		height: 15px;
		margin-left : 40px;
		
}	
#detail>div {
		margin-top : 20px;
		height : 35%;
}

.pet{
	font-size: 17px;
	color : gray;
	margin-left: 5px;
	margin-right : 9px;

}
#btn{
		width: 50%;
		height: 50px;
		border : lightgray;
		background-color : #FFD1E3;
		border-radius : 9px;
		color : gray;
		font-weight: bolder;
		font-size : 20px;
}

#submit {
padding-left : 31%;

}
			
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div id="entire">
<div id="title" class="table" style="height: 17%; font-family:bolder;"><h2 align="center" style="margin-top:100px;" >게시글 등록</h2></div>

<form action ="insertAnimalBoard" method="post" enctype="multipart/form-data">
<div id="content" style="width: 1200px; height: 80%; ">

<div id="component"style="height: 80%; width: 100%; margin-top: 20px; border-top: 2px solid lightgray;">
	<div id="detail" style="height:20%; width:100%;">
		<div id="category">
			<select style="height:77%; width: 190px; border-radius: 9px;" name="categoryName">
				<option selected>카테고리</option>
				<option id="1">묻고답해요</option>
				<option id="2">반려동물TIP</option>
				<option id="3">일상공유</option>
				<option id="4">소개합니다</option>
			</select>
		</div>
		<div id="name" style="width: 100%">
		<input type="text" name ="title" placeholder="제목을 입력해주세요." style="height:80%; width: 100%; border-radius:7px;" required/>
		</div>
	</div>
	<div id="content" style="height: 520px; width:100%">
	<textarea name="content" rows= "18" cols= "161" style="border-radius:2px;"></textarea>
	<input type="file" name="upfile"/>
	<input type="checkbox" class="box" name="animalName" value="설이"/><label class="pet">설이</label>
	<input type="checkbox" class="box" name="animalName" value="까미"/><label class="pet">까미</label>
	</div>
	
</div>
<div id="submit"style="width:100%; height:9%"><button type="submit" id="btn">등록</button></div>
</div>
</form>
</div>

<jsp:include page ="../common/footer.jsp"/>
</body>
</html>