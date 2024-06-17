<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#updateUser {
	width: 500px;
	margin: auto;
	height: auto;
}

#updateUser div {
	width: 100%;
	margin: auto;
}

.input {
	width: 100%;
	height: 45px;
	margin-bottom: 25px;
	padding-left: 20px;
	background-color: rgba(165, 147, 147, 0.548);
	border: none;
	color: rgb(124, 25, 25);
}

.input::placeholder {
	color: rgb(124, 25, 25);
}

#selectBox {
	height: 100px;
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

#selectBox>p {
	margin: 0;
	font-size: 15px;
	font-weight: bold;
}

#address>p {
	margin: 0;
	font-size: 15px;
	font-weight: bold;
}

#updateLogo>p {
	font-size: 25px;
	font-weight: bold;
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

#address>input {
	width: 100%;
}

#buttonBox {
	text-align: center;
	height: 200px;
	line-height: 150px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div id="updateUser">

        <div id="updateLogo">
            <p>개인 정보 수정</p>
        </div>


    <form action="updateUser" method="post" id="userForm">
		<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
        <div>
            <input type="text" name="userId" id="userId" class="input" value="${sessionScope.loginUser.userId }" disabled>
        </div>
        <div>
            <input type="text" name="userName" class="input" value="${sessionScope.loginUser.userName }" disabled placeholder="이름">
        </div>
        <div>
            <input type="text" id="nickName" class="input" value="${sessionScope.loginUser.nickName }" required placeholder="닉네임">
			<input type="hidden" id="hiddenNick" name="nickName">
        </div>
        <div>
            <input type="text" id="phone" class="input" value="${sessionScope.loginUser.phone }" required placeholder="휴대폰번호">
			<input type="hidden" id="hiddenPhone" name="phone">
        </div>
		<input type="hidden" id="hiddenAreas" name="areasCode">
		<input type="hidden" id="hiddenAddress" name="address">
		<input type="hidden" id="hiddenDetail" name="detailedAddress">
        <div id="selectBox">
            <p>{ 거주지 }</p>
            <select id="city">
                <option value="11">서울특별시</option>
                <option value="21">부산광역시</option>
                <option value="22">대구광역시</option>
                <option value="23">인천광역시</option>
                <option value="24">광주광역시</option>
                <option value="25">대전광역시</option>
                <option value="26">울산광역시</option>
                <option value="29">세종특별자치시</option>
                <option value="31">경기도</option>
                <option value="32">강원도</option>
                <option value="33">충청북도</option>
                <option value="34">충청남도</option>
                <option value="35">전라북도</option>
                <option value="36">전라남도</option>
                <option value="37">경상북도</option>
                <option value="38">경상남도</option>
                <option value="39">제주특별자치도</option>
            </select> 
            <select id="county">
            
            </select>
        </div>
        <div id="address">
            <p>{ 상세 주소 }</p>
            <button onclick="sample6_execDaumPostcode()" class="btn btn-sm btn-danger">주소 찾기</button><br>
            <input type="text" id="sample6_address" value="${sessionScope.loginUser.address }" placeholder="주소" required><br>
            <input type="text" id="sample6_detailAddress" value="${sessionScope.loginUser.detailedAddress }" placeholder="상세주소" required>
        </div>
        
        <div id="buttonBox">
            <button class="btn btn-sm btn-secondary" onclick="history.back()">취소</button>&nbsp;
            <button class="btn btn-sm btn-danger" onclick="updateUser();;">확인</button>
        </div>
	</form>
    </div>
    
    
    
    <script>
    	document.getElementById('city').value = ${sessionScope.loginUser.cityCode}
    	function back(){
    		location.href='myPage';
    	}
    	
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
    	
	    let userCountyName = '${sessionScope.loginUser.countyName}';
		$(document).ready( () => {
			$.ajax({
				url: 'signUp/' + $('#city').val() ,
				type: 'get',
				success: city =>{
					let option = city.data.map(data=>{
						
						if(data.countyName !== userCountyName){
							return '<option value="'+ data.areasCode +'">* '+ data.countyName +'</option>'
						}
						else{
							return '<option value="'+ data.areasCode +'" selected>* '+ data.countyName +'</option>'
						}
					}); 
					
					$('#county').html(option);					
				}
			})
		})
		
    	$('#city').click(function() {
			$.ajax({
				url: 'signUp/' + $(this).val(),
				type: 'get',
				success: city =>{
					let option = city.data.map(data =>{
						return '<option value="'+ data.areasCode +'">* '+ data.countyName +'</option>'
					}) 
					$('#county').html(option);					
				}
			})
		})
		
		const regPhone = /^(01[0|1|6|7|8|9])(?!-)([0-9]{3,4})(?!-)([0-9]{4})$/;
		let originPhone = '${sessionScope.loginUser.phone }';
		function updateUser(){
				if(!regPhone.test($('#phone').val()) || $('#phone').val().length < 10){
					alert('올바르지 않은 전화번호 형식 입니다. 다시 입력해주세요')
				}
				else{
					$.ajax({
						url: 'singUp/' + $('#nickName').val() +'/'+$('#phone').val() ,
						type: 'get',
						success: confirm =>{
							if(confirm.data === 'okay'){
								updateUser();
							}
							else if(confirm.data === 'nickName'){
								alert('이미 사용중인 닉네임 입니다. 변경해주세요')
							}
							else{
								if(originPhone.data === $('#phone').val()){
									updateUser();
								}
								else{
									alert('가입된 회원 전화 번호입니다.')
								}
							}						
						}
					})
				}	
		}
		function updateUser(){
			$('#hiddenNick').val($('#nickName').val())
			$('#hiddenPhone').val($('#phone').val())
			$('#hiddenAreas').val($('#county').val())
			$('#hiddenAddress').val($('#sample6_address').val())
			$('#hiddenDetail').val($('#sample6_detailAddress').val())
			$('#userForm').submit();
		}
    </script>
    
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                       
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>