<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	background-color: rgba(0, 0, 0, 0.911);
}

#logo {
	text-align: center;
	width: 1000px;
	height: 100px;
	margin: auto;
}

#logo>p {
	margin: 0;
	color: #FFD1E3;
	line-height: 120px;
	font-size: 50px;
	font-weight: bold;
	text-shadow: 3px 3px 3px rgba(20, 17, 17, 0.678);
}

#login {
	margin: auto;
	width: 800px;
	height: 900px;
	margin-top: 50px;
	margin-bottom: 100px;
	border: 1px solid white;
	border-radius: 10px;
	text-align: center;
	box-shadow: 3px 3px 3px rgb(145, 134, 134);
}

#footer {
	height: auto;
}

#footer_1 {
	width: 100%;
	height: 300px;
	border-top: 5px solid rgba(100, 98, 98, 0.308);
}

#footer_1>p {
	width: 100%;
	margin: 0;
	box-sizing: border-box;
}

#p1 {
	position: relative;
	top: 10%;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	color: rgba(0, 0, 0, 0.226);
	text-shadow: 2px 2px rgba(168, 161, 161, 0.596);
}

#p2 {
	position: relative;
	text-align: center;
	top: 60%;
	color: rgb(58, 56, 56);
}

input {
	width: 100%;
	height: 45px;
	margin-bottom: 25px;
	padding-left: 20px;
	background-color: rgba(112, 101, 101, 0.548);
	border: none;
	color: white;
}

input::placeholder {
	color: rgba(194, 189, 187, 0.616);
}

#frame {
	width: 400px;
	height: 100%;
	margin: auto;
	text-align: center;
	padding-top: 50px;
}

#frame p {
	margin: 0;
	text-align: left;
	color: rgba(255, 255, 255, 0.452);
}

#emailSend {
	position: relative;
	left: 375px;
	bottom: 70px;
	height: 45px;
	border: none;
}

#email {
	height: 75px;
	margin-bottom: 0px;
}

#login>h1 {
	position: relative;
	top: 30px;
	color: #FFD1E3;
}

#email>span {
	color: rgba(255, 255, 255, 0.452);
	position: relative;
	bottom: 32px;
	right: 60px;
}

#confirmBtn {
	position: relative;
	left: 245px;
	bottom: 70px;
	height: 45px;
	width: 80px;
	border: none;
}

#emailCheck {
	height: 75px;
}

#selectBox {
	height: 130px;
	padding-top: 10px;;
}

#selectBox>select {
	width: 100%;
	height: 30px;
	margin-bottom: 2px;
	background-color: rgba(112, 101, 101, 0.548);
	color: rgba(43, 11, 11, 0.733);
	font-weight: bold;
	text-align: center;
}
</style>
</head>

