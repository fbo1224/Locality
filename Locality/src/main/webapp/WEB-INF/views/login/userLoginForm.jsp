<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body{
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
            color:#FFD1E3;
            line-height: 120px;
            font-size: 50px;
            font-weight: bold;
            text-shadow: 3px 3px 3px rgba(20, 17, 17, 0.678);
        }
        #login{
            margin: auto;
            padding-top: 260px;
            width: 800px;
            height: 800px;
            margin-top: 50px;
            margin-bottom: 100px;
            border: 1px solid white;
            border-radius: 10px;
            text-align: center;
            box-shadow: 3px 3px 3px rgb(145, 134, 134);
        }

        #sellerLogin, #userLogin{
            font-size: 40px;
            text-shadow: 2px 2px 2px rgb(26, 24, 24);
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
        #idText{
            margin-bottom: 18px;
        }
        #pwdText{
            margin-bottom: 10px;
        }
        #userId,#userPwd{
            width: 350px;
            height: 50px;
            border-radius: 7px;
            background-color: rgba(105, 97, 97, 0.541);
            color: white;
            padding-left: 15px;
        }
        #idCheck{   
            width: 330px;
            margin: auto;
            text-align: left;
            margin-bottom: 8px;
        }
        input::placeholder{
            color : white
        }
        #loginBtn{
            border: none;
            background-color: red;
            color: white;
            width: 350px;
            height: 45px;
            border-radius: 7px;
            font-weight: bold;
            font-size: 20px;
        }
        #searchLogin{
            margin: auto;
            width: 350px;
            height: 80px;
            color: rgb(156, 154, 154);
            line-height: 70px;
        }
        a{
            color: rgb(156, 154, 154);
        }
        a:hover{
            text-decoration: none;
            color: white;
        }
        #kakaoLogin>img:hover{
        	transform: scale(1.05);
  			transition-duration: 0.5s;
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
            <form action="loginConfirm" method="post">
                <div id="idText">
                <c:choose>
                	<c:when test="${ not empty cookie.userId }">
	                    <input type="text" id="userId" name="userId" value="${cookie.userId.value}" required placeholder="아이디">
                	</c:when>
                	<c:otherwise>
	                    <input type="text" id="userId" name="userId" required placeholder="아이디">
                	</c:otherwise>
                </c:choose>
                </div>
                <div id="pwdText">
                    <input type="password" id="userPwd" name="userPwd" required placeholder="비밀번호">
                </div>
                <div id="idCheck">
	                 <c:choose>
	                	<c:when test="${ not empty cookie.userId }">
		                    <input type="checkbox" id="check_btn" name="idChecked" checked>&nbsp;<label for="check_btn" style="color: rgb(151, 143, 143);">아이디저장</label>
	                	</c:when>
	                	<c:otherwise>
		                    <input type="checkbox" id="check_btn" name="idChecked">&nbsp;<label for="check_btn" style="color: rgb(151, 143, 143);">아이디저장</label>
	                	</c:otherwise>
	                </c:choose>
                </div>
                <button type="submit" id="loginBtn">로그인</button>
            </form>
            <div id="searchLogin">
                <a href="#">아이디 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">비밀번호 찾기</a>
            </div>
            <a id="kakaoLogin">
            	<img alt="카카오로그인" src="resources/images/kakao/kakao_login.png">
            </a>
            <br><br>
            <div>
                <a href="signUpForm">🌟회원가입🌟</a>
            </div>
        </div>

        <div id="footer">
            <div id="footer_1">
                <p id="p1">이웃사람들</p>
                <p id="p2">Copyright © 1998-2024 Locality Information Educational Institute All Right Reserved</p>
            </div>
        </div>

        <script>
            let check = document.getElementById('check_btn');

            check.addEventListener('change', function(){
                if(check.checked){
                    check.value = document.getElementById('userId').value;
                }
                else{
                    check.value = '';
                }
            })
        </script>
</body>
</html>