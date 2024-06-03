<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*div{box-shadow: 0 0 0 1px red;}*/

    #wrap{
        margin: auto;
        width: 100%;
        height: 1000px;
    }

    #ct{
        margin: auto;
        width: 1200px;
        height: auto;
    }

    #title{
        width: 100%;
        height: 100px;
        border-bottom: 1px solid black;
        text-align:center;
    }
    #title > p{
    	font-size:35px;
    	font-weight:bold;
    }

    #photo{
        width: 50%;
        height: 600px;
        float: left;
        position:relative;
    }

    #photo > img{width: 100%; height: 100%;}
	#photo > h1{position:absolute; top:50%; left:100px;}
	#photo > input{position:absolute; top:230px; left:200px;}
	
    #info{
        width: 50%;
        height: 600px;
        float: right;
    }

    #info > table{
        font-size: 20px;
    }

    .table{
        height: 100%;
    }
    button{
        width: 200px;
        height: 40px;
        border: none;
        color: white;
        background-color: skyblue;
        margin-top:100px;
    }

    button:hover{
        color: hotpink;
        border: 1px solid hotpink;
    }
    textarea{
    	width:300px;
    	height:150px;
    }
    input{
    	width:300px;
    }
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
    <div id="wrap">
    
    	
        <div id="ct">
            <div id="title">
                <p>경매 상품등록</p>
            </div>

           	<form action="insert.auction" method="post" enctype="multipart/form-data">
	            <div id="photo">
	                <img class="img" src="./resources/images/auction/basic.png">
	                <h1 id="upfileMent">사진을 등록해주세요.</h1>
	                <input type="file" name="upfile" onchange="loadImg(this);" id="upfile">
	            </div>
	            <div id="info">
	            	<input type="hidden" name="userNo" value="${ loginUser.userNo }">
					<input type="hidden" name="seller" value="${ loginUser.nickName }">
		                <table class="table table-hover">
		                	<tr>
		                		<td>거래 규모</td>
		                		<td>
		                			<select name="scale">
		                				<option value="1">대(1,000,000원 이상 5,000,000원 이하)</option>
		                				<option value="2">중(100,000원 이상 1,000,000미만)</option>
		                				<option value="3">소(100,000원 미만)</option>
		                			</select>
		                		</td>
		                	</tr>
	                	
		              		<tr>
		                       <td>상품 등록명</td>
		                       <td><input type="text" name="pdName"></td>
	                      	</tr>
		                   	<tr>
		                   		<td>상품 설명</td>
		                   		<td><textarea name="pdDesc"></textarea></td>
		                   	</tr>
		                  		<tr>
		                        <td>시작가</td>
		                        <td><input type="number" name="startPrice"></td>
                      		</tr>
                      		 <tr>
		                       	<td>입찰단위</td>
		                       	<td><input type="number" name="bidUnit"></td>
	                      	</tr>
							<tr>
		                       	<td>경매 시작일자</td>
		                       	<td>
		                       		<label for="date">날짜를 선택하세요:
								  	<input type="date"
									       name="startDate"
									       max="2077-06-20"
									       min="2077-06-05"
									       value="2077-06-15">
									</label>
								</td>
	                      	</tr>
	                      	<tr>
	                      		<td><button type="submit">등록하기</button></td>
	                      	</tr>
                </table>
	            </div>
            </form>
        </div>
	</div>
    
    
    <script>
    	function loadImg(inputFile){
    		if(inputFile.files.length){
    			const reader = new FileReader();
    			document.getElementById("upfile").style.display = "none";
    			document.getElementById("upfileMent").style.display = "none";
    			reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(e){
                    $('#photo > img').attr('src', e.target.result);
                };
   			}
    	}
    </script>
    

	<jsp:include page="../common/footer.jsp" />

</body>
</html>