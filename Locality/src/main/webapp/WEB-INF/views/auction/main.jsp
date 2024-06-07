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
        height: auto;
        
    }

    #photo{
        width: 100%;
        height: 500px;
    }

    #header{
        width: 100%;
        height: 100px;
        position: relative;
    }

    #header > form{text-align: center;}

    #title{width: 100%; height: 50px; border-bottom:1px solid black;}
	.pro_wrap {
		width : 1200px;
		height: auto;
		border: 1px solid black;
	}
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

    #search > input{
        font-size: 16px;
        width: 325px;
        height: 50px;
        border-radius: 10px;
        margin-left: 100px;
    }
    
    #search > button{
        width: 50px;
        height: 50px;
        border: 0px;
        float: right;
        border-radius: 10px;
        border: 1px solid black;
        font-weight:bold;
    }

    #search > button:hover{background-color: black; color: white;}
	
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
    .refresh_btn{
    	width : 600px;
    	height : 50px;
       margin: auto;
       text-align: center;
    }
    .refresh_btn > img{
       width: 45px;
       height: 45px;
       margin-top: 40px;
    }
    .duct_wrap{
		width : 1200px;
		height: auto;
		border: 1px solid black;
    }
    
    #filter > button{
    	border-radius:10px;
    	background-color:#fff;
    	border:1px solid black;
    	font-weight:bold;
    	margin-bottom:10px;
    	margin-right:10px;
    }
    #filter > button:hover{
    	color:white;
    	background-color:black;
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
            <!-- <form action="search.do" method="get"> -->
                <input type="text" name="keyword" placeholder="상품명 입력" value="${ keyword }" required />
                <!-- <input type="hidden" name="field"/> -->
                <button type="button">검색</button>
            <!-- </form> -->
        </div>
    </div>

    <div id="wrap">
        <div id="ct">
            <div class="title">
                <div><h1 id="pd_title">전체 상품</h1></div>
                <div id="filter">
                	<button value="all">전체보기</button>
                	<button value="bid">인기순</button>
                	<button value="cnt">조회순</button>
                	<button value="low">가격 낮은 순</button>
                </div>
            </div>
            
            <div class="pro_wrap">
            	<div class="duct_wrap">
            	
            	</div>
			</div>
		      <div class="refresh_btn"><img src="./resources/images/auction/more.png"></img></div>
		      
            <script>

	            let page = 1, filter = 'all', resultStr = '', keyword = '';
	            $(() => {
	            	// 기본적으로 리스트 뿌려주기
	            	selectAuction(page);
	            	// 더보기 버튼 클릭 시
	                $('.refresh_btn > img').click(() => {
	                	selectAuction(++page, filter);
	                });
	             });
	            
	            $(() => {
	            	// 검색 버튼 클릭 시
	            	$('#search > button').click(() => {
	            		
		            	resultStr = '';
		            	keyword = $('input[name=keyword]').val();
	            		searchAuction(filter, keyword);
	            		
	            		function searchAuction(filter, keyword){
	            			$.ajax({
			            		url : 'products/' + filter + '/' + keyword,
			            		type : 'post',
			            		success : result => {
			                        const searchList = result.searchList;
			                        const keyword = result.keyword;
			                        
			                        $('input[name=keyword]').val(keyword);
			            			
			            			for(let i in searchList){
				            			resultStr += '<div class="product">'
						    					   + '<input type="hidden" value="' + searchList[i].auctionNo + '">'
						    					   + '<div class="pd_photo"><img src="' + searchList[i].imgPath + '" alt="상품"></div>'
						    					   + '<div class="pd_title">' + searchList[i].pdName + '</div>'
						    					   + '<div class="pd_auc">현재가:  ' + searchList[i].startPrice 
						    					   + '원 <br> 입찰단위 : ' + searchList[i].bidUnit + '원</div>'
						    					   + '<div class="pd_count">조회수: ' + searchList[i].pdCnt + ' 회 <br> 입찰수: ' + searchList[i].bidCnt + '건</div>'
						    					   + '</div>'
			            			}
			            			$('.duct_wrap').html(resultStr);
			                        $('.refresh_btn').css('display', 'none');
			            		},
			            		error : result => {
			            			console.log('Search AJAX 실패');
			            			console.log(keyword);
			            		}
	            			});
	            		}
	            	})
	            })
	            
	            // 필터
            	$(() => {
            		// 필터 항목 클릭 시
            		$('#filter > button').click((e) => {
            			page = 1;
            			resultStr = '';
            			filter = e.target.value;
            			let title = $('#pd_title');
            			// AJAX filter 값 넣기
            			selectAuction(page, filter);
            			
            			// 검색할 때 field 값 넣기
            			$('input[name="field"]').val(filter);
            			
            			// 제목 변경
            			if(filter == 'bid'){
            				title.text('인기순 상품');
            			}
            			else if(filter == 'cnt'){
            				title.text('많이 찾은 상품');
            			}
            			else if(filter == 'low'){
            				title.text('가격 낮은 상품');
            			}
            			else{
            				title.text('전체 상품');
            			}
            		})
            	})
	            
		            // 제품 리스트 AJAX
		            function selectAuction(page, filter){
		            	$.ajax({
		            		url : 'products/' + page + '/' + filter,
		            		type : 'get',
		            		success : result => {
		                        const auctions = result.auctions;
		                        const pageInfo = result.pageInfo;
		            			
		            			for(let i in auctions){
			            			resultStr += '<div class="product">'
					    					   + '<input type="hidden" value="' + auctions[i].auctionNo + '">'
					    					   + '<div class="pd_photo"><img src="' + auctions[i].imgPath + '" alt="상품"></div>'
					    					   + '<div class="pd_title">' + auctions[i].pdName + '</div>'
					    					   + '<div class="pd_auc">현재가:  ' + auctions[i].startPrice 
					    					   + '원 <br> 입찰단위 : ' + auctions[i].bidUnit + '원</div>'
					    					   + '<div class="pd_count">조회수: ' + auctions[i].pdCnt + ' 회 <br> 입찰수: ' + auctions[i].bidCnt + '건</div>'
					    					   + '</div>'
		            			}
		            			$('.duct_wrap').html(resultStr);
		            			
		                        if (pageInfo.currentPage != pageInfo.maxPage) {
		                            $('.refresh_btn').css('display', 'block');
		                        } else {
		                            $('.refresh_btn').css('display', 'none');
		                        }
		            		},
		            		error : result => {
		            			console.log('AJAX 실패');
		            		}
		            	})
		            }
	            	
   		            // 상세페이지로 이동
   		            
   		            $(document).on('click','.product',function() {
   		            	location.href = 'detail.auction?auctionNo=' + $(this).children('input[type="hidden"]').val();
   		            });
   		            
		            // TOP버튼
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
            </script>

        </div>
        <a id="topBtn" >TOP</a>
        
        
    </div>
	

</body>
</html>