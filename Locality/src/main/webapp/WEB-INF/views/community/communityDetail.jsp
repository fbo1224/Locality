<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
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
    .userInfo{
    	border : 2px solid #7EA1FF;
        border-radius: 2% #7EA1FF;
        box-shadow: 2px;
    	text-align : right;
    	margin-bottom : 20px;
        width: 450px;
        height: 200px;
        display: flex;
        float: right;

    }
	.card{
        width: 100%;
        height: 100%;
        border : 10px solid blue;
    	
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
    #check-like{
    	width: 30px;
    	height: 30px;
    }
    #chk{
    	display: none;
    }
    #chk-label{
    	font-size: 30px;	
    }
    #chk:checked + #chk-label{
    	background: green;
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
                    <h2 class="page-header" align="left">함께해요</h2>
				</div> 
                    <div class="content_outer">
                        <div class="content_header"> 
                            
                        <div class="content_header2"> ${ commuBoardVO.commuTitle } </div>
                        <input type="hidden" name="" value="">
                        <input type="hidden" name="" value="">
                        </div>
                        <div class="content_sub">
                        <span class="content_sub1">작성일 : ${ commuBoardVO.enrollDate }</span> &nbsp;/&nbsp;
                        <span class="content_sub1">작성자 : ${ commuBoardVO.commuWriter }</span> &nbsp;/&nbsp;
                        <span class="content_sub1">조회수 : ${ commuBoardVO.count }</span>
                    </div>
                    <div class="content_body">
	                    <c:if test="${ not empty commuBoardVO.originName }">	
	                        <div class="img-area">
	                              	<img width="100%" src="${ commuBoardVO.changeName }" />
	                        </div>
	                    </c:if>   
                        <div class="text-area">
                        	${ commuBoardVO.commuContent }
                        	
                        </div>
                        
                        
                    </div>
                    <div class="comu_like">	
                    	<input type="checkbox" id="chk">좋아요
						<label for="chk" id="chk-label" onclick="insertLike();"> 👍<label>
                    </div>
                    
					<div class="userInfo">
					  <span class="card">
					    <img class="card-img-top" src="data:image/png;base64,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" alt="Card image" style="width:100%">
                      </span>  
					  <span class="card-body">
					      <h4 class="card-title">${ commuBoardVO.commuWriter}</h4><br><br><br>
					      <a href="#" class="btn btn-primary">미니홈페이지 놀러가기</a>
					  </span>
					</div>
                    <div class="input-group mb-3">
                    	<c:choose>
                    	<c:when test="${ empty sessionScope.loginUser }">
                    		<input type="text" class="form-control" id="" maxlength="300" placeholder=" 로그인 후 사용해주시기 바랍니다." readonly>
                    	</c:when>
                    	<c:otherwise>	
                        <input type="text" class="form-control" id="replyContent" maxlength="300" placeholder="댓글 작성 시 상대방에게 불쾌감을 주는 언어사용은 가급적 지양해주시기 바랍니다. / 최대 300자 ">
                        <div class="input-group-append">
                            <button class="btn btn-info" onclick="insertReply();" id="btn-reply">등록</button>
                        </div>
                          <div id="textcount1">
                            <span id="textCount"> 0 </span> / 300
                        </div>
                        </c:otherwise>
                        </c:choose>
                    </div> 

                    <div class="reply" id="replyList"> 
                        <table class="table table-bordered table-hover" style="margin-top:30px; border-radius: 10px;">
				   			<thead>
	                            <tr style="background-color: #6caddf; margin-top: 0; height: 40px; color: white; opacity: 0.8">
	                               <th style="width: 8%; text-align:center">번&nbsp;호</th>
	                               <th style="width: 45%; text-align:center">내&nbsp;&nbsp;용</th>
	                               <th style="width: 10%; text-align:center">작성자</th>
	                               <th style="width: 15%; text-align:center">작성일</th>
	                            </tr>
                            </thead>
                            <tbody>
                            	
                            </tbody>
                            
                         </table>    
                    </div>         
                    <div class="content_btn" align="center">
                        <a href="commu?areasNo=${ loginUser.areasCode }" class="btn btn-sm btn-info">목&nbsp;록</a>
                        <c:if test="${ sessionScope.loginUser.nickName eq requestScope.commuBoardVO.commuWriter }">
                      	<a  class="btn btn-sm btn-secondary" onclick="postSubmit(0)">수&nbsp;정</a>
                       	<a  class="btn btn-sm btn-danger" onclick="postSubmit(1)">삭&nbsp;제</a>
                       	</c:if>
                       	<form action="" id="postForm" method="post">
                       		<input type="hidden" name="commuNo" value="${ commuBoardVO.commuNo }"/>
                       		<input type="hidden" name="filePath" value="${ commuBoardVO.changeName }"/>
                       		<input type="hidden" name="areasNo" value="${ sessionScope.loginUser.areasCode }"/>
                       	</form>
                    </div>
                </div>
				</div>            
			 </div>
		  </div>
					  
	<script>
		function postSubmit(num){
			
			if(num == 0){
				$('#postForm').attr('action', 'updateForm.commu').submit();
			}
			else{
				$('#postForm').attr('action', 'delete.commu').submit();
			}
			
		}
		
		function insertReply(){
			
			if($('#replyContent').val().trim() != ''){
				$.ajax({
					url : 'reply',
					data : {
						commuNo : ${ commuBoardVO.commuNo },
						replyContent : $('#replyContent').val(),
						userNo : ${ sessionScope.loginUser.userNo }	
					},
					type : 'post',
					success : function(result){
						if(result === 'success'){
							$('#replyContent').val('');
							selectReply();
						}	
					}
					
				});
			}
		else{
			alertify('값을 다시 입력해주세요');
		}
		}                	
        
	
		function selectReply(){
			
			$.ajax({
				url : 'reply',
				type : 'get',
				data : {commuNo : ${ commuBoardVO.commuNo }},
				success : function(result){
					let resultStr = '';
					for(let i in result){
						resultStr += '<tr>'
								   + '<td style="width: 8%; text-align:center">' + result[i].replyNo + '</td>'
								   + '<td style="width: 45%; text-align:center">' + result[i].replyContent + '</td>'
								   + '<td style="width: 10%; text-align:center">' + result[i].replyWriter + '</td>'
								   + '<td style="width: 15%; text-align:center">' + result[i].createDate + '</td>'
								   + '<tr>';
					}
					$('#replyList tbody').html(resultStr);
				}
				
			})
		};                     	
		
		
    	$(function(){
    		selectReply();
    	});
    	
    	
    	function insertLike(){
    		$.ajax({
    			url : 'like',
    			data : {
    				userNo : ${ sessionScope.loginUser.userNo },
    				commuNo : ${ commuBoardVO.commuNo }
    			},
    			type : 'post',
    			success : function(result){
    				if(result === 'success'){
    				$('#chk').append('checked');
    				}
    			}
    			
    		})
    	}
    	
    	
	
	</script>	
	   
	
		
	
</body>
</html>