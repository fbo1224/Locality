<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrap {
	width: 1200px;
	height: auto;
	margin: auto;
}

#searchBox {
	width: 800px;
	height: 100px;
	text-align: center;
	margin: auto;
	border-bottom: 1px solid rgba(0, 0, 0, 0.445);
	border-radius: 5cm;
}

#searchBox p {
	width: 400px;
	margin: 0;
	margin-top: 30px;
	color: black;
	font-weight: bold;
	padding-left: 50px;
}

#search {
	width: 400px;
	height: 40px;
	border-radius: 10px;
	border: none;
	padding-left: 10px;
}

#searchBtn {
	border: none;
	background-color: rgba(255, 255, 255, 0);
	position: relative;
	right: 40px;
}

#searchList {
	width: 1000px;
	margin: auto;
	margin-top: 50px;
	height: auto;
	margin-bottom: 50px;
}

#friendList {
	border-top: 1px solid rgba(0, 0, 0, 0.445);
	width: 1000px;
	margin: auto;
}

#confirm {
	border-top: 1px solid rgba(0, 0, 0, 0.445);
	width: 1000px;
	margin: auto;
	margin-top: 50px;
	height: auto;
	margin-bottom: 50px;
}

#friendList>P {
	color: black;
	font-weight: bold;
	font-size: 18px;
	height: 30px;
	padding-left: 20px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.445);
	margin-top: 40px;
}

#searchList>p {
	color: black;
	font-weight: bold;
	font-size: 18px;
	height: 30px;
	padding-left: 20px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.445);
	margin-top: 40px;
}

#confirm>p {
	color: black;
	font-weight: bold;
	font-size: 18px;
	height: 30px;
	padding-left: 20px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.445);
	margin-top: 40px;
}

.table {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="miniHeader.jsp" />
	
	<div id="wrap">
		<div id="searchBox">
			<p>친구 찾기</p>
			<input type="text" id="search" placeholder="이름으로 찾을 수 있습니다."
				onkeydown="enter();">
			<button id="searchBtn" onclick="searchFriend();">🔍</button>
		</div>
		<div id="searchList">
			<p>검색 결과</p>
			<div class="list">
				<table class="table table-borderless table-hover" id="first">
					<thead>
						<tr>
							<th style="width: 200px;">이름</th>
							<th style="width: 200px;">지역</th>
							<th style="width: 450px;">이메일</th>
							<th style="width: 150px;">미니홈피</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">검색해주세요</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div id="friendList">
			<p>내 친구 목록</p>
			<div class="list">
				<table class="table table-borderless table-hover" id="second">
					<thead>
						<tr>
							<th style="width: 200px;">이름</th>
							<th style="width: 200px;">지역</th>
							<th style="width: 450px;">이메일</th>
							<th style="width: 150px;">미니홈피</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">존재하지 않습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div id="confirm">
			<p>승인요청</p>
			<div class="list">
				<table class="table table-borderless table-hover" id="third">
					<thead>
						<tr>
							<th style="width: 200px;">이름</th>
							<th style="width: 200px;">지역</th>
							<th style="width: 400px;">이메일</th>
							<th style="width: 100px;">승인</th>
							<th style="width: 100px;">거절</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">존재하지 않습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<form action="confirmUpdate" method="post" id="confirmUpdate">
	    <input type="hidden" id="userVal" name="userNo">
		<input type="hidden" id="friendVal" name="friendNo">
	</form>
	

	<script>

		function enter(){
			if (window.event.keyCode == 13) {
		    	searchFriend();
		    }
		}
	
		$(()=>{
			friendList();
		})
		
		function searchFriend(){
			let userNo = ${sessionScope.loginUser.userNo};
			$.ajax({
				url : 'miniPage/search/' +  $('#search').val(),
				success: friend => {
		            let str = friend.data.map(list =>{
		            	return '<tr>'
			            	   + '<input type="hidden" value="'+ list.userNo +'"/>'
		                       + '<td>' + list.userName + '</td>'
		                       + '<td>' + list.cityName + ' ' + list.countyName + '</td>'
		                       + '<td>' + list.userId + '</td>'
		                       + '<td><a onclick="responeMini(this);">이동</a></td>'
		                  	   + '</tr>' ;
		            })
		            $('#searchList tbody').html(str);
		            $('#search').val('');
		            }
			})
		}

		
		function friendList(){
			let userNo = ${sessionScope.loginUser.userNo};
			$.ajax({
				url: 'miniPage/' + userNo,
				success: friendList =>{
					let str = friendList.data.map(list => {
						if(userNo !== list.userNo){
							return '<tr>'
			            	     + '<input type="hidden" class="searchAll" value="'+ list.userNo +'"/>'
		                       	 + '<td>' + list.userName + '</td>'
		                       	 + '<td>' + list.cityName + ' ' + list.countyName + '</td>'
		                       	 + '<td>' + list.userId + '</td>'
		                       	 + '<td><a onclick="friendMini(this);">이동</a></td>'
	                    		 + '</tr>' ;
						}
					})
					$('#friendList tbody').html(str);
					friendConfirm();
				}
			})
		}
			
		function friendConfirm(){
			let userNo = ${sessionScope.loginUser.userNo};
			$.ajax({
				url : 'miniPage/confirm/' + userNo,
				success : confirmList => {
					let str = confirmList.data.map(confirm =>{
						return '<tr>'
		            	     + '<input type="hidden" class="confirmAll" value="'+ confirm.userNo +'"/>'
	                       	 + '<td>' + confirm.userName + '</td>'
	                       	 + '<td>' + confirm.cityName + ' ' + confirm.countyName + '</td>'
	                       	 + '<td>' + confirm.userId + '</td>'
		                     + '<td><a onclick="confirmUpdate(this);">⭕ </a></td>'
	                       	 + '<td><a onclick="refuse(this);">❌</a></td>'
                   		     + '</tr>' ;
					})
					$('#confirm tbody').html(str);
				}
			})
		}
		
		function responeMini(e){
			let friendNo = $(e).parent().siblings('input').val();
			let friendName = $(e).parent().siblings('td').eq(0).text();
			let myFriend = $('.searchAll').toArray();
			let confirm = $('.confirmAll').toArray();
			
			let num = 1;
			myFriend.forEach((friend)=>{
				if(friend.value === friendNo){
					num = 2;
				}
			})
			
			confirm.forEach((confirm)=>{
				if(confirm.value === friendNo){
					num = 3;
				}
			})
			
			location.href='friendMiniPage/' + friendNo + '/' + friendName + '/' + num;
		}
		
		function friendMini(e){
			let friendNo = $(e).parent().siblings('input').val();
			let friendName = $(e).parent().siblings('td').eq(0).text();
			
			location.href='friendMiniPage/' + friendNo + '/' + friendName + '/' + 2;
		}
		
		function confirmUpdate(e){
			let userNo = ${sessionScope.loginUser.userNo}
			
			$('#friendVal').val($(e).parent().siblings('input').val());
			$('#userVal').val(userNo);
			$('#confirmUpdate').attr('action', 'confirmUpdate').submit();
		}
		
		function refuse(e){
			let userNo = ${sessionScope.loginUser.userNo}
			
			$('#friendVal').val($(e).parent().siblings('input').val());
			$('#userVal').val(userNo);
			$('#confirmUpdate').attr('action', 'refuse').submit();
		}
		
		
		
	</script>







</body>
</html>