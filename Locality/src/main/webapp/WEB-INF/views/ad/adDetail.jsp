<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4bf92e3fff9b994d00a43bd988d6eb7d&libraries=services"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



<style>
	.outer{
		width: 1200px;
		height: auto;
		margin: auto;
		padding-bottom: 50px;
	}
    .content_outer{
        width: 90%;
        height: 1000px;
        margin-top: 50px;
        float: right;
    }
    .content_header{
        width: 100%;
        height: 80px;
        float: left;
    }
    .content_header>div{
        height: 100%;
        float: left;
        border-bottom: 4px solid #b1d6f3;
    }
    .content_header1{
        width: 10%;
        
        float: left;
        text-align: center;
        font-size: 30px;
        padding-top: 15px;
        font-weight: bold;
    }
    .content_header2{
        width: 90%;
        float: left;
        text-align: left;
        padding-left: 20px;
        font-size: 40px;
        padding-top: 10px;
        text-align: center;
        border-bottom: 4px solid #b1d6f3;
    }
    .content_sub{
        text-align: right;
        padding-right: 30px;
        
        
    }
    .content_sub1{
        opacity: 0.8;
    }
    .content_body{
        height: auto;
        padding-left: 50px;
        padding-top: 50px;
        border-bottom: 2px solid #b1d6f3;
        font-size: 20px;
        margin-bottom: 10px;
        
    }
    .page-header{
		padding-top: 20px;
		font-size: 40px;
		font-weight: bold;
		border-bottom: 6px solid #5BBCFF;
	}
	#title{
		background-color: aquamarine;
		font-size: large;
		font-weight: bolder;
	}
    .text-area{
        margin-bottom: 30px;
    }
    .content_btn{
        padding-top: 20px;
    	padding-bottom: 100px;
    }
    .content-footer{
        width: 1000px;
        height: 300px;
        border: 2px solid #6caddf;
        margin: auto;
    }
    #replyList{
        width: 100%;
		font-weight: 10%;
		font-style: normal;
		font-size: 15px;        

    }
    #textcount1{
    	padding-left: 10px;
    	padding-top: 10px;
    }
    .Info{
    	border : 2px solid #7EA1FF;
        border-radius: 2% #7EA1FF;
        box-shadow: 2px;
    	margin-bottom : 20px;
        width: 100%;
        height: 200px;
        display: flex;
        float: left;
    }
    .Info > div{

        height: 100%;
    }
    #map{
    	width: 40%;
    	border : 2px solid #7EA1FF;
    }
    .gap{width: 1%;}
    .biz-img{
    	width: 30%;
    	border : 2px solid #7EA1FF;
    }
    .biz-img > img{
        width: 100%;
        height: 100%;
    }
    .biz-info{
        width: 30%;
        padding-left: 5px;
        padding-top: 5px;
        border : 2px solid #7EA1FF;
    }
	.card{
        width: 100%;
        height: 100%;
    	
    }
    .card-body{
        padding-right: 10px;
        width: 100%;
    }
    .comu_like{
        width: 200px;
        height: 50px;
        text-align: left;
        float : left;
        font-size : 30px;
    }
	#blog-title{
		font-size : 25px;
		font-weight : bold;
	}
	.blog-area{
		margin-bottom : 15px;
	}
    
    
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
                    <h2 class="page-header" align="left">우리가게 소개</h2>
				</div> 
                    <div class="content_outer">
                        <div class="content_header"> 
                            
	                        <div class="content_header2"> ${ board.adTitle } </div>
		                        <input type="hidden" name="" value="">
		                        <input type="hidden" name="" value="">
                        </div>
                        <div class="content_sub">
                        <span class="content_sub1">작성일 : ${ board.enrollDate }</span> &nbsp;/&nbsp;
                        <span class="content_sub1" id="biz">작성자 : ${ board.adWriter }</span> &nbsp;/&nbsp;
                        <span class="content_sub1">조회수 : ${ board.count }</span>
                    </div>
                    <div class="content_body">
	
	                        <div class="img-area">
	                        <c:if test="${ board.changeName != null }">
	                              	<img width="100%" src="${ board.changeName }" />
							</c:if>	                              	
	                        </div>
   
                        <div class="text-area">	${ board.adContent } </div>
                    </div>
                    
                    <div id="blog-title">${ board.adWriter } 후기</div>
                    <div class="blog-area">
                       	 
                    </div>
                    
                    
					<div class="Info">
                        <div id="map">카카오 지도</div>
                        <div class="gap">
                            
                        </div>
                        <div class="biz-img">
                            <img src="https://www.hotelrestaurant.co.kr/data/photos/20190727/art_15620260547027_2db631.jpg">
                        </div>
                        <div class="biz-info">
                            <p>업체명 : ${ board.adWriter }</p>
                            <p>업종 : ${ board.categoryName }</p>
                            <p>연락처 : ${ board.bizCall }</p><br>
                            &nbsp;&nbsp;<a href="#" class="btn btn-success">미니홈페이지 놀러가기</a>

                        </div>
					</div>

                    <div class="content_btn" align="center">
                        <a href="ad?areasNo=${ sessionScope.loginUser.areasCode }&category=0" class="btn btn-sm btn-info">목&nbsp;록</a>

                      	<a  class="btn btn-sm btn-secondary" onclick="postSubmit(0)">수&nbsp;정</a>
                       	<a  class="btn btn-sm btn-danger" onclick="postSubmit(1)">삭&nbsp;제</a>

                       	<form action="" id="postForm" method="post">
                       		<input type="hidden" name="adNo" value="${ board.adNo }"/>
                       		<input type="hidden" name="areasNo" value="${ sessionScope.loginUser.areasCode }"/>
                       		<input type="hidden" name="filePath" value="${ board.changeName }"/>
                       		
                       	</form>
                    </div>
                </div>
				</div>            
			 </div>
		  </div>
		  
		  
	<script>
		function postSubmit(num){
			
			if(num == 0){
				$('#postForm').attr('action', 'adUpdate.do').submit();
			} 
			else{
				$('#postForm').attr('action', 'adDelete').submit();
			}
			
		}
	
	</script>
	
	<script>
	// 카카오지도 api
		var mapContainer = document.getElementById('map'),  
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), 
		        level: 2 
		    };  
		
	    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
	
		var geocoder = new kakao.maps.services.Geocoder();
		
	
		geocoder.addressSearch('${board.bizAddress}', function(result, status) {
	
	 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${board.adWriter}</div>'
	        });
	        infowindow.open(map, marker);
	
	        map.setCenter(coords);
		    } 
		});    
	</script>
	<script>
	// 블로그 후기 api
	$(function(){
			

			$.ajax({
				url : 'adBlog',
				data : {
					start : 5,
					biz : '${ board.adWriter }'
					},
				type : 'get',
				success : data => {
					const item = data.items;
					let text = '';
					
					for(let i in item){
						text += '<a href="'+ item[i].link + '" >'+ item[i].title + '</a><br>';
					}
					$('.blog-area').html(text);
				}
			});
					
	
	});
	

	</script>	

		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
</body>
</html>