<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        #main {
            width: 1000px;
            height: 100%;
            margin: auto;
            height: auto;
            position: relative;
        }

        #mainImg {
            width: 100%;
            height: 800px;
            background-image: url(https://images.unsplash.com/photo-1535189043414-47a3c49a0bed?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTJ8fCVFRCU5NSU5QyVFQSVCNSVBRHxlbnwwfDB8MHx8fDA%3D);
            background-size: cover;
            background-position: center;
            position: relative;
        }

        #mainImg::after {
            content: "";
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 40%;
            background: linear-gradient(to bottom, rgba(109, 101, 101, 0), rgb(17, 17, 17));
        }

        #serve {
            overflow: hidden;
            margin: auto;
            height: auto;
            position: relative;
            width: 100%;
            background-color: black;
            background: linear-gradient(to top, rgba(12, 11, 11, 0.788), rgb(12, 11, 11));
        }

        #logo {
            text-align: center;
        }

        #logo>p {
            padding-top: 25px;
            color: white;
            width: 1000px;
            height: 100px;
            margin-bottom: 0;
            line-height: 80px;
            font-size: 50px;
            font-weight: bold;
            text-shadow: 3px 3px 3px rgba(20, 17, 17, 0.678);
        }

        #login {
            height: 300px;
            width: 1000px;
            margin: auto;
            padding-top: 180px;
            margin-bottom: 500px;
            text-align: center;
            border-radius: 10px;
        }

        #login>p {
            margin: 0;
            height: 130px;
            font-size: 35px;
            color: rgb(255, 255, 255);
            text-shadow: 5px 5px 5px rgb(12, 12, 12);
            font-weight: bold;
            display: block;
        }

        #login button {
            width: 180px;
            height: 70px;
            font-size: 25px;
            font-weight: bold;
            color: rgb(226, 221, 221);
            text-shadow: 3px 3px 3px rgba(0, 0, 0, 0.726);
            box-shadow: 3px 3px 3px rgb(48, 31, 31);
            border-radius: 10px;
            margin: 0 10px auto;
        }

        .locality {
            margin: 30px auto;
            padding-top: 30px;
            width: 1100px;
            height: 550px;
            color: rgb(133, 125, 125);
            text-align: center;
            border-radius: 20px;
            border-top: 1px solid rgba(192, 178, 178, 0.726);
            border-bottom: 1px solid rgba(192, 178, 178, 0.726);
        }

        .locality>p {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .locality>img {
            width: 1000px;
            height: 400px;
            display: block;
            margin: 0 auto;
            border-radius: 15px;
            box-shadow: 5px 5px 10px rgba(168, 124, 124, 0.493);
        }

        #content {
            margin: auto;
            width: 1000px;
            text-align: center;
            color: rgb(184, 178, 178);
            padding: 20px;
            border-radius: 10px;
        }

        #title>b {
            font-size: 20px;
        }

        .q {
            font-weight: bold;
            font-size: 20px;
            margin-top: 20px;
        }

        .a {
            display: none;
            font-size: 18px;
            margin-bottom: 20px;
            margin-top: 10px;
        }

        .line {
            border-top: 2px solid #eddfdf99;
            margin-top: 20px;
        }

        #footer {
            height: auto;
        }

        #footer_1 {
            width: 100%;
            height: 300px;
            background-color: black;
            border-top: 5px solid rgba(100, 98, 98, 0.308);
            background: linear-gradient(to bottom, rgba(12, 11, 11, 0.788), rgb(12, 11, 11));
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

        .fa-chevron-down {
            margin-left: 10px;
            transition: transform 0.3s ease;
        }

        .rotate {
            transform: rotate(180deg);
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


    <div id="mainImg">
        <div id="main">
            <div id="logo">
                <p>Locality</p>
            </div>
            <div id="login">
                <p>지금 바로 주변 친구들과 <br> 소통해보세요</p>
                <div class="button-container">
                    <button type="button" class="btn btn-danger" onclick="login();">Login</button>
                </div>
            </div>
        </div>
    </div>
    <div id="serve">
        <div class="locality">
            <p>나혼자만 알기엔 아까운 것들을 <br>친구들과 공유해보세요!!</p>
            <img src="https://images.unsplash.com/photo-1455734729978-db1ae4f687fc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njh8fCVFQyVBNyU4MCVFQyU5NyVBRCUyMCVFQyVCQiVBNCVFQiVBRSVBNCVFQiU4QiU4OCVFRCU4QiVCMHxlbnwwfDB8MHx8fDA%3D"alt="">
        </div>
        <div class="locality">
            <p>Locality를 통해 지역주민들에게 <br> 가게를 홍보해보세요!!</p>
            <img src="https://images.unsplash.com/photo-1472851294608-062f824d29cc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8JUVDJTk4JUE4JUVCJTlEJUJDJUVDJTlEJUI4JTIwJUVDJTgzJTgxJUVDJUEwJTkwfGVufDB8MHwwfHx8MA%3D%3D"alt="">
        </div>
        <div class="locality">
            <p>안 쓰는 물건들을 경매를 통해 <br> 판매해보세요!!</p>
            <img src="https://media.istockphoto.com/id/478407348/ko/%EC%82%AC%EC%A7%84/%EA%B2%BD%EB%A7%A4-%EA%B5%B0%EC%A4%91.webp?b=1&s=170667a&w=0&k=20&c=rQqTboUsJLz5AlbzOqJcn6qAeyRBN9TzINUZhk22R_E="alt="">
        </div>
        <div class="locality">
            <p>우리동네 귀여운 반려동물들의 이야기를 들어보세요. </p>
            <img src="https://images.unsplash.com/photo-1494947665470-20322015e3a8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8JUVDJTk1JUEwJUVDJTk5JTg0JUVBJUIyJUFDfGVufDB8MHwwfHx8MA%3D%3D"alt="">
        </div>
        <div id="content">
            <div id="title"><b>자주 찾는 질문</b></div>
            <div class="q">Q. [회원] 비회원으로 이용할 수 없나요?<i class="fas fa-chevron-down"></i></div>
            <p class="a">A. 회원만 이용가능하기 때문에 양해부탁드립니다.</p>
            <div class="line"></div>
            <div class="q">Q. [회원] 회원탈퇴는 어디서 할 수 있나요?<i class="fas fa-chevron-down"></i></div>
            <p class="a">A: 마이페이지에 개인정보 수정페이지에서 가능합니다. </p>
            <div class="line"></div>
            <div class="q">Q. [회원] 회원탈퇴는 어디서 할 수 있나요?<i class="fas fa-chevron-down"></i></div>
            <p class="a">A: 마이페이지에 개인정보 수정페이지에서 가능합니다. </p>
            <div class="line"></div>
            <div class="q">Q. [회원] 회원탈퇴는 어디서 할 수 있나요?<i class="fas fa-chevron-down"></i></div>
            <p class="a">A: 마이페이지에 개인정보 수정페이지에서 가능합니다. </p>
            <div class="line"></div>
            <div class="q">Q. [회원] 회원탈퇴는 어디서 할 수 있나요?<i class="fas fa-chevron-down"></i></div>
            <p class="a">A: 마이페이지에 개인정보 수정페이지에서 가능합니다. </p>
            <div class="line"></div>
            <div class="q">Q. [회원] 회원탈퇴는 어디서 할 수 있나요?<i class="fas fa-chevron-down"></i></div>
            <p class="a">A: 마이페이지에 개인정보 수정페이지에서 가능합니다. </p>
            <div class="line"></div>
        </div>
    </div>

    <div id="footer">
        <div id="footer_1">
            <p id="p1">이웃사람들</p>
            <p id="p2">Copyright © 1998-2024 Asihana Information Educational Institute All Right Reserved</p>
        </div>
    </div>

    <script>
        $('.q').click(function() {
            let answer = $(this).next();
            answer.toggle();
            $(this).find('.fa-chevron-down').toggleClass('rotate');
        });
        
        function login(){
        	location.href="loginForm";
        }
        
    </script>
</body>
</html>