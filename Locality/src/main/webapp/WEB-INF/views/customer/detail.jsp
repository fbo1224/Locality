<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세조회</title>
<style>
	p{
		text-align : center;
		font-size : 40px;
		font-weight : bold;
	}
	
	#notice {
	  width: 100%;
	  border: 1px solid #444444;
	  text-align:center;
	}
	th, td {
	  border: 1px solid #444444;
	  padding: 10px;
	}
	
	th{width: 90px; background-color:lightgray;}
	
    /*div{box-shadow: 0 0 0 1px red;}*/

    #wrap{
        margin: auto;
        margin-top:100px;
        width: 100%;
        height: 700px;
    }

    #ct{
        margin: auto;
        width: 1200px;
        height: auto;
    }
    .td{width:150px;}
    
    #btnArea{width : 100%; height : 100px; text-align: center;}
	#btnArea > button{
		margin-top: 70px; 
		height: 30px; 
		width: 100px;
		border: 1px solid black;
		background-color: #ffffff;
	}
	#btnArea > button:hover{background: black; color: #ffffff;}

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	
	<div id="wrap">
		<div id="ct">
		    <table id="notice">
		    	<thead>
			        <tr>
			         	<th>제목</th>
	                	<td colspan="4">${ notice.noticeTitle }</td>
	                	<th>조회수</th>
		        		<td class="td">${ notice.count }</td>
			        </tr>
		        </thead>
		        
		        <tbody>
			      	<tr>
		        		<th>작성자</th>
			        	<td colspan="4">${ notice.noticeWriter }</td>
						<th>작성일자</th>
			        	<td>${ notice.createDate }</td>
			        </tr>
			        <tr>
			        	<th height="400px">내용</th>
			        	<td colspan="6">${ notice.noticeContent }</td>
			        </tr>
		        </tbody>
		    </table>
		    <div id="btnArea">
				<button onclick="location.href='customer'">목록으로</button>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp"/>
	

</body>
</html>