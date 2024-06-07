<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    /*div{box-shadow: 0 0 0 1px red;}*/

    #wrap{
        margin: auto;
        width: 100%;
        height: 1000px;
    }

    #ct{
        margin: auto;
        width: 1200px;
        height: auto;
    }

    #title{
        width: 100%;
        height: 100px;
        border-bottom: 1px solid black;
    }

    #photo{
        width: 50%;
        height: 600px;
        float: left;
    }

    #photo > img{width: 100%; height: 100%;}

    #info{
        width: 50%;
        height: 600px;
        float: right;
    }

    #info > table{
        font-size: 20px;
        
    }

    .table{
        height: 100%;
    }
    button{
        width: 200px;
        height: 40px;
        border: none;
        color: white;
        background-color: skyblue;
    }

    button:hover{
        color: hotpink;
        border: 1px solid hotpink;
    }
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
    <div id="wrap">
        <div id="ct">
            <div id="title">
                <h2>${ auction.pdName }</h2>
            </div>

            <div id="photo">
                <img src="${ auction.imgPath }" alt="상품">
            </div>

            <div id="info">
                <table class="table table-hover">
                    <thead>
                        <tr>
                          <th>현재가</th>
                          <th>${ auction.bidPrice }원</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                        	<td>시작가</td>
                        	<td>${ auction.startPrice}원</td>
                        </tr>
                        <tr>
                        	<td>입찰단위</td>
                        	<td>${ auction.bidUnit }원</td>
                        </tr>
                        <tr>
                            <td>물품번호</td>
                            <td>${ auction.auctionNo }</td>
                        </tr>
                        <tr>
                            <td>판매자</td>
                            <td>${ auction.seller }</td>
                        </tr>
						<tr>
                         	<td>경매기간</td>
                        	<td>${ auction.startDate } ~ ${ auction.endDate }</td>
                        </tr>	
                        <tr>
                            <td>입찰수</td>
                            <td>${ auction.bidCnt }건</td>
                        </tr>
                        <tr>
                            <td>조회수</td>
                            <td>${ auction.pdCnt }회</td>
                        </tr>
                        <tr>
                            <td>남은 일수</td>
                            <td>${ auction.remainDate }일</td>
                        </tr>
                        <tr>
                        	<c:choose>
                        		<c:when test="${ loginUser.userNo ne auction.userNo }">
		                            <td>제시가</td>
		                            <td><input type="number" name="bidPrice" id="bid" required></td>
		                            <td><button onclick="inBid();">입찰하기</button></td>
                            	</c:when>
                            	<c:otherwise>
                            		<td><a href="delete.auction?auctionNo=${ auction.auctionNo }&userNo=${ loginUser.userNo }">삭제하기</a></td>
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                      </tbody>
                </table>

            </div>
            
            <div>
                
                <button onclick="insertSave();">장바구니</button>
            </div>

			<script>
				function insertSave(){
					
					$.ajax({
						url: 'save.insert',
						data : {
							userNo : ${ loginUser.userNo },
							auctionNo : ${ auction.auctionNo }
						},
						success : function(result) {
							
							if(result === 'NE'){
								alert('이미 존재하는 상품입니다.');
							}
							else{
								
								if(confirm('상품이 추가되었습니다. 리스트로 이동하시겠습니까?')){
									location.href='save.list?userNo=${ loginUser.userNo }';
								}
								else{
									return false;
								}
							}
							
						},
						error : function(request, status, error){
							console.log("error code : " + + request.status + "\n"+
							"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				};
				
				function inBid(){
					const bidPrice = document.getElementById('bid').value;
					
					
					location.href="auction.bid?userNo=" + ${ loginUser.userNo } + '&auctionNo=' + ${ auction.auctionNo } + '&bidPrice=' + bidPrice;  
					
					
				}
				
			</script>



        </div>





    </div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>