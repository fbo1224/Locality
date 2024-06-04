<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리가게홍보</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>



	<style>
		.outer{
			width: 1200px;
			height: auto;
			margin: auto;
			padding-bottom: 50px;
			align:center;
		}
		.page-header{
			padding-top: 20px;
			font-size: 40px;
			font-weight: bold;
			border-bottom: 6px solid #5BBCFF;
			
		}
		#write{
			text-align: right;
			padding-right: 0%;
			margin-left: 10px;
			
		}
		.table{
			font-size: 18px;
		}
		#searchForm {
            width:80%;
            margin:auto;
			text-align:center;
        }
        #searchForm>* {
            float:left;
            margin-top:10px;
        }
        .btn-outline-info{
        	background-color:#FFD1E3; 
        	color:white;
        	border: 1px solid #FFD1E3;
        	font-weight: bold;
        
        }
        .select {width:12%;}
        .text {width:30%;}
        .searchBtn {width:10%;}	
        .search-area{
        	padding-left:28%;
			padding-bottom: 50px;
        	 	
        }
        .form-control{border : 1px solid #7EA1FF;}	
		.btn-secondary{
			border : 1px solid #7EA1FF;
			background-color:#7EA1FF;
		}
		.boardTopFive{
			padding-top : 20px;
		}
		.pagingArea{
			text-align : center;
			margin : auto;
		}
		#event_list{
			display:flex;
			flex-direction: row;
			gap: 2%;
			flex-wrap: wrap;
			margin-top: 30px;
			overflow: hidden;
			list-style-type: none;
		}
		#event_list > li{
			width: 300px;
			height: 400px;
			text-decoration: none;
			
		}

		#event_content>ul>li:hover {
			cursor: pointer;
			opacity: 2.8;
		}
		.img-area{
			width: 100%;
			height: 55%;
			border: 4px solid #FFFAB7;
			border-top-left-radius: 20px;
			border-top-right-radius: 20px;
		}
		.text-area{
			width: 100%;
			height: 35%;
			border: 4px solid #FFFAB7;
			border-bottom-left-radius: 20px;
			border-bottom-right-radius: 20px;
			color: black;
			background-color: #FFFAB7;
			font-size: 20px;
		}
		#titleImg{
			height: 100%;
			width: 100%;
			border-top-left-radius: 16px;
			border-top-right-radius: 16px;
		}
		.icon-area{
			width: 100%;
			height: 100px;
			display: flex;
			float: left;
			margin-bottom: 20px;
		}
		.icon-area > div{
			height: 100%;
			text-align: center;
			line-height: 100px;
		}
		.icon img{
			width: 70%;
			height: 70%;
		}
		.gap{width: 10%;}		
		.icon{width: 20%;}
		.img-area > img{
			width: 90%;
			height: 90%;
		}
		#pagingArea {width:fit-content; margin:auto;}
		
	</style>

