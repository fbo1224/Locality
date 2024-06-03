<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	height: 1000px;
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

.detail>div {

		height : 25%; 
		width : 30%; 
		margin-right:12px; 
		font-size:12px;

}

.category_btn {
		
		width : 90%;
		border : none;
		border-radius : 9px;
		color : white;
		
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

.place_name{
			height : 25%; 
			width : 100%; 
			font-weight : bolder;
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
		<select style="height : 30px; width : 100px;">
		<option>동물병원</option>
		<option>미용실</option>
		<option>호텔</option>
		</select>
		</div>
		
		<div id="second" style="margin-left : 500px; ">
		
		<input type="text" id="keyword" style="width: 290px; margin-left:-5px; margin-right:-5px;"placeholder="지역명을 입력해주세요"/>
		
		<button id="btn" onclick="findKeyword();">
		
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	         <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
	        </svg>
		
		</button>
		</div>
		
				
		</div>
		
		
		
		<div id="component" style="height:75%; width:100%; margin-top: 45px; border-top : 2px solid lightgray;">
			
		
			
		
				
		</div>
		
		<div style="width : 100%; height : 15%">
		<div class="container mt-3" style="width:40%; margin-left : 30%;">
		
		
		 <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#" style="background-color : #FFFAB7">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item"><a class="page-link" href="#" style="background-color : #FFFAB7">Next</a></li>
  </ul>
</div>
		
		</div>
		</div>

	</div>
	<jsp:include page ="../common/footer.jsp"/>

<script>
 function findKeyword() {
	 
	 const $query = $('#keyword').val();
	 const name='동물병원';
	 console.log($query);
	 
	
	 
	 
	 
	 $.ajax({
		 
		 url: 'findHospital',
		 type : 'get',
		 data : {"keyword" : $query, "page" : "2", "size" : "10", "category_name" : name},
		 success : result => {
			 

			 console.log($(result).find('documents'));
			 console.log(result.documents);
			 
			 const listArr = result.documents;
			 console.log(result.documents[0].place_name);
			 
			 let text = '';
			 for(let i in result.documents) {
				 
				text += '<div class="component" style="height:75%; width:100%; margin-top: 45px; border-top : 2px solid lightgray;">'
					
					  +'<div class="componenets" style="border-bottom : 2px solid lightgray;">'
						
						
					 +	'<div style="height:85%; margin-top : 10px;width: 120px; border : 1px solid lightgray"> 이미지</div>'
						
					 +	'<div id=text style="height:85%; margin-top : 10px;width: 360px; margin-left : 20px;">'
							
					 +		'<div class="place_name">'+result.documents[i].place_name+'</div>'  
							
					 +		
							'<div style="height : 65%; width : 100%; margin-top : 10px; font-size : 12px;" >'
							+ result.documents[i].road_address_name
					+		'</div>'
					+	'</div>'
						
						
					+	'<div class=detail style="height:85%; margin-top : 10px;width: 390px; margin-left : 20px;">'
					+	'<div><p>url주소</p>'
								 +'없음'
					+	'</div>'
					+		'<div>'+result.documents[i].phone+'</div>'
					+		'<div style="padding-left : 24px;"><button class="category_btn" style="background-color:#7EA1FF">예약하기</button> </div>'
						
					+	'</div>'
						
						
						
				+		'</div>'	
							 
			
				
				 
				 
			 };
			 
			 
			 $('#component').html(text);
			 
		//	 $('#text').html(text);
		//	 $('#phone').text(phone);
			
			
		
		
		 } 
	 });
	 
 }
	



</script>
</body>
</html>