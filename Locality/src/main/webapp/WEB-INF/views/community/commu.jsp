<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Locality 커뮤니티</title>

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
				<h2 class="page-header" align="left">함께해요</h2>
					<div class="boardTopFive">
						<h3>▷ 인기 게시글</h3>
						<div>
							<ol>
								<li><a href="#">인기인기인기1111111</a></li>

							</ol>
						</div>
					</div>

					

				
				   <table class="table table-bordered table-hover" style="margin-top:30px; border-radius: 5px;">
				   
						<tr style="background-color: #FFFAB7; margin-top: 0; height: 40px; color: black; opacity: 0.8">
							<th style="width: 5%; text-align:center">No</th>
							<th style="width: 10%; text-align:center">지역</th>
							<th style="width: 10%; text-align:center">카테고리</th>
							<th style="width: 30%; text-align:center">제목</th>
							<th style="width: 10%; text-align:center">작성자</th>
							<th style="width: 15%; text-align:center">작성일</th>
							<th style="width: 10%; text-align:center">조회수</th>
							<th style="width: 10%; text-align:center">첨부파일</th>
						</tr>
	
							<c:forEach items="${ list }" var="board">
								<tr class="commu_list">
									<td style="text-align:center">${ board.commuNo }</td>
									<td style="text-align:center">${ board.sidoName }</td>
									<td style="text-align:center">${ board.category }</td>
									<td>${ board.commuTitle }</td>
									<td style="text-align:center">${ board.commuWriter }</td>
									<td style="text-align:center">${ board.enrollDate }</td>
									<td style="text-align:center">${ board.count }</td>
									<td style="text-align:center">
										<c:if test="${ not empty board.originName }"> ㅇ	</c:if>	
									</td>
								</tr>
							</c:forEach>
		
				   </table>               
				</div>            
			 </div>
		  </div>
		  <div id="pagingArea" align="center">
                <ul class="pagination" >
                	
                	<c:choose>
                      <c:when test="${ pageInfo.currentPage eq 1 }">
                          <li class="page-item disabled"><a class="page-link" href="${ pageInfo.currentPage - 1 }" style="background-color:#FFD1E3; color:white">이전</a></li>
                       </c:when>
                       
                       <c:otherwise>
                          <li class="page-item">
                             <a class="page-link" href="commu?page=${ pageInfo.currentPage - 1 }&areasNo=${sessionScope.loginUser.areasCode}" style="background-color:#FFD1E3; color:white">
                                	이전
                             </a>
                          </li>
                       </c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
                       <li class="page-item"><a class="page-link" href="commu?page=${p}&areasNo=${sessionScope.loginUser.areasCode}" style="background-color:#FFD1E3; color:white">${p}</a></li>
                    </c:forEach>
                       <li class="page-item"><a class="page-link" href="commu?page=${ pageInfo.currentPage + 1 }&areasNo=${sessionScope.loginUser.areasCode}" style="background-color:#FFD1E3; color:white">Next</a></li>
                </ul>
            </div>

	    <div class="search-area" align="center">
			<form id="searchForm" action="commuSearch" method="get">
				<div class="select" align="center">
					<select class="custom-select" name="condition" style="background-color:#7EA1FF; color:white;">
						<option value="commuTitle">제목</option>
						<option value="categoryName">카테고리</option>
						<option value="nickName">작성자</option>
					</select>
				</div>
				<div class="text">
					<input type="text" class="form-control" name="keyword" placeholder="키워드 입력해주세요" >
					<input type="hidden" name="countyName" value="${ sessionScope.loginUser.countyName }">
				</div>
					<button type="submit" class="searchBtn btn btn-secondary" style="background-color:#7EA1FF;">검색</button>

					<div id="write">	
						<a href="commu.enrollForm" class="btn btn-info" style="background-color:#5BBCFF;">글쓰기</a>
					</div>
			</form>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
	
	
	
	
	
    <script>
       	$(function(){
           		
       		$('.commu_list').click(function(){
            			
         			location.href = 'commudetail?commuNo='+$(this).children().eq(0).text();
            			
       		})
       	})            
    </script>
	
</body>
</html>