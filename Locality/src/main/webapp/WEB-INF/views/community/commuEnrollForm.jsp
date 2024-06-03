<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Locality 공유하기</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <style>
		.outer{
			width: 1200px;
			height: auto;
			margin: auto;
			padding-bottom: 50px;
		}
		.page-header{
			padding-top: 20px;
			font-size: 40px;
			font-weight: bold;
			border-bottom: 6px solid #5BBCFF;
		}
		.content-outer{
			border: 3px solid #5BBCFF; 
			height: auto;	
			width: 900px;	
			margin: auto;	
			margin-top: 80px;
		}
		.content-outer table th{
			height: 80px;
			width: 20%;
			border: 1px solid red;
			text-align: center;
			background-color: #FFFAB7;
		}
		.write{
			border: 1px solid blue;
			width: 100%;
		}
		.content-outer table td{
			height: 80px;
			width: 70%;
			border: 1px solid green;
			padding-left: 5%;
		}
		table{
			border-collapse: initial;
			width: 100%;
		}
		table input{
			width: 90%;
			height: 90%;
		}
		table select{
			width: 20%;
			height: 70%;
		}
		table textarea{
			width: 100%;
			height: auto;
		}
		#insertImg{
			background-color: #7EA1FF;
			color: black;
		}
		#btn-back{background-color: #FFD1E3;}
		#text-area{background-color: #FFFAB7;}
		#img_1{
			width: 90%;
			height: 500px;
		}



    </style>

</head>
<body>

	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer" >
		<div class="row">
		  <div class="col-lg-1">
		  </div>
		  <div class="col-lg-10">
			<div class="panel-body">
				<h2 class="page-header do-hyeon-regular" align="left">함께해요</h2>
				<div class="content-outer"> ★ 나혼자만 알기엔 아까운 것들을 공유해주세요 ★
					<form action="insert" class="write" method="post" enctype="multipart/form-data">
						<table>
							<tbody>
								<tr>
									<th>제목</th>
									<td>
										<input type="text" name="commuTitle" required>
									</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>
										<input type="text" name="commuWriter" value="${ sessionScope.loginUser.nickName }" readonly>
										<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
									</td>
								</tr>
								<tr>
									<th>카테고리</th>
									<td>
										<select name="categoryNo" id="select_category" required>
											<option value="10">맛집</option>
											<option value="20">영화</option>	
											<option value="30">여행</option>	
											<option value="40">운동</option>
											<option value="50">쇼핑</option>
											<option value="60">기타</option>
										</select>			
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td>
										<input type="file" name="upfile" id="upfile" onchange="loadImg(this, 1)">
									</td>
								</tr>
								<tr id="text-area">
									<td colspan="2">
										<img src="" id="img_1">
										<textarea name="commuContent" required></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="content_btn" align="center">
							<button type="submit" class="btn btn-sm btn-primary" id="insertImg">등록하기</button>
							<button type="button" class="btn btn-sm btn-secondary" onclick="history.back()" id="btn-back">뒤로가기</button>
						</div>
					</form>					
				</div>
			</div>            
		</div>
		</div>
	</div>


	<script>
	
	
	
		
		$(function(){ // 사진 첨부가 안되었을 때 이미지 들어갈 화면 가리기
			
			$('#img_1').hide();
			
		})
		
        function loadImg(inputFile, num){
			const str = inputFile.files[0].name
			if(str.includes('.')){
                const reader = new FileReader();

                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(e){
                    switch(num){
                    	case 1 : $('#img_1').attr('src', e.target.result); 
                    	         $('#img_1').show();
                    	         $('#insertImg').show(); break;                   			  
                    }
                }
            }
            else{
            	alert("확장자를 확인하여 주시기 바랍니다.")
            	const str = ''
            	switch(num){
            		case 1 : $('#img_1').attr('src', str);
            				 $('#insertImg').hide(); break;
            	};
            }
        }
        
	       $('#eventTitle').blur(function(){
	           const regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
	           const uname =  $('#eventTitle').val()
	           const resultData = uname.replace(regExp, "");
	           
	            if(uname != resultData){
	                alert('특수문자는 사용이 불가능합니다.')
	                $('#eventTitle').val(resultData)
	            }
	         });	

        

        


	</script>	




    
</body>
</html>