<body>
	
	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}')
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	<div id="logo">
		<p>Locality</p>
	</div>
	<div id="login">
		<h1>회원가입</h1>
		<div id="frame">
			<p>* 필수 입력 (<>+_\ - # & | ; 특수문자 사용 불가 )</p>
			<div id="email">
				<input type="text" id="userId" required
					placeholder="* 이메일 입력"><br>
				<button id="emailSend" class="btn btn-danger">인증번호 발송</button>
				<span>* 이메일 인증을 진행해주세요</span>
			</div>
			<div id="emailCheck">
				<input type="text" id="emailConfirm" placeholder="* 인증번호 확인">
				<input type="hidden" id="hiddenConfirm">
				<button id="confirmBtn" class="btn btn-danger" disabled>확인</button>
			</div>
			<div id="pwd">
				<input type="password" id="userPwd" required
					placeholder="* 비밀번호 입력">
			</div>
			<div id="pwd">
				<input type="password" id="checkPwd"required
					placeholder="* 비밀번호 확인">
			</div>
			<div id="name">
				<input type="text" required id="userName" placeholder="* 이름">
			</div>
			<div>
				<input type="text" required id="nickName" placeholder="* 닉네임">
			</div>
			<div>
				<input type="text" required id="phone" placeholder="* 휴대폰 번호" style="margin: 0;" />
			</div>
			<div id="selectBox">
				<p>{ 거주지 }</p>
				<select id="city">
					<option value="11">* 서울특별시</option>
					<option value="21">* 부산광역시</option>
					<option value="22">* 대구광역시</option>
					<option value="23">* 인천광역시</option>
					<option value="24">* 광주광역시</option>
					<option value="25">* 대전광역시</option>
					<option value="26">* 울산광역시</option>
					<option value="29">* 세종특별자치시</option>
					<option value="31">* 경기도</option>
					<option value="32">* 강원도</option>
					<option value="33">* 충청북도</option>
					<option value="34">* 충청남도</option>
					<option value="35">* 전라북도</option>
					<option value="36">* 전라남도</option>
					<option value="37">* 경상북도</option>
					<option value="38">* 경상남도</option>
					<option value="39">* 제주특별자치도</option>
				</select> 
				<select id="county">
					
				</select>
			</div>
			<div id="submit">
				<button class="btn btn-secondary" onclick="back();">취소</button>
				&nbsp;
				<button class="btn btn-danger" type="button" id="insertBtn">확인</button>
			</div>
		</div>
	</div>
	
	<form action="signUpUser" method="post" id="userForm">
		<input type="hidden" id="hiddenId" name="userId">
		<input type="hidden" id="hiddenPwd" name="userPwd">
		<input type="hidden" id="hiddenName" name="userName">
		<input type="hidden" id="hiddenNick" name="nickName">
		<input type="hidden" id="hiddenPhone" name="phone">
		<input type="hidden" id="hiddenAreas" name="areasCode">
		<input type="hidden" id="hiddenSocialId" name="socialId">
	</form>
	
	<div id="footer">
		<div id="footer_1">
			<p id="p1">이웃사람들</p>
			<p id="p2">Copyright © 1998-2024 Asihana Information Educational
				Institute All Right Reserved</p>
		</div>
	</div>

	<script>
		
		function back(){
			location.href='loginForm';
		}
	
		const emailSend = document.getElementById('emailSend');
        const confirmBtn = document.getElementById('confirmBtn');
        let userId = document.getElementById('userId');
        let emailConfirm = document.getElementById('emailConfirm');
        let hiddenConfirm = document.getElementById('hiddenConfirm');
        let emailConfirmed = false;
        
        // 인증번호 발송 클릭
        emailSend.addEventListener('click', () => {
        	if(userId.value === ''){
        		alert('이메일을 입력해주세요')
        	}
        	else{
        		$.ajax({
        			url: 'signUp/confirm/' + userId.value,
        			type: 'post',
        			success: confirm=>{
        				if(confirm.data === 1){
        					alert('이미 가입된 이메일 정보 입니다.')
        				}
        				else{
        					emailtransmit();
        				}
        			}
        		})
        	}
        })
        
        // 이메일 발송 함수
        function emailtransmit(){
        	userId.setAttribute('readonly', 'readonly');
        	emailSend.setAttribute('disabled', 'disabled');
        	$.ajax({
                url: 'signUp/' + userId.value,
                type: 'post',
                success: confirm =>{
                	alert('인증번호 전송완료')
                	hiddenConfirm.value = confirm.data;
                	confirmBtn.removeAttribute('disabled');
                }
            })
        }
        
        // 이메일 인증번호 클릭
        confirmBtn.addEventListener('click', () => {
        	if(emailConfirm.value === hiddenConfirm.value){
        		alert('인증되었습니다.');
        		emailConfirmed = true;
        		emailConfirm.setAttribute('readonly', 'readonly');
        		confirmBtn.setAttribute('disabled', 'disabled');
        	}
        	else{
        		alert('다시 입력해주세요');
        	}
        })
        
        // 특수문자 제어
		document.querySelectorAll('input').forEach(input => {
		    input.addEventListener('keyup', function() {
		        const regExp = /[<>+_\-#&|\\;]/ig;
		        let str = this.value;
		        if(regExp.test(str)) {
		            alert('사용할 수 없는 특수 문자입니다.');
		            str = str.replace(regExp, ''); 
		            this.value = str;
		        }
		    });
		});
		
        function cityAjax(){
        	$.ajax({
				url: 'signUp/' + $('#city').val(),
				type: 'get',
				success: city =>{
					let str = city.data.map(option=>{
						return '<option value="'+ option.areasCode +'">* '+ option.countyName +'</option>'
					}); 
					$('#county').html(str);					
				}
			})
        }
        
		$(document).ready(()=>{
			cityAjax();
		})
		
		$('#city').click(()=>{
			cityAjax();
		})
		
		$('#insertBtn').click(()=>{
			
			const regPhone = /^(01[0|1|6|7|8|9])(?!-)([0-9]{3,4})(?!-)([0-9]{4})$/;
			
			if($('#userPwd').val() !== $('#checkPwd').val()){
				alert('비밀번호가 일치 하지 않습니다.');
			}
			else if(!emailConfirmed){
				alert('이메일 인증이 완료되지 않았습니다.')
			}
			else if($('#userPwd').val() === '' || $('#checkPwd').val() === '' || $('#userName').val() === '' || $('#nickName').val() === '' || $('#phone').val() === '' ){
				alert('입력되지 않은 값이 있습니다.')
			}
			else{
				if(!regPhone.test($('#phone').val()) || $('#phone').val().length < 10){
					alert('올바르지 않은 전화번호 형식 입니다. 다시 입력해주세요')
				}
				else{
					$.ajax({
						url: 'signUp/' + $('#nickName').val() + '/' + $('#phone').val() ,
						type: 'get',
						success: confirm =>{
							if(confirm.data === 'okay'){
								signUpUser();
							}
							else if(confirm.data === 'nickName'){
								alert('이미 사용중인 닉네임 입니다. 변경해주세요')
							}
							else{
								alert('가입된 회원 전화 번호입니다.')
							}						
						}
					})
				}
			}
		})
		
		let socialId = '${sessionScope.socialId}';
		function signUpUser(){
			$('#hiddenId').val($('#userId').val())
			$('#hiddenPwd').val($('#userPwd').val())
			$('#hiddenName').val($('#userName').val())
			$('#hiddenNick').val($('#nickName').val())
			$('#hiddenPhone').val($('#phone').val())
			$('#hiddenAreas').val($('#county').val())
			$('#hiddenSocialId').val(socialId)
			$('#userForm').submit();
		}
		
        
	</script>


</body>

</html>