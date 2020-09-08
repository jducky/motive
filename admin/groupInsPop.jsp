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
		
		$("#fileOpen").click(function() {
			
			const input = document.createElement("input");
			
			
			input.type = "file";
			//input.accept = ".hwp , .xlsx";
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
		
		$("#popCancle").click(function() {
			window.close();
		});
		
	}); 
	
	function groupins_Pro_check(){
		
		var group_name = $('#group_name').val();
		
		if(group_name == ''){
			alert('그룹명을 입력해주세요.');
			return false;
		}
	}

</script>

<body style = "margin : 0 auto; background-color : white;">
	<div style = "width : 80%; height : 198px; margin : 0 auto; ">
		<p style = "font-size : 16px; font-weight : bold; margin-left : 3%; top : 4%; position : relative;">그룹 신규 등록</p>
		<div style = "width : 95%; height : 5%; border-bottom : 2px solid #17366E; margin : 0 auto;">
			<div style = "float : left; margin-top : 10%;">
				<form action="groupins_Pro.ad" method="post" onsubmit="return groupins_Pro_check();">
					<table class = "project-table">
						<tr>
							<th>그룹명</th>
							<td style = "text-align : left;"><input id="group_name" name="group_name" style = "width : 270px;" type = "text"/></td>
						</tr>
					</table>
				<div style = "float : right;  margin-top : 4%; position: relative; left : 2.5%;">
					<input type="submit" style = "height : 24px; width : 60px; " class = "btn-primary" value="등록"/>
					<input type="button" id = "popCancle" style = "height : 24px; width : 60px;" class = "btn-primary" value="취소"/>
				</div>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>