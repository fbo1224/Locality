<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
#entire {
	height: 1000px;
}

#content {
	height: 912px;
	width: 100%;
	margin-left: 500px;
}

#content div {
	float: left;
}

#title {
	padding-top: 50px;
	padding-bottom: 75px;
	margin: 0 auto;
}

.componenets {
	width: 100%;
	height: 20%;
	;
}

.component>div {
	
}

#detail>div {
	height: 25%;
	width: 30%;
	margin-right: 12px;
	font-size: 12px;
}

.category_btn {
	width: 90%;
	border: none;
	border-radius: 9px;
	color: white;
}

.page-link {
	background-color: #FFFAB7;
	color: black;
}

#btn {
	background-color: #FFD1E3;
	height: 30px;
	width: 35px;
	border: 1px solid lightgray;
	border-radius: 5px;
}

.input select, input {
	border-radius: 5px;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div id="entire">

		<div id="title">
			<h3 align="center" style="font-weight: bolder;">소통 게시판</h3>
		</div>

		<div id="content" style="width: 920px; height: 80%;">
			<div class="input">
				<div id="first">
					<select style="height: 30px;" id="category">
						<option>카테고리</option>
						<option>일상공유</option>
						<option>묻고답해요</option>
						<option>소개합니다</option>
						<option>반려동물TIP</option>
					</select>
				</div>

				<div id="second" style="margin-left: 400px;">
					<select style="height: 30px;" id="search">
						<option id="title">제목</option>
						<option id="writer">작성자</option>
						<option id="content">내용</option>
					</select> <input type="text" id="keyword" style="width: 290px; margin-left: -5px; margin-right: -5px;"
						placeholder="키워드를 입력해주세요" />

					<button id="btn" onclick="findkeyword();">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
			         	<path
								d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
			        	</svg>
					</button>
				</div>


			</div>

			<div id="component"
				style="height: 75%; width: 100%; margin-top: 45px;">

				<div class="componenets" >

					<c:forEach items="${list}" var="AnimalBoard">
						
						<div style="width:100%; margin-top: 10px; border-top : 1px solid lightgray;"></div>
						<!-- image -->
						<div
							style="height: 85%; margin-top: 10px; width: 120px; border: 1px solid lightgray">
							이미지</div>


						<!-- title & text -->
						<div id=text
							style="height: 85%; margin-top: 10px; width: 360px; margin-left: 20px;">
							<!-- title -->
							<div style="height: 25%; width: 100%; font-weight: bolder;">${ AnimalBoard.title}</div>

							<!-- text -->
							<div
								style="height: 65%; width: 100%; margin-top: 10px; font-size: 12px;">
								<p>${ AnimalBoard.content }
								<p>
							</div>
						</div>

						<!-- 닉네임, 작성일, 카테고리란 -->
						<div id=detail
							style="height: 85%; margin-top: 10px; width: 390px; margin-left: 20px;">
							<div>${AnimalBoard.writer }</div>
							<div>${AnimalBoard.writeDate }</div>
							<div style="padding-left: 24px;">
								<button class="category_btn" style="background-color: #7EA1FF">${AnimalBoard.categoryName }</button>
							</div>

						</div>

					</c:forEach>

				</div>

<<<<<<< Updated upstream
				<div style="width: 100%; height: 80%; marin-top : 500px;" >
					<div class="container mt-3" style="width: 40%; margin-left: 30%; ">


						<ul class="pagination">
                     <c:choose>
                        <c:when test="${pageinfo.currentPage eq 1 }">
                           <li class="page-item disabled"><a class="page-link"
                              href="#" style="background-color: #FFFAB7">����</a></li>
                        </c:when>
                        <c:otherwise>
                           <a class="page-link"
                              href="boardList?page=${pageInfo.currentPage -1}"
                              style="background-color: #FFFAB7">����</a>
                        </c:otherwise>
                     </c:choose>

                     <c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="p">
                        <li class="page-item"><a class="page-link" href="boardList?page=${p }">${p }</a></li>
                     </c:forEach>
                     
                     <li class="page-item"><a class="page-link" href="boardList?page=${pageInfo.startPage }" style="background-color: #FFFAB7">����</a></li>
                  </ul>
=======
				

				</div>
				<div style="width: 100%; height: 15%">
					<div class="container mt-3" style="width: 40%; margin-left: 30%;">


						<ul class="pagination">
							<c:choose>
								<c:when test="${pageinfo.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#" style="background-color: #FFFAB7">이전</a></li>
								</c:when>
								<c:otherwise>
									<a class="page-link"
										href="boardList?page=${pageInfo.currentPage }"
										style="background-color: #FFFAB7"></a>
								</c:otherwise>
							</c:choose>

							<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="p">
								<li class="page-item"><a class="page-link" id="page" href="boardList?page=${p }">${p }</a></li>
							</c:forEach>
							
							<li class="page-item"><a class="page-link" href="#" style="background-color: #FFFAB7">다음</a></li>
						</ul>
>>>>>>> Stashed changes

					</div>
		</div>
			</div>

	</div>

	<jsp:include page="../common/footer.jsp" />


	<script> // 카테고리 선택시 값 바뀌는 기능 
			$('#category').change(()=>{
					const $category=$('#category').val();
					
			//		console.log($category);
			//		alert($category);
					
					location.href = 'keywordList?page=1&category='+$category;
				
			});
	
			
			// 검색 기능
			function findkeyword(){
			const $group = $('#search').val();
			const $keyword=$('#keyword').val();
		
			location.href = 'searchkeyword?category='+$group+'&keyword='+$keyword;
			
			}
	</script>
</body>
</html>