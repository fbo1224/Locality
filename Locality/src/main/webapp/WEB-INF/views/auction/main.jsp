<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- JS -->
 <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<style>
    /*div{box-shadow: 0 0 0 1px red;}*/

    #wrap{
        margin: auto;
        width: 100%;
        height: auto;
        position: relative;
    }

    #ct{
        margin: auto;
        width: 1200px;
        height: 2500px;
        
    }

    #photo{
        margin-top: 150px;
        width: 100%;
        height: 500px;
    }

    #header{
        width: 100%;
        height: 300px;
        position: relative;
    }

    #header > form{text-align: center;}

    #title{width: 100%; height: 50px; border-bottom:1px solid black;}

    .product{
        float: left;
        width: 25%;
        height: 500px;
    }

    .pd_photo{width: 100%; height: 300px;}
    .pd_title{width: 100%; height: 100px; font-size:20px; font-weight:bold; padding-top:20px;}
    .pd_auc{float: left; width: 50%; height: 50px;}
    .pd_count{float: left; width: 50%; height: 50px;}
    .pd_date{width: 100%; height: 50px;}

    a{color: black; text-decoration: none;}

    .product{
        box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
        text-align:center;
    }

    .product:hover{box-shadow: 0 30px 30px rgba(0,0,0,0.25), 0 30px 30px rgba(0,0,0,0.22);}
    
    #search{
        height: 30px;
        width: 500px;
        background: #ffffff;
        margin: auto;
        bottom: 0px;
        position: absolute;
        left: 40%;
        margin-left: -130px; 
    }

    #search > form > select{border-radius: 10px; width: 80px;}

    #search > form > input{
        font-size: 16px;
        width: 325px;
        height: 50px;
        border-radius: 10px;
        margin-left: 100px;
    }
    
    #search > form > button{
        width: 50px;
        height: 50px;
        border: 0px;
        float: right;
        border-radius: 10px;
        border: 1px solid black;
        font-weight:bold;
    }

    #search > form > button:hover{background-color: black; color: white;}
	
	.product > div > img{width : 100%; height : 100%;}
	
	#topBtn { 
		width:50px;
		height: 30px;
		text-align:center;
		position: fixed;
		right: 50px; 
		bottom: 50px; 
		display: none;
		cursor: pointer;
		background-color:black;
		color:white;
		border-radius:10px;
		font-size:20px;
		font-weight:bold;
	}

    .more{
        position: absolute;
        bottom: 100px;
        left: 50%;
    }
    
    
    
    


</style>

</head>
<body>
    
	<jsp:include page="../common/header.jsp" />

    <div id="photo">
        <img src="https://www.kobay.co.kr/imgDown.do?Rname=pc1.jpg&name=B2KY5CZJSPZ9&path=BANNER" alt="" style="width: 100%; height: 100%;">
    </div>
    
    
    
    

    <div id="header">
        <div id="search">
            <form action="search.do" method="get">
                <input type="text" name="keyword" placeholder="상품명 입력" value="${ keyword }" required />
                <input type="hidden" name="field" value="${ field }" />
                <button type="submit">검색</button>
            </form>
        </div>
    </div>

    <div id="wrap">
        <div id="ct">
            <div class="title">
                <div><h1 id="pd_title">전체 상품</h1></div>
                <div>
                	<a href="filter.do?field=all">전체보기</a>
                	<a href="filter.do?field=bid">인기순</a>
                	<a href="filter.do?field=cnt">조회순</a>
                	<a href="filter.do?field=low">가격 낮은 순</a>
                </div>
            </div>
            
            <div id="product">
				<c:forEach items="${ list }" var="product" end="7">
					<div class="product">
						<input type="hidden" value="${ product.auctionNo }">
						<div class="pd_photo"><img src="${ product.imgPath }" alt="상품"></div>
						<div class="pd_title">${ product.pdName }</div>
						<div class="pd_auc">현재가:  ${ product.startPrice }원 <br> 입찰단위 : ${ product.bidUnit }원</div>
						<div class="pd_count">조회수: ${ product.pdCnt }회 <br> 입찰수: ${ product.bidCnt }건</div>
					</div>
				</c:forEach>
			</div>
            
            <script>
            	
	            // 리스트 뿌리기
	        	$(() => {
	        		$pdTitle = $('#pd_title');
        			if(${ value eq 'low' }){
        				$pdTitle.text('가격 낮은 순서 상품');
        			} 
        			else if (${ value eq 'bid' }){
        				$pdTitle.text('인기순 상품');	
        			}
        			else if(${ value  eq 'cnt' }){
        				$pdTitle.text('높은 조회 상품');
        			}
        			else{
        				$pdTitle.text('전체 상품');
        			}
	        	})
            	
	            // 상세페이지로 이동
	            $(() => {
	                $('#product > div').click(function() {
	                    location.href = 'detail.auction?auctionNo=' + $(this).children('input[type="hidden"]').val();
	                });
	            });
	            
	            
	            $(() => { 
	            	$(window).scroll(function() {
	                if ($(this).scrollTop() > 250) { 
	                  $('#topBtn').fadeIn();
	                } else {
	                  $('#topBtn').fadeOut();
	                }
	              }); 
	            	
	              $("#topBtn").click(function() { 
	              	$('html, body').animate({ scrollTop : 0
	              	}, 500);
	              	return false; 
	              }); 
	            });
	            /*
	            $(() => {
	            	$('.more').click(function(){
	            		$('.more').remove();
		            	$('#product').append('<c:forEach items="${ list }" var="product" end="15">'
	                                   + '<div class="product">'
                	                   + '<input type="hidden" value="${ product.auctionNo }">'
                                       + '<div class="pd_photo"><img src="${ product.imgPath }" alt="상품"></div>'
                                       + '<div class="pd_title">${ product.pdName }</div>'
                                       + '<div class="pd_auc">시작가:  ${ product.startPrice } <br> 입찰단위 : ${ product.bidUnit }</div>'
                                       + '<div class="pd_count">조회수: ${ product.pdCnt } <br> 입찰수: ${ product.bidCnt }</div>'
                                       + '<div class="pd_date">남은날짜 ${ product.createDate }</div>'
                                       + '</div>'
			                           + '</c:forEach>'
			                           + '<a class="more">더보기</a>'
			                           );
                 		});
	            	});*/
	            /*
	            function moreList(){
	            	var startNum = $('.product').length;		
            		var addListHtml = "";
            		console.log(startNum);
            		
            		$.ajax({
            			
            			url : 'more.do',
            			data : {
            				startNum = startNum;
            				value = '${ value }',
            			},
            			success : 
            				console.log(${value});
            	}*/
            	
	            	
            </script>

        </div>
        <button id="addBtn" onclick="moreList();">더보기</button>
        <a id="topBtn" >TOP</a>
        
        
    </div>
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>