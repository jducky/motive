<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- <link rel="stylesheet" href="../resources/css/style.css" type="text/css"> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">

<style>
.sideMenu div ul li{
	font-size: 20px;

	padding: 10px;
}

.on{
	background-color: #87827d;
}

.admin-table {
  border-collapse: collapse;
  width: 100%;
  text-align : center;
}

th, td {
  text-align: center;
  padding: 8px;
}

.admin-table tr:nth-child(even){background-color: #DCDCDC}

.admin-table tr {
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

 .ul1_menu1{
			/* padding:10px; */
				font-size: 18px;
			}

			.ul1_menu1 .on{
				background-color: #87827d;
				color:white;
			}
			
			.ul1_menu1 li {
				border-bottom : 1px solid #DCDCDC;
			}


</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#admin-insert").click(function() {
			var url = 'AdminIsrtPop.ad';
			var name = 'AdminIsrtPop';
			var option = 'width = 625, height = 380';
		
			window.open(url,name,option);
		});
		
		$("#adminCho").click(function() {
			$("form").submit();
			$("#adminId").val(null);
		});
		
		$(".chobox").click(function() {
			if(this.checked) {
				$(".chobox").prop("checked" , false);
				$(this).prop("checked" , true);
			}			
		});
		
		$("#admin-delete").click(function() {
			var adminId = "";
			var adminDeleteIndex = 0;
			
			$("input:checkbox[class = 'chobox']").each(function() {
				if(this.checked) {
					adminId = this.value;
					adminDeleteIndex = 1;
				}
			});
			
			if(adminDeleteIndex == 1) {
				var url = "adminDeletePop.ad?adminId=" + adminId;
				var name = "adminDeletePop";
				var option = 'width = 500 , height = 200'; 
				
				window.open(url,name,option);	
			} else {
				alert("삭제할 관리자를 선택해주세요.")
			}
			
 		 	
		});
		
	}); 
	
</script>

<body style="background-color: white;">

<%@ include file="../all/header.jsp" %>

<div style="display:flex;">
<!-- 	<div style="width: 12%; height: 100%; float:left;">
		<div style="width: 100%; height: 10%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 40px; ">
			<p style="font-size:20px; color: #ABC927; position : relative; top : 20px;">시스템 관리</p>
		</div>
		
		<div style="width: 100%; height: 50%; ">
			<ul class="ul1_menu1" style="line-height: 30px;">
				<li><a href="noticeManagement.ad">공지사항 관리</a></li>
				<li class="on"><a href="/admin_management.ad">> 관리자 계정 관리</a></li>
				<li><a href="user_management.ad">사용자 관리</a></li>
				<li><a href="group_management.ad">그룹 관리</a></li>
				<li><a href="project_management.ad">프로젝트 관리</a></li>
			</ul>
		</div>
	</div> -->
	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 120px;">
			<p style="font-size:30px; color: #ABC927;">시스템 관리</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul>
				<li><a href="noticeManagement.ad">공지사항 관리</a></li>
				<li><a href="project_management.ad">프로젝트 관리</a></li>	
				<li><a href="user_management.ad">사용자 관리</a></li>
				<li><a href="group_management.ad">그룹 관리</a></li>
				<c:if test = "${sessionScope.auth == 'S'}">
					<li  class = "on"><a href="admin_management.ad">> 관리자 계정 관리</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<div class="content"  style="width: 60%; height: 730px; background-color : white; margin-top : 30px; margin-left : 200px;">
		<div style = "border:1px solid #d3d3d3; width : 1200px; height : 90%;">
			<div style="width: 96%; height: 30px; border-bottom: 3px solid #17366E; margin: 0 auto;">
				<h2>관리자 계정 관리</h2>
			</div>
			
			<div style = "width : 83%; height : 7%; background-color : #DCDCDC; margin-top : 30px; margin-left : 100px; ">
				<div style = "margin : 0 auto; top : 10px; left : 50px; position : relative;">
					<form action = "admin_management.ad" method = "POST">
						 <div style = "display : flex; font-weight : bold;">ID : &nbsp;&nbsp;&nbsp; <input  style = "" name = "adminId" type = "text"/></div> 
						 <button class = "btn-primary" style = "float : right; width : 50px; height : 30px; margin-right : 80px; margin-bottom : 10px; bottom : 22px; position : relative;"id = "adminCho">검색</button>
					</form>
				</div>
			</div>
			
			<div style = "width : 83%; height : 80%; margin : 0 auto;">
			
				<table  class = "admin-table" style = "border-bottom : 1px solid black; margin-top : 10px;'">
					<tr style = "border-bottom : 1px solid black;">
						<th style = "width : 163px; height : 40px;">선택</th>
						<th style = "width : 163px; height : 40px;">번호</th>
						<th style = "width : 163px; height : 40px;">그룹명</th>
						<th style = "width : 163px; height : 40px;">ID</th>
						<th style = "width : 163px; height : 40px;">사용자명</th>
						<th style = "width : 163px; height : 40px;">등록일자</th>
						<th style = "width : 163px; height : 40px;">최종 접속 일자</th>
					</tr>
					
					<c:if test = "${cnt == 0}">
						<tr>
							<td colspan = "7">등록된 관리자가 없습니다.</td>
						</tr>
					</c:if>
						
					<c:if test = "${cnt > 0}">
						<c:forEach var = "admin" items = "${adminList}">
							<tr>
								<td>
									<input type = "checkbox"  class = "chobox"  name = "${admin.seq}" value = "${admin.id}"/>
								</td>
								<td>${admin.rownum}</td>
								<td>${admin.group_name}</td>
								<td>${admin.id}</td>
								<td>${admin.name}</td>
								<td>${admin.ins_date}</td>
								<td>${admin.last_access_dt}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				
				<div style = "margin-top : 30px; margin-left : 465px; display : flex; position : relative;">
					<table style="width: 90%;">
						<tr>
							<th align="center" style = "">
								<c:if test="${cnt > 0}">
								
									<c:if test="${startPage > pageBlock}">
										<a href="admin_management.ad?pageNum=${startPage - pageBlock}"><img style = "" src="${imagePath}page_left.png"/></a>
									</c:if>
									
									<div style = "display : flex; bottom : 10px; width : 50px; position : relative;">
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i==currentPage}">
												<span><b><img style = "width : 25px ; height : 25px;  margin-right : 15px; margin-left : 8px;" src="${imagePath}page_${i}.png"/></b></span>
											</c:if>	
											<c:if test="${i!=currentPage}">
												<a href="admin_management.ad?pageNum=${i}"><img style = " width : 25px ; height : 25px; margin-right : 10px;" src="${imagePath}page_${i}.png"/></a>
											</c:if>	
										</c:forEach>
									</div>
									
									<c:if test="${pageCount > endPage}">
										<a href="admin_management.ad?pageNum=${startPage + pageBlock}"><img src= "${imagePath}page_right.png"/></a>
									</c:if>
									
								</c:if>
							</th>
						</tr>
					</table>
					
					<div style = "display : flex;">
						<input type ="button" class = "btn-primary" id = "admin-insert"  value = "관리자 등록"/>
						<input type ="button" class = "btn-primary" id = "admin-delete"  value = "관리자 삭제"/>
					</div>
			
				</div>
			</div>
		
		</div>
	</div>
</div>

<%@ include file="../all/footer.jsp" %>
</body>
</html>