<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	background-color: rgba(153, 150, 146, 0.61);
}

#wrap {
	width: 1500px;
	margin: auto;
	height: auto;
}

#miniLogo {
	width: 100%;
	height: 200px;
	margin: auto;
	text-align: center;
	box-shadow: 2px 2px 2px rgba(105, 103, 103, 0.89);
	border-radius: 20px;
	background-color: rgb(180, 183, 184);
}

#miniLogo>p {
	height: 100px;
	margin: 0;
	font-size: 30px;
	line-height: 150px;
	font-weight: bold;
}

#miniLogo>a {
	font-size: 15px;
	font-weight: bold;
	text-decoration: none;
	color: black;
	line-height: 50px;
}

#miniLogo>a:hover {
	color: red;
}

#menu {
	width: 100%;
	height: 150px;
	margin: auto;
	text-align: center;
	padding-top: 50px;
	margin-bottom: 30px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.411);
	border-radius: 15px;
}

#navi>li {
	display: inline-block;
	width: 10%;
	height: 50px;
	list-style: none;
	background-color: rgb(180, 183, 184);
	margin: 0 70px 0 70px;
	border-radius: 20px;
}

#navi a {
	text-decoration: none;
	color: rgb(61, 52, 52);
	font-size: 20px;
	font-weight: bold;
	line-height: 50px;
}

#main {
	width: 1200px;
	margin: auto;
	height: auto;
	margin-bottom: 50px;
    text-align: center;
}
#preview {
        width: 300px;
        height: auto;
        border: 1px solid #ccc;
        display: none;
}
#previewContainer>img{
    position: relative;
    left: 450px;
}
#main>h2{
    margin: 50px 50px;
}
#main>form>input[type=submit]{
    background-color: rgba(219, 23, 23, 0.733);
    border: none;
    width: 100px;
    height: 50px;
    color: white;
    font-size: 18px;
    border-radius: 15px;
}
#main>form>input[type=file]{
    display: none;
}
label{
    display: inline-block;
    text-align: center;
    line-height: 50px;
    background-color: rgba(219, 23, 23, 0.733);
    border: none;
    width: 100px;
    height: 50px;
    color: white;
    font-size: 18px;
    border-radius: 15px;
}
#main>form{
    margin-bottom: 60px;
}
#previewContainer{
    margin-bottom: 50px;
}
button{
    width: 100px;
    height: 40px;
    border-radius: 15px;
    border: none;
    background-color: rgba(219, 23, 23, 0.733);
    color: white;
    font-size: 18px;
}
</style>
</head>
<body>
    <div id="wrap">
        <div id="miniLogo">
            <p>My 미니홈피🏡</p>
            <a href="miniPage">Main🏠</a>
        </div>
		<br>
        <div id="main">
            <h2>🚩이미지 업로드</h2>
            <form action="photoUpload" method="post" enctype="multipart/form-data">
                <label for="imageFileInput">이미지 첨부</label>
                <input type="file" name="imageFile" id="imageFileInput" accept="image/*" required><br><br>
                <input type="submit" value="업로드">
            </form>
        
            <div id="previewContainer">
                <h3>미리보기🌆</h3>
                <img id="preview" src="#" alt="미리보기 이미지">
            </div>
            <div>
                <button onclick="back();">취소</button>
            </div>
        </div>
    </div>
    
    <script>
    	function back(){
    		location.href='miniPage';
    	}
    
        $(document).ready(function() {
            $('#imageFileInput').change(function() {
            	
                if (this.files && this.files[0]) {
                    let reader = new FileReader();
                    reader.onload = function(e) {
                        $('#preview').attr('src', e.target.result);
                        $('#preview').css('display', 'block');
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });
        });
    </script>
</body>
</html>