</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer" >
		<div class="row">
		  <div class="col-lg-1">
		  </div>
			 <div class="col-lg-10">
				<div class="panel-body">
				<h2 class="page-header" align="left">우리가게 홍보</h2>
				<div class="icon-area"> 
					<div class="gap"></div>
					<div class="icon">
					  
						<a href="ad?areasNo=${ loginUser.areasCode }&category=10">
							<img src="resources/images/ad/10.png" alt="식당">
						</a>
					</div>
					<div class="icon">
						<a href="ad?areasNo=${ loginUser.areasCode }&category=20">
						<img src="resources/images/ad/20.png" alt="카페">
						</a>
					</div>
					<div class="icon">
						<a href="ad?areasNo=${ loginUser.areasCode }&category=30">
							<img src="resources/images/ad/30.png" alt="마트">
						</a>
					</div>
					<div class="icon">
						<a href="ad?areasNo=${ loginUser.areasCode }&category=40">
							<img src="resources/images/ad/40.png" alt="헬스장">
						</a>
					</div>
					<div class="icon">
						<a href="ad?areasNo=${ loginUser.areasCode }&category=50">
							<img src="resources/images/ad/50.png" alt="학원">
						</a>
					</div>
					<div class="icon">
						<a href="ad?areasNo=${ loginUser.areasCode }&category=60">
							<img src="resources/images/ad/60.png" alt="인테리어">
						</a>
					</div>
					<div class="icon">
						<a href="ad?areasNo=${ loginUser.areasCode }&category=70">
							<img src="resources/images/ad/70.png" alt="기타">
						</a>
					</div>

					<div class="gap"></div>
				</div>
				<div class="event_content">
					<ul id="event_list">
					   <c:choose>
					   	  <c:when test="${ empty list }">
							<li> 리스트가 존재하지 않습니다. </li>
					   	  </c:when>
					   	  <c:otherwise>
					   	   <c:forEach items="${ list }" var="board"> 	
							<li>
								<a class="adContent">
									<input type="hidden" value="${ board.adNo }"/>
									<div class="img-area">
										<c:choose>
											<c:when test="${ board.changeName == null }"> 
											  <img src="https://www.hotelrestaurant.co.kr/data/photos/20190727/art_15620260547027_2db631.jpg" id="titleImg"/>
											</c:when>
											<c:otherwise>
											  <img src="${ board.changeName }" id="titleImg"/>
											</c:otherwise>
										</c:choose>
								 	</div>
									<div class="text-area">
										<input type="hidden" value=""/>
										 <span> 업체명 : ${ board.adWriter }</span><br>
										 <span> 지역 : ${ board.countyName }</span><br>
										 <span> 카테고리 : ${ board.categoryName } </span><br>
									     <span style="font-size: 15px;">조회수 : ${ board.count } </span>
									</div>
								</a>
							</li>
							</c:forEach>
						 </c:otherwise>
					   </c:choose>
					</ul>
				</div>            
				</div>            
			 </div>
		  </div>
		  
		  <div id="pagingArea" align="center">
                <ul class="pagination" >
                	
                	<c:choose>
                      <c:when test="${ pi.currentPage eq 1 }">
                          <li class="page-item disabled"><a class="page-link" href="${ pi.currentPage - 1 }&category=${ category}" style="background-color:#FFD1E3; color:white">이전</a></li>
                       </c:when>
                       
                       <c:otherwise>
                          <li class="page-item">
                             <a class="page-link" href="ad?page=${ pi.currentPage - 1 }&areasNo=${ sessionScope.loginUser.areasCode }&category=${ category}" style="background-color:#FFD1E3; color:white">
                                	이전
                             </a>
                          </li>
                       </c:otherwise>
                    </c:choose>

                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                       <li class="page-item"><a class="page-link" href="ad?page=${p}&areasNo=${ sessionScope.loginUser.areasCode }&category=${ category}" style="background-color:#FFD1E3; color:white">${p}</a></li>
                    </c:forEach>
                       <li class="page-item"><a class="page-link" href="ad?page=${ pi.currentPage + 1 }&areasNo=${ sessionScope.loginUser.areasCode }&category=${ category}" style="background-color:#FFD1E3; color:white">다음</a></li>                   
                    	
                </ul>
            </div>
			
	    <div class="search-area" align="center">
			<form id="searchForm" action="search.do" method="get">
				<div class="select" align="center">
					<select class="custom-select" name="condition" style="background-color:#7EA1FF; color:white;">
						<option value="commuTitle">제목</option>
						<option value="categoryName">카테고리</option>
						<option value="nickName">작성자</option>
					</select>
				</div>
				<div class="text">
					<input type="text" class="form-control" name="keyword" placeholder="키워드 입력해주세요" >
					<input type="hidden" name="countyName" value="">
				</div>
					<button type="submit" class="searchBtn btn btn-secondary" style="background-color:#7EA1FF;">검색</button>

					<div id="write">	
						<a href="adEnrollForm" class="btn btn-info" style="background-color:#5BBCFF;">글쓰기</a>
					</div>
			</form>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
	
	
    <script>
       	$(function(){
           		
       		$('.adContent').click(function(){
            			
         			location.href = 'adDetail?adNo='+$(this).children().eq(0).val();
            			
       		})
       	});
       	
       	
       	
       	
    </script>

	
	
	
	

</body>
</html>