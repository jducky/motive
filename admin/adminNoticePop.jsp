<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type = "text/javascript">
	$(document).ready(function() {
		var today = new Date();
		var year  = today.getFullYear();
		var month = today.getMonth();
		var day = today.getDate();
		console.log(year + "." + month  + "." + day );
		$("#noticeToday").text(year + "." + month  + "." + day);
		
		
		$("#fileOpen").click(function() {
			
			const input = document.createElement("input");
			
			
			input.type = "file";
			input.accept = ".hwp , .xlsx";
			input.name = "noticeFile";
			input.id = "noticeFile";
			/* 	input.multiple = "true"; */
			
			const fileName = $("#fileNm");
			
			input.onchange = function(e) {
				changeFile(e.target.files[0]);
				var inName =  e.target.files[0].name;
				fileName.text(inName);
				document.getElementById("noticeForm").appendChild(input);
			}
			
			input.click();
		});
		
		$("#noticeIns").click(function() {
			var classifi = $("#noticeClassifi").val();
			var name = $("#noticeName").val();
			var content = $("#noticeContent").val();
			if(classifi == "") {
				alert("분류를 선택해주세요.");
				$("#noticeClassifi").focus();
			} else if(name == "") {
				alert("제목을 입력해주세요.");
				$("#noticeName").focus();
			} else if(content == "") {
				alert("내용을 입력해주세요.");
				$("#noticeContent").focus();
			} else {
				$("form").submit();	
			}
		});
		
	});
	
	
	
	function changeFile(file) {
		const reader = new FileReader();
		reader.onload = function(e) {
			
		}
		reader.readAsText(file);
	}
</script>
<style>
	.notice-table {
	  border-collapse: collapse;
	  width: 100%;
	  text-align : center;	
	  height : 13px;
	}
	
	th {
		background-color : rgb(242,242,242);
		border : 1px solid black;
		
	}
	td {
		border : 1px solid black;
	}
	
	.notice-table tr {
		border : 1px solid black;
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
	
	#fileNm {
	
	}
	
	#noticeContent {
		margin-top : 3px;
		width : 435px;
		height : 300px;
		resize : none;
	}
	
	#noticeName {
		width : 425px;
	}
	
 	#noticeFile {
		display : none;
	} 
	
</style>
</head>
<body>
	<form action = "insertNoticePro.ad" id = "noticeForm" method = "POST" enctype = "multipart/form-data" accept-charset = "UTF-8">
		<table class = "notice-table">
			<tr>
				<th style = "height : 10px;">분류</th>
				<td>
					<select id = "noticeClassifi" name = "noticeClassifi">
						<option value = "">분류</option>
						<option value = "분류1">분류1</option>
						<option value = "분류2">분류2</option>
					</select>
				</td>
				<th>작성자</th>
				<td>${sessionScope.id}</td>
				<th>등록일</th>
				<td><p id = "noticeToday"></p></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan = "5"><input type = "text" name = "noticeName" id = "noticeName"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan = "5">
					<textarea name = "noticeContent" id= "noticeContent"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan ="5">
					<div style = "display : flex;  height : 40px; margin-left : 110px;">
						<p id = "fileNm" style = "bottom : 8px; position : relative; font-weight : bold; font-size : 12px;">파일을 선택해주세요.</p>
						<button id = "fileOpen" type = "button" class = "btn-primary" style = "height : 30px; margin-left : 258px; margin-top : 6px; position : fixed">불러오기</button>
					</div>
				</td>
			</tr>
		</table>
		<button id = "noticeIns" type = "button" style = " margin-left : 442px; margin-top : 5px; height : 30px;" class = "btn-primary">등록</button>
	</form>
</body>
</html>
