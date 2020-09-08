<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file = "../all/setting.jsp" %>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
</head>
<!-- <link rel="stylesheet" href="../resources/css/style.css" type="text/css"> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">
<!-- <link rel="stylesheet" href="resources/css/style.css" type="text/css"> -->

<style>
.notice-table {
  border-collapse: collapse;
  width: 100%;
  text-align : center;
}

th, td {
  text-align: center;
  padding: 8px;
}

.notice-table tr:nth-child(even){background-color: #DCDCDC}

.notice-table tr {
	border-bottom : 1px solid black;
	height : 40px;
}

th {
  color: black;
}

.btn-primary {
  margin-right : 10px;  
  width: 80px; 
  height: 35px;
  border: none;
  background: #17366e; 
  color:#fff; 
  border-radius: 3px; 
  font-size: 14px;
  cursor : pointer;
}

.topMenu {
	display : flex;
	float : right;
}

.topMenu li {
	position : relative;
	padding: 0 100px; 
	float: left;
}

.topMenu li:hover > ul {
	display : block;
}

.topMenu li > ul {
	position : absolute;
	z-index : 1000;
	display : none;
}

.topMenu li > ul > li {
	float : none;
	padding : 0;
}

.notice-table tr {
	background-color : white;
}

.notice-table tr:hover {
	background-color : rgb(180 , 198 , 231);
}
	.ul1_menu1{
		/* padding:10px; */
		font-size: 18px;
	}
	.ul1_menu1 .on{
		background-color: #87827d;
		color:white;
	}
	.ul1_menu1 .on .ul1_menu2{
		font-size: 15px;
	}
	.ul1_menu1 .on .ul1_menu2 .on{
		background-color: #d9d9d9;
		color:#229AF6;
	}
</style>


<script type="text/javascript">
	$(function() {
		
		
	});
</script>



<body style="background-color: white;">

<%@ include file="../all/header.jsp" %>
<div style="display : flex;">

	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 120px;">
			<p style="font-size:30px; color: #ABC927;">소개</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul>
				<li><a href="business.do">사업설명</a></li>
				<li class = "on"><a href="material.do">> 입력 자료란</a></li>
				<li><a href="modelResult.do">모형 결과 분석</a></li>
				<li><a href="notice.do">공지사항</a></li>
			</ul>
		</div>
	</div>
	
	<div class = "content" style="width: 60%; height: 730px; background-color : white; margin-top : 30px; margin-left : 200px;">
	
		<div style = "border:1px solid #d3d3d3; width : 1200px; height : 90%; ">
			<div style = "width : 95%; height : 5%; border-bottom : 2px solid #17366E; margin : 0 auto;">
				<h2>입력 자료</h2>
			</div>
			
			<div style = "margin-left : 3%;">
				<h3>MOTIVE Ecosystem을 통해 모형을 구동하기 위하여 사용되는 입력 자료는 다음과 같습니다.</h3>
			</div>
			
			<div  style = "margin-left : 3%;">
				<div style = "display : flex;">
					<p style = "font-size : 25px; color :  rgb(171 , 201 , 39); margin-top : 1%;">⦁</p>
					<h2 style = "margin-left : 1%;">생물종 자료</h2>
				</div>
				<div style = "margin-left : 3%;">
					<p style = "font-size : 18px; color : #DBDBDB;">생물종 자료에 대한 기초 설명</p>		
				</div>
				
				<div style = "display : flex; margin-top : 9%;">
					<p style = "font-size : 25px; color :  rgb(171 , 201 , 39); margin-top : 1%;">⦁</p>
					<h2 style = "margin-left : 1%;">연계 자료</h2>
				</div>
				<div style = "margin-left : 3%;">
					<p style = "font-size : 18px; color : #DBDBDB;">연계 자료에 대한 기초 설명</p>		
				</div>
				
				
				<div style = "display : flex;  margin-top : 9%;">
					<p style = "font-size : 25px; color :  rgb(171 , 201 , 39); margin-top : 1%;">⦁</p>
					<h2 style = "margin-left : 1%;">기후 자료</h2>
				</div>
				<div style = "margin-left : 3%;">
					<p style = "font-size : 18px; color : #DBDBDB;">기후 자료에 대한 기초 설명</p>		
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../all/footer.jsp" %>
</body>
</html>