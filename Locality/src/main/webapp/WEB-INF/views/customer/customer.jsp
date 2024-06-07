<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Customer</title>
	
<style>
	/*div{box-shadow: 0 0 0 1px red;}*/
	#wrap{width:auto; height:auto;}
	#content{width:1200px; height:1000px; margin: auto;}
	
	#map, #roadview{margin:auto;}


	.customer > p{
		padding-top: 35px;
		font-size: 30px;
		font-weight: bold;
		height: 100px; 
		width:100%; 
	}

	#pagingArea{
		position: relative;
	}
	.pagination{
		position: absolute;
		left: 40%;
	}
	
	
</style>
	
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div id="wrap">
		<div id="content">
			<div class="customer">
				<p>${ loginUser.countyName } 명소 안내</p>
			</div>
			
		<div id="map" style="width:1000px;height:400px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f26dbd5f041eb40ea5e3887f4af9046&libraries=services"></script>
		<script>
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(); 
			
			// 키워드로 장소를 검색합니다
			ps.keywordSearch('${ loginUser.countyName }', placesSearchCB); 
			
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new kakao.maps.LatLngBounds();
			
			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);    
			            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			        }       
			
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}
			
			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(place.y, place.x) 
			    });
			
			    // 마커에 클릭이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			
			
			
		</script>

			<div class="customer">
				<p>공지사항</p>
			</div>

			<div class="container">
				<table id="boardList" class="table table-hover">
					<thead>
						<tr>
	                        <th>글번호</th>
	                        <th>제목</th>
	                        <th>작성일</th>
	                        <th>조회수</th>
	                        <th>작성일자</th>
						</tr>
					</thead>
					
					<tbody>
					
						<c:forEach items="${ list }" var="notice">
							<tr>
								<td>${ notice.noticeNo }</td>
							 	<td>${ notice.noticeTitle }</td>
							 	<td>${ notice.noticeContent }</td>
								<td>${ notice.count }</td>
								<td>${ notice.createDate }</td>
							</tr>
						</c:forEach>
					
					</tbody>
				</table>
				
				<script>
				
					$(function(){
						$('#boardList > tbody > tr').click(function(){
							location.href='detail.notice?noticeNo='+$(this).children().eq(0).text();
						});
						
						
					})
				</script>
			</div>

			<div id="pagingArea">
				<ul class="pagination">
                	
	                <c:choose>
	                    <c:when test="${ pageInfo.currentPage > 1 }">
	                    	<li class="page-item">
		                    	<a class="page-link" href="customer?page=${ pageInfo.currentPage - 1 }">
		                    		이전
		                    	</a>
	                    	</li>
	                    </c:when>
                    </c:choose>
                    
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
                    	<li class="page-item"><a class="page-link" href="customer?page=${p}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    
                    	<c:when test="${ pageInfo.currentPage ne pageInfo.endPage }">
	                    	<li class="page-item"><a class="page-link" href="customer?page=${ pageInfo.currentPage + 1 }">다음</a></li>
	                    </c:when>
	                    
                    </c:choose>
                    
                    
                </ul>
            </div>
            

		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>