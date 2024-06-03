<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main {
	width: 1250px;
	margin: auto;
	height: auto;
	margin-bottom: 50px;
}
.image {
	display: inline-block;
	text-align: center;
	width: 396px;
	height: 300px;
	box-shadow: 2px 2px 2px gray;
	margin-bottom: 25px;
}
.image>img {
	width: 350px;
	height: 250px;
}
.image>p {
	margin: 0;
	margin-bottom: 15px;
	font-size: 18px;
	font-weight: 600;
}
.image>img:hover {
	transform: scale(1.5);
	transition-duration: 0.5s;
}
#insertImg {
	width: 1200px;
	margin: auto;
	height: 80px;
	text-align: right;
}
#insertImg>h1{
	position: relative;
	top: 200px;
	right: 340px;
}
input[type=checkbox]{
    display: block;
    width: 30px;
}
</style>
</head>
<body>
	<jsp:include page="miniHeader.jsp"/>
	
	<div id="main">
		<c:choose>
			<c:when test="${ empty photoList }">
				<div id="insertImg">
    				<button class="btn btn-danger" id="photoUpload">사진 업로드</button>
    				<h1>이미지가 존재하지 않습니다.</h1>
    			</div>
			</c:when>
			<c:otherwise>
				<div id="insertImg">
					<button class="btn btn-danger" id="photoUpload">사진 업로드</button>
					&nbsp;
					<button class="btn btn-danger" id="photoDelete">체크한 사진 삭제</button>
				</div>
				<c:forEach var="photo" items="${photoList}">
					<div class="image">
	    				<input type="checkbox" class="check" onclick="checkOne(this)">
	    				<input type="hidden" class="filePathVal" value="${photo.filePath}">
	    				<input type="hidden" class="changeNameVal" value="${photo.changeName}">
	    				<input type="hidden" class="fileNoVal" value="${photo.fileNo}">
	    			    <img src="resources/photoUpload/${photo.changeName}" alt="사진"/>
    			    	<p>${ photo.createDate }</p>
    			    </div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<form action="photoDelete" method="post" id="delete">
			<input type="hidden" name="fileNo" id="fileNo">
			<input type="hidden" name="filePath" id="filePath">
			<input type="hidden" name="changeName" id="changeName">
		</form>
	</div>
	
	<script>
		function checkOne(e){
			$('.check').each(function(){
		        $(this).prop('checked', false);
		    });
		    $(e).prop('checked', true);
		    $('#fileNo').val($(e).siblings('.fileNoVal').val())
		    $('#filePath').val($(e).siblings('.filePathVal').val())
		    $('#changeName').val($(e).siblings('.changeNameVal').val())
		}
		$('#photoDelete').click(()=>{
			if(confirm('삭제하시겠습니까?')){
				if($('#fileNo').val() === ''){
                    alert('삭제할 사진을 선택해 주세요.');
                } else {
                    $('#delete').submit();
                }
			}
		})
		$('#photoUpload').click(()=>{
			location.href='photoUploadForm';
		})
	</script>
</body>
</html>