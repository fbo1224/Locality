<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#insertBox{
	width: 800px;
	height:auto;
	margin: auto;
	text-align: center;
}
textarea{
	display: inline-block;
	border: none;
	border-radius: 5px;
	font-size: 15px;
	font-weight: 400;
	padding-left: 15px;
	background-color: rgb(131, 126, 126);
	color:white;
}
textarea:focus {
	outline: none;
}
#insertBox>button{
	float: right;
	width: 100px;
	height: 125px;
	border:none;
	border-radius: 5px;
	background-color: red;
	color: white;
	font-weight:bold;
}
#insertBox>p{
	margin:0;
	height: 30px;
	text-align:left;
	padding-left:20px;
	font-weight:bold;
	margin-bottom: 20px;
	border-bottom: 0.5px solid black;
	border-radius: 5px;
}
#selectBox{
	width: 800px;
	margin: auto;
	height: auto;
}
.nickName{
	display:block;
	height: 30px;
	padding-left:20px;
}
.content{
	margin:0;
	height: 100px;
	padding-left:20px;
}
.createDate{
	display:block;
	height: 30px;
	border-bottom: 0.5px solid black;
	padding-left:20px;
}
.ud{
	position: relative;
	bottom:30px;
	left: 750px;
}
</style>
</head>
<body>

	<jsp:include page="miniHeader.jsp"/>
	<br>
	<div id="main">
		
		<div id="insertBox">
			<textarea name="postContent" rows="5" cols="90" style="resize:none;"></textarea>
			<button onclick="insertPost();">작성</button>
			<p id="counter">(0 / 50)</p>
		</div>
		<div id="selectBox">
			
		</div>
	</div>
	
	<script>
		function enter(){
			if (window.event.keyCode == 13){
				insertPost();
			}
		}
		
		$('textarea').keyup(() => {
	        let content = $('textarea');
	        $('#counter').html("("+ content.val().length +" / 50)");
	    
	        if (content.val().length > 50){
	            alert("최대 50자까지 입력 가능합니다.");
	            content.val(content.val().substring(0, 50));
	        }
	    });
		
		$(()=>{
			selectBookList();
		})
		
		function selectBookList(){
			let userNo = ${sessionScope.loginUser.userNo};
			$.ajax({
				url: 'miniPage/book/' + userNo,
				success: list => {
					let data ='';
					if(list.length === 0){
						alert('게시글이 존재하지 않습니다.')
					}
					else{
						data = list.data.map(book =>{
							return '<div class="bookList">'
								+  '<input type="hidden" value="'+ book.postNo +'">'
								+  '<span class="nickName">'+ book.nickName +'</span>'
								+  '<p class="content">'+ book.postContent +'</p>'
								+  '<span class="createDate">'+ book.createDate +'</span>'
								+  '<div class="ud"><a onclick="deletePost(this)">삭제</a></div>'
								+  '</div>';
						});
						
						
					}
					$('#selectBox').html(data)
				}
			})
		}
		
		function insertPost(){
			let userNo = ${sessionScope.loginUser.userNo};
			let postContent = $('textarea').val();
			let nickName = '${sessionScope.loginUser.nickName}';
			
			if($('textarea').val() === ''){
				alert('입력해주세요~')
			}
			else{
				$.ajax({
					url : 'miniPage/'+userNo+'/'+postContent+'/'+nickName,
					type: 'post',
					success: data =>{
						if(data.data === 'Y'){
							$('textarea').val('');
							$('#counter').html("(0 / 50)");
							selectBookList();
						}
						else{
							alert('작성실패');
						}
					}
				})
			}
		}
		
		function deletePost(e){
			if(confirm('삭제하시겠습니까?')){
				let postNo = $(e).parent().siblings('input').val();
				
				$.ajax({
					url: 'miniPage/delete/' + postNo,
					type: 'post',
					success: data => {
						if(data.data === 'success'){
							alert('삭제 되었습니다.')
							selectBookList();
						}
						else{
							alert('오류가 발생했습니다.')
						}
						
					}
				})
			}
		}
	</script>
	
</body>
</html>