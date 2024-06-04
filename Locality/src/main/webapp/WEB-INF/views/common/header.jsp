<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<head>
    <style>
        #navi{
            width: auto;
            height: 100px;
            margin: auto;
        }
        

        #logo > p{
            font-size: 45px; 
            font-weight: bold;
            margin: 0;
        }

            
        #logo{
            width: 100%;
            height: 70px;
            margin: auto;
            justify-content: center; 
            text-align: center;
            line-height: 30px;
        }

        #logout{
            text-align: right;
            margin: auto;
            width: 1200px;
            height: 30px;
        }

        #logout > a{
            color: black;
            text-decoration: none;
            margin-left: 10px;
        }

        .subMenu{
            padding-left: 0;
        }

        .lnb a:hover {
            text-decoration: none;
        }

        .lnb{
            border-bottom: 1px solid black;
            margin-bottom: 20px;
        }

        .lnb li {
            list-style-type: none;
            margin-right:20px; 
        }

        /*.lnb{border-top: 1px solid d7e2ff;}*/

        .lnb>ul {
            display: flex;
            justify-content: center;
            text-align: center;
            
        }
        .lnb a {display: block;
                width: 150px; height: 40px; text-align: center; line-height: 40px; background-color: #ffffff;
                color: black;
                font-weight: bold;
                
        }
        #logo > span{
            position: relative;
            left: 90px;
        }

        .subMenu { display: none; position: absolute;}
        .lnb>ul>li:hover .subMenu {display: block; }
        .lnb>ul>li:hover>a{ background-color: #d7e2ff;}
        .subMenu a:hover { background-color: #d7e2ff;}
    </style>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${ alertMsg }');
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

    <div id="navi">
        <div id="logout">
        	<a href="myPage">마이페이지</a>
            <a href="customer">고객센터</a>
            <a href="logout">로그아웃</a>
        </div>
        <div id="logo">
            <p>Locality</p>
        </div>
    </div>

	

    <div class="lnb">
        <ul>
            <li><a href="auction">경매</a>
                <ul class="subMenu">
                    <li><a href="insert.page">경매등록</a></li>
                    <li><a href="auction.result?userNo=${ loginUser.userNo }">입찰진행</a></li>
                    <li><a href="save.list?userNo=${ loginUser.userNo }">장바구니</a></li>
                </ul>
            </li>
             <li><a href="main">반려동물</a>
                <ul class="subMenu">
                    <li><a href="boardList">소통게시판</a></li>
                    <li><a href="hospital">편의시설안내</a></li>
                </ul>
            </li>
            <li><a href="commu?areasNo=${ loginUser.areasCode }">함께해요</a></li>
            <li><a href="ad?areasNo=${ loginUser.areasCode }&category=0">우리가게홍보</a></li>
        </ul>
    </div>
</body>
</html>