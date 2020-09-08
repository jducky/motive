<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">
<style>
	.left-box {
		background-color : #DCDCDC; 
		width : 90px; 
		height : 45px; 
		border-right : 1px solid black;
	}
	
	.box-con{
		display : flex;  
		border-bottom: 1px solid black;
	}
	
	.admin-input {
		height: 18px; 
		width: 250px; 
		text-indent: 2px; 
		margin-top : 10px; 
		margin-left : 10px;
		position : relative; 
	}
	
	.left-text {
		text-align : left;
		margin-left : 10px;
		margin-top : 10px;
		font-weight : bold;
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
	
	.project-table {
	  border-collapse: collapse;
	  width: 100%;
	  text-align : center;
	}

	.project-table th, td {
	  text-align: center;
	  padding: 12px;
	}
	
	th {
		background-color : rgb(242, 242,242);
	}
	
	.project-table tr {
		border : 1px solid #DBDBDB;
	}
	
	table {
		 border : 1px solid #DBDBDB;
	}
	
	th , td {
	 border : 1px solid #DBDBDB;
	 text-align : center;
	}
	
	td {
		width : 300px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
/* 		$("#popCancle").click(function() {
			window.close();
		});
		 */
</script>

<body style = "margin : 0 auto; background-color : white;">
	<div style = "width : 80%; height : 400px; margin : 0 auto; ">
		<p style = "font-size : 16px; font-weight : bold; margin-left : 3%; top : 4%; position : relative;">프로젝트 조회</p>
		<div style = "width : 95%; height : 5%; border-bottom : 2px solid #17366E; margin : 0 auto;">
			<div style = "float : left; margin-top : 10%;">
				<table class = "project-table">
					<tr>
						<th>번호</th>
						<td>10</td>
					</tr>
					<tr>
						<th>등록기관</th>
						<td>KEI</td>
					</tr>
					
					<tr>
						<th>프로젝트명</th>
						<td>Middle_test</td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td>홍길동</td>
					</tr>
					
					<tr>
						<th>등록일</th>
						<td>2020.07.30</td>
					</tr>
					
					<tr>
						<th style = "height : 80px;">설명</th>
						<td>2020 중간보고회의를 위한 TEST</td>
					</tr>
					
				</table>
			</div>
		</div>
	</div>
</body>
</html>