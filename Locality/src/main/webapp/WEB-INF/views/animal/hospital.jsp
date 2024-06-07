<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <meta charset="utf-8">
 
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  
<style>


#entire {
	height: 800px;
		}
		
#content {
	
	height:912px; 
	width: 100%; 
	margin-left : 500px;
}		
	
#content div{
	float : left;
		
		}
		
#title{
padding-top : 50px;
padding-bottom : 75px;
margin:0 auto;

		}
		
.componenets {

	width : 100%;
	height : 20%;
	;
}

.component>div {
	
}

#detail>div {

		height : 25%; 
		width : 30%; 
		margin-right:12px; 
		font-size:12px;

}

.category_btn {
		
		width : 70%;
		border : none;
		border-radius : 9px;
		color : white;
		
}

.page-item {
			background-color : #FFFAB7;
			color : black;
}

#btn {
		background-color : #FFD1E3; 
		height: 30px; 
		width: 35px; 
		border:1px solid lightgray;
		border-radius : 5px;
		

}

.input select, input{
	font-size : 14px;
	border : 1px solid lightgray;
	border-radius : 5px;
}

#place_name{
			height : 25%; 
			width : 100%; 
			font-weight : bolder;
}

.page-link {
			color : lightgrey;
			border-radius : 5px;
}


	


</style>
</head>
<body>
			
	<jsp:include page="../common/header.jsp"/>
	
	
	<div id="entire">
		
		<div id="title">
		<h3 align="center" style="font-weight : bolder;">동물병원</h3>
		</div>
	
		<div id="content" style="width : 920px; height: 80%;">
		<div  class="input" >
		<div id="first" >
		<select id="select"style="height : 30px; width : 100px; onchange="">
		<option selected>동물병원</option>
		<option>애견미용</option>
		<option>동물호텔</option>
		</select>
		</div>
		
		<div id="second" style="margin-left : 500px; ">
		<!-- 로그인 후 회원 정보 중 지역정보  -->
		<div id="city" style="display:none">${area.cityName }</div>
		<div id="area" style="display:none;">${area.countryName } </div>
		<input type="text" id="keyword" style="width: 290px; margin-left:-5px; margin-right:-5px;"placeholder="지역명을 입력해주세요"/>
		
		<button id="btn" onclick="findKeyword();">
		
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	         <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
	        </svg>
		
		</button>
		</div>
		
				
		</div>
			<div class="container mt-3">

				<div class="table-responsive"
					style="height: 75%; width: 100%; margin-top: 45px; border-top: 2px solid lightgray;">
					<table class="table table-bordered">
						<thead>
							<tr style="color: #FFFAB7; border: none;">
								<th>상호명</th>
								<th>주소</th>
								<th>전화번호</th>
								<th></th>


							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>




			<div style="width : 100%; height : 15%">
		<div class="container mt-3" style="width:40%; margin-left : 30%;">
		
		
		 <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#" style="background-color : #FFFAB7">이전</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item"><a class="page-link" href="#" style="background-color : #FFFAB7">다음</a></li>
  </ul>
</div>
		
		</div>
		</div>

	</div>
	<jsp:include page ="../common/footer.jsp"/>

<script>
//도시이름, 행정 구 이름 값, select option 값 
const $city = $('#city').text();
const $area = $('#area').text();
let $category = $('#select').val();

// 페이지 로딩 후 바로 실행됨
$(function() {
	
	$.ajax({
		 
		 url: 'findHospital',
		 type : 'get',
		 data : {"keyword" : $city + $area + $category, "category_name" : $category},
		 success : result => {
			 

			 console.log($(result).find('documents'));
			 console.log(result.documents);
			 
			
			 let text = '';
			 for(let i in result.documents) {
				 
				 
			
				 text += '<tr>' 
					  +	  '<td>' + result.documents[i].place_name + '</td>'
					  +	  '<td>' + result.documents[i].road_address_name + '</td>'
					  +	  '<td>' + result.documents[i].phone + '</td>'
					  +	  '<td><button class="category_btn" style="background-color:#7EA1FF">예약하기</button></td>' 
			  	  +		'</tr>'
	
			 };
			 
			 $('tbody').html(text);
		 } 
	 });
});



// select의 option이 바뀔때마다 값이 달라짐 
$('#select').change(() => {
	$category = $('#select').val();
	console.log($category);
	
 $.ajax({
		 
		 url: 'findHospital',
		 type : 'get',
		 data : {"keyword" : $city + $area + $category, "category_name" : $category},
		 success : result => {
			 

			 console.log($(result).find('documents'));
			 console.log(result.documents);
			 
			
			 let text = '';
			 for(let i in result.documents) {
				 
				 
			
				 text += '<tr>' 
					  +	  '<td>' + result.documents[i].place_name + '</td>'
					  +	  '<td>' + result.documents[i].road_address_name + '</td>'
					  +	  '<td>' + result.documents[i].phone + '</td>'
					  +	  '<td><button class="category_btn" style="background-color:#7EA1FF">예약하기</button></td>' 
			  	  +		'</tr>'
	
			 };
			 
			 $('tbody').html(text);
			
		 } 
	 });
	
	
}) 

// 검색하면 실행됨 
 function findKeyword() {
	 
	 const $query = $('#keyword').val();
	 
	
	// console.log($name);
	// console.log($query);

	 
	 
	 $.ajax({
		 
		 url: 'findHospital',
		 type : 'get',
		 data : {"keyword" : $query, "category_name" : name},
		 success : result => {
			 

			 console.log($(result).find('documents'));
			 console.log(result.documents);
			 
			
			 let text = '';
			 for(let i in result.documents) {
				 
				 
			
				 text += '<tr>' 
					  +	  '<td>' + result.documents[i].place_name + '</td>'
					  +	  '<td>' + result.documents[i].road_address_name + '</td>'
					  +	  '<td>' + result.documents[i].phone + '</td>'
					  +	  '<td><button class="category_btn" style="background-color:#7EA1FF">예약하기</button></td>' 
			  	  +		'</tr>'
	
			 };
			 
			 $('tbody').html(text);
			
		 } 
	 });
	 
 }
	



</script>
</body>
</html>