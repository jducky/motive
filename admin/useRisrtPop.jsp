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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	.user-input {
		width: 250px; 
		text-indent: 2px; 
		float : left;
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
	
	#user_select {
		width : 100px;
		height : 25px;
		margin-top : 10px;
		margin-left : 10px;
		position : relative; 
	}
	
	
	
	.user-table {
	  border-collapse: collapse;
	  width: 100%;
	  text-align : center;
	}

	.user-table th, td {
	  text-align: center;
	  padding: 12px;
	}
	
	th {
		background-color : rgb(242, 242,242);
	}
	
	.user-table tr {
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
		$("#userIdCheck").click(function() {
			const formData = $("form").serialize();
			
			$.ajax({
				type : 'POST' ,
				data  : formData ,
				url : 'adminIdCheck.ad' ,
				dataType : 'json',
				success : function(result) {
					if(result == 0) {
						alert("아이디를 사용할 수 있습니다.");
						$("#userIdCheckVal").val(1);
					} else {
						alert("아이디를 사용할 수 없습니다.");
						$("#userId").val("");
						$("#userIdCheckVal").val(0);
					}
				} ,
				error : function(err) {
					alert(err);
				}
			});
		});
			
		$("#adminInsert").click(function() {
			const userId = $("#userId").val();
			const userPassword = $("#userPassword").val();
			const userName = $("#userName").val();
			const userGroup = $("#userGroup").val();
			const userIdCheck = $("#userIdCheckVal").val();
			const userAuthority = $(".userAuthority").is(":checked");

			
			if(userId == "") {
				alert("사용자 아이디를 작성해주세요.");
				$("#userId").focus();
			} else if(userPassword == "") {
				alert("사용자 비밀번호를 작성해주세요.");
				$("#userPassword").focus();
			} else if(userName == "") {
				alert("사용자 이름을 작성해주세요.");
				$("#adminName").focus();
			} else if(userGroup == "") {
				alert("사용자 그룹을 작성해주세요.");
				$("#userGroup").focus();
			} else if(userIdCheck == 0) {
				alert("사용자 아이디 중복확인 해주세요.");
				$("#userIdCheck").focus();
			} else if(userAuthority == false) {
				alert("사용자 권한을 선택해주세요.");
			}  else {
				const adminData = $("form").serialize();
				
				$.ajax({
					type : 'POST' ,
					data  : adminData ,
					url : 'userInsert.ad' ,
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
		
		$(".userAuthority").click(function() {
			if(this.checked) {
				$(".userAuthority").prop("checked" , false);
				$(this).prop("checked" , true);
				$("#userAuthority").val(this.value);
			}
		});
		
	}); 


</script>

<body>
	<div style = "width : 80%; height : 80%; margin : 0 auto; ">
	
		<div style="padding-top:3%;">
			<p style = "font-size : 16px; font-weight : bold;">사용자 등록</p>
			<div style = "width : 100%; height : 5%; border-bottom : 2px solid #17366E; padding-top:1%;"></div>
		</div>
		<div style="padding-top:5%">
			<form action = "" method = "POST" >
				<input type ="hidden" id = "userIdCheckVal" value = "0"/>
				<table class="user-table">
					<tr>
						<th>그룹</th>
						<td>
							<c:if test="${sessionScope.auth == 'S'}">
								<select name="userGroup" class="user-input">
									<c:forEach var="group" items="${groupList}">
										<option value="${group.seq}">${group.group_name}</option>
									</c:forEach>
								</select>
							</c:if>
							
							<c:if test="${sessionScope.auth == 'A'}">
								<c:forEach var="group" items="${groupList}">
									<c:if test="${group.seq == sessionScope.groupSeq}">
										<p style="position:relative;float:left;">${group.group_name}</p>
									</c:if>
								</c:forEach>
							</c:if>
						</td>
					</tr>
					
					<tr>
						<th>아이디</th>
						<td>
							<input type = "text"   class = "user-input" name = "id" id = "userId" />
							<input type = "button" class = "btn-primary" id = "userIdCheck" style = "height : 30px; margin-left : 15px;" value = "중복확인"/>
						</td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td>
							<input class = "user-input"  name = "userPassword" id = "userPassword" type = "password"/>
						</td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td>
							<input class = "user-input" name = "userName" id = "userName" type = "text"/>
						</td>	
					</tr>	
					
					<tr>
						<th>권한</th>
						<td>
							<div style="float:left; width : 135px;">
								<input type="hidden" name="userAuthority" id="userAuthority" value=""/>
								<input type="radio" class="userAuthority" id="researcher" value="researcher"/>
								<label for="researcher" style="padding-right : 25%;">연구원</label>
								<input type="radio" class="userAuthority" id="municipality" value="municipality"/>
								<label for="municipality">일반</label>
							</div>
						</td>
					</tr>
				</table>
			</form>
			<div style = "float : right;  margin-top : 4%; position: relative; left : 2.5%;">
				<button class = "btn-primary" style = "height : 30px; margin-left : 30px;" id = "adminInsert">등록</button>
				<button class = "btn-primary" style = "height : 30px; "id = "insertCancle">취소</button>
			</div>
		</div>
	</div>
</body>
</html>