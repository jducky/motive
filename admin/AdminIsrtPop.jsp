<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		text-indent: 2px; 
		float : left;
		width : 250px;
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
	    font-size: 14px;
	    cursor : pointer;
	}
	
	.admin-table {
	  border-collapse: collapse;
	  width: 100%;
	  text-align : center;
	}

	.admin-table th, td {
	  text-align: center;
	  padding: 12px;
	}
	
	th {
		background-color : rgb(242, 242,242);
	}
	
	.admin-table tr {
		border : 1px solid #DBDBDB;
	}
	
	table {
		 border : 1px solid #DBDBDB;
	}
	
	th , td {
		 border : 1px solid #DBDBDB;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#adminIdCheck").click(function() {
			const formData = $("form").serialize();
			
			$.ajax({
				type : 'POST' ,
				data  : formData ,
				url : 'adminIdCheck.ad' ,
				dataType : 'json',
				success : function(result) {
					if(result == 0) {
						alert("아이디를 사용할 수 있습니다.");
						$("#adminIdCheckVal").val(1);
					} else {
						alert("아이디를 사용할 수 없습니다.");
						$("#adminId").val("");
						$("#adminIdCheckVal").val(0);
					}
				} ,
				error : function(err) {
					alert(err);
				}
			});
		});
			
		$("#adminInsert").click(function() {
			const adminId = $("#adminId").val();
			const adminPassword = $("#adminPassword").val();
			const adminName = $("#adminName").val();
			const adminGroup = $("#adminGroup").val();
			const adminIdCheck = $("#adminIdCheckVal").val();
			
			if(adminId == "") {
				alert("관리자 아이디를 작성해주세요.");
				$("#adminId").focus();
			} else if(adminPassword == "") {
				alert("관리자 비밀번호를 작성해주세요.");
				$("#adminPassword").focus();
			} else if(adminName == "") {
				alert("관리자 이름을 작성해주세요.");
				$("#adminName").focus();
			} else if(adminGroup == "") {
				alert("관리자 그룹을 작성해주세요.");
				$("#adminGroup").focus();
			} else if(adminIdCheck == 0) {
				alert("관리자 아이디 중복확인 해주세요.");
				$("#adminIdCheck").focus();
			} else {
				const adminData = $("form").serialize();
				
				$.ajax({
					type : 'POST' ,
					data  : adminData ,
					url : 'adminInsert.ad' ,
					dataType : 'json',
					success : function(result) {
						if(result == 1) {
							opener.location.reload();
							self.close();
						} else {
							alert("등록에 실패했습니다.");
						}
					} ,
					error : function(err) {
						alert(err);
					}
				});
			}
			
		});
		
		$("#insertCancle").click(function() {
			self.close();
		});
		
	}); 


</script>

<body>
	<div style = "width : 80%; height : 80%; margin : 0 auto; ">
	
		<div style="padding-top:3%;">
			<p style = "font-size : 16px; font-weight : bold;">관리자 등록</p>
			<div style = "width : 100%; height : 5%; border-bottom : 2px solid #17366E; padding-top:1%;"></div>
		</div>
		
		
		<div style="padding-top:5%">
			<form action = "" method = "POST" >
				<input type ="hidden" id = "adminIdCheckVal" value = "0"/>
				<table class = "admin-table">
					<tr>
						<th>아이디</th>
						<td>
							<input type = "text"   class = "admin-input" name = "adminId" id = "adminId" />
							<input type = "button" class = "btn-primary" id = "adminIdCheck" style = "height : 25px; margin-left : 15px;" value = "중복확인"/>
						</td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td><input class = "admin-input"  name = "adminPassword" id = "adminPassword" type = "password"/></td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td>
							<input class = "admin-input" name = "adminName" id = "adminName" type = "text"/>
						</td>
					</tr>
					
					<tr>
						<th>관리 그룹명</th>
						<td>
							<select id="group_sel" name = "groupSeq" class = "admin-input">
								<c:forEach var="vo" items="${groupList}">
									<option value="${vo.seq}">${vo.group_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
			</form>
			<div style = "float : right;  margin-top : 4%; position: relative; left : 2.5%;">
				<button class = "btn-primary" style = "height : 30px; margin-left : 30px;" id = "adminInsert">등록</button>
				<button class = "btn-primary" style = "height : 30px;" id = "insertCancle">취소</button>
			</div>
		</div>
	</div>
</body>
</html>