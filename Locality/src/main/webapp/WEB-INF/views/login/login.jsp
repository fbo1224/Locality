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
            color: white;
            line-height: 120px;
            font-size: 50px;
            font-weight: bold;
            text-shadow: 3px 3px 3px rgba(20, 17, 17, 0.678);
        }
        #login{
            margin: auto;
            width: 800px;
            height: 800px;
            margin-top: 50px;
            margin-bottom: 100px;
            border: 1px solid white;
            border-radius: 10px;
            text-align: center;
            box-shadow: 3px 3px 3px rgb(145, 134, 134);
        }
        button{
            position: relative;
            top: 20%;
            display: inline;
            margin-bottom: 100px;
            width: 430px;
            height: 150px;
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

    </style>
</head>

<body>

        <div id="logo">
            <p>Locality</p>
        </div>
        
        <div id="login">
            <button class="btn btn-danger" id="userLogin" onclick="user();">회원으로 시작하기</button>
            <button class="btn btn-danger" id="sellerLogin" onclick="biz()">사업자로 시작하기</button>
        </div>

        <div id="footer">
            <div id="footer_1">
                <p id="p1">이웃사람들</p>
                <p id="p2">Copyright © 1998-2024 Locality Information Educational Institute All Right Reserved</p>
            </div>
        </div>
        
        <script>
        	function user(){
        		location.href="userLoginForm";
        	}
        	function biz(){
        		location.href="bizLoginForm";
        	}
        	
        	
        </script>


</body>

</html>