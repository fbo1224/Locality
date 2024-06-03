<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입찰진행</title>
<style>
	/*div{box-shadow: 0 0 0 1px red;}*/
		
	#wrap{
        margin: auto;
        width: 100%;
        height: auto;
    }

    #ct{
        margin: auto;
        width: 1200px;
        height: auto;
    }
    
        }
    #wrap{
    	width: 1200px;
        height: auto;
        margin: auto;
    }
    #content_title{
        margin-top : 20px;
        text-align: center;
        font-size: 50px;
        font-weight: bold;
        color: black;
    }
    .info{
        width: 600px;
        height: 200px;
        margin: auto;
        margin-top: 30px;
        border: outset;
        border-radius: 10px;
        position:relative;
    }
    
    .info:hover{border: 3px solid orangered;}
    #img{
        width: 25%;
        float: left;
    }
    #img > img{
        border-radius: 10px;
        width: 200px;
        height: 195px;
    }

    #detail{
        margin-left: 250px;
    }
    #detail > p{
        font-size: 15px;
    }
    #detail > span{
        font-weight: bold;
        font-size: 20px;
    }
    .cancel{
    	position:absolute;
    	background-color:#ffffff;
    	color:red;
    	border:1px solid red;
    	width:50px;
    	right:20px;
    	bottom:20px;
    }
    .cancel:hover{
    	color:#ffffff;
    	background-color:red;
    }
    #foot{height:150px;}
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
		<div id="wrap">
        	<div id="content_title">
            	<span>입찰진행</span>
			</div>
    	<c:choose>
    	<c:when test="${ empty list }">
    		<div style="height:200px;"></div>
    		<h1 align="center">입찰중인 상품이 존재하지 않습니다.</h1>
		</c:when>
		<c:otherwise>
			<c:forEach items="${ list }" var="result">
		        <div class="info">
		        	<input type="hidden" value="${ result.auctionNo }" class="auctionNo">
                        <button class="cancel">취소</button>
		            <div id="img">
                        <img src="${ result.imgPath }" alt="상품이미지">
                    </div>
                    <div id="detail">
                        <h3>${ result.pdName }</h3>
                        <p>남은일수 : ${ result.remainDate }</p>
                        <p>시작가 : ${ result.startPrice }</p>
                        <p>입찰단위 : ${ result.bidUnit }</p>
                        <p>입찰수 : ${ result.bidCnt }</p>
                    </div>
		        </div>
			        
			</c:forEach>
		</c:otherwise>
		</c:choose>
		
		<script>
	        $(() => {
	            $('.info').click(function() {
	                location.href = 'detail.auction?auctionNo=' + $(this).children('input[type="hidden"]').val();
	            });
	        });
	        
	        $(() => {
	        	$('.cancel').click(function(e){
	        		if(confirm('입찰을 취소하시겠습니까?')){
		        		location.href = 'bid.cancel?auctionNo=' + $(this).prev('input').val() + '&userNo=' + ${ loginUser.userNo };
		        		e.stopPropagation();
	        		} else {
	        			e.stopPropagation();
	        		}
	        		
	        	});
	        });
		</script>
	</div>
	<div id="foot"></div>
	<jsp:include page="../common/footer.jsp"/>

	

</body>
</html>