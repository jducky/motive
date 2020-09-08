<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<%@ include file = "../all/setting.jsp" %>
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
<script type="text/javascript">
	$(document).ready(function() {
		var rowspanIndex = 0;
		var groupName = "";
		var groupSeq = 0;
		
		
		<c:forEach items="${adminList}" var="scriptGroupUser">
			if("${scriptGroupUser.group_name}" != "") {
				groupName = "${scriptGroupUser.group_name}";
				rowspanIndex += 1;
				groupSeq = Number("${scriptGroupUser.mem_group_seq}");
			}
		</c:forEach>
		
		$("#groupName").text(groupName);
		$("#groupRowSpan").attr("rowspan" , rowspanIndex);
		
		$("#popCancle").click(function() {
			self.close();
		});
		
		$("#adminSetting").click(function() {
			var url = 'groupMemberSettingPop.ad?select_groupSeq=' + groupSeq + "&version=A";
			var name = 'groupMemberSetting';
			var option = 'width = 730 , height = 500';
			
			window.open(url,name,option);
		});
		
		$("#userSetting").click(function() {
			var url = 'groupMemberSettingPop.ad?select_groupSeq=' + groupSeq + "&version=U";
			var name = 'groupMemberSetting';
			var option = 'width = 730 , height = 500';
			
			window.open(url,name,option);
		});
	});
</script>
</head>
<body style = "margin : 0 auto; background-color : white;">
	<div style = "width : 80%; height : 198px; margin : 0 auto; ">
		<p style = "font-size : 16px; font-weight : bold; margin-left : 3%; top : 4%; position : relative;">그룹 정보</p>
		<div style = "width : 95%; height : 5%; border-bottom : 2px solid #17366E; margin : 0 auto;">
			<div style = "float : left; margin-top : 10%; width : 100%;">
				<table class = "project-table">
					<tr>
						<th>그룹명</th>
						<td colspan="3"  id="groupName" style = "text-align : left;"></td>
					</tr>
					
					<tr>
						<th>그룹 관리자</th>
						<td style="text-align : left;" colspan="3">
							<c:forEach var="groupAdmin" items="${adminList}">
								<c:if test="${groupAdmin.authority == 'A' and groupAdmin.mem_group_seq != 0}">
									${groupAdmin.id}<br>
								</c:if>
							</c:forEach>
						</td>
					
					</tr>
						
					<tr>
						<th id ="groupRowSpan" rowspan="4">그룹원</th>
						<th>권한</th>
						<th>ID</th>
						<th>이름</th>
					</tr>
					
					<tr>
						<c:forEach var="groupUser" items="${adminList}">
							<c:if test="${groupUser.mem_group_seq != 0}">
								<c:if test="${groupUser.authority == 'R' or groupUser.authority == 'U'}">
									<tr>
										<td>
											<c:if test="${groupUser.authority == 'R'}">
												연구원
											</c:if>
											
											<c:if test="${groupUser.authority == 'U'}">
												일반
											</c:if>
										</td>
										<td>${groupUser.id}</td>
										<td>${groupUser.name}</td>
									</tr>
								</c:if>
							</c:if>
						</c:forEach>
					</tr>
					
				</table>
				<div style = "float : right;  margin-top : 4%; position: relative; left : 2.5%;">
					<input type="button" id = "adminSetting" style = "height : 24px; width : 120px; " class = "btn-primary" value="그룹관리자 설정"/>
					<input type="button" id = "userSetting" style = "height : 24px; width : 95px; " class = "btn-primary" value="그룹원 설정"/>
					<input type="button" id = "popCancle" style = "height : 24px; width : 60px;" class = "btn-primary" value="확인"/>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>