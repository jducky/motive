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
	
	.notice-table th, td {
	  text-align: center;
	  padding: 8px;
	}
	
	.notice-table tr:nth-child(even){background-color: #DCDCDC;}
	
	.notice-table tr {
		border-bottom : 1px solid black;
		height : 40px;
	}
	
	.notice-table th {
	  color: black;
	}
	
	.notice-table tr {
		background-color : white;
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
	
	
	
	

           /*RESET*/
           li { list-style: none; }
           /*BODY*/
           #nav {
               width: 25%;
               height : 500px;
           }
           #nav:after {
               content: "";
               display: block;
               clear: both;
           }

           .main {
               margin: 30px;
           }

           .main>li {
               position: relative;
               float: left;
               width: 120px;
               height: 30px;
               box-sizing: border-box;
               line-height: 30px;
               text-align: left;
               background: white;
               bottom : 26px;
               left : 35px;
               border : 1px solid black;
           }

         /*   .main>li:hover .sub {
               display: block;
               width  : 250px;
               border : 1px solid #eee;
           } */
			
		   .subOn {
		   	   display: block;
               width  : 250px;
               border : 1px solid #eee;
               background: white;
		   }
		
			.subOn li:hover {
				color : blue;
           		text-decoration: underline;
			}
			
			.subOn li {
				border-bottom : 1px solid #eee;
			}
			
           .sub {
               display: none;
               position: absolute;
               top: 30px;
               left: 0;
               z-index: 1;
               width: 100px;
               background: white;
               opacity: 1;
           }
           
           .main  p {
           	 margin-left : 10px;
           }
           
           .main>li:hover .sub li {
           		border-bottom : 1px solid #eee;
           }
           
           .main>li:hover .sub li:hover {
           		color : blue;
           		text-decoration: underline;
           }
           
           #startDate {
           		width : 80px;
           		height : 15px;
           		margin-left : 10px;
           }
           
           
           #endDate {
           		width : 80px;
           		height : 15px;
           		margin-left : 10px;
           }
           
           #noticeInsPop {
           		position : relative;
           		bottom : 18px;
           		float : right;
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
			
			
			.project-table tr {
				border : 1px solid #DBDBDB;
			}
			
			.project-table {
			  border-collapse: collapse;
			  width: 100%;
			  text-align : center;
			}

			.project-table  td {
			  text-align: center;
			  padding: 12px;
			  border : 1px solid #DBDBDB;
			}
			
			.project-table th {
				background-color : rgb(242, 242,242);
				text-align: center;
				padding: 12px;
			 	border : 1px solid #DBDBDB;
			}
           
</style>
<!-- table.type02 { border-collapse: separate; border-spacing: 0; text-align: left; line-height: 1.5; border-top: 1px solid #ccc; border-left: 1px solid #ccc; margin : 20px 10px; } table.type02 th { width: 150px; padding: 10px; font-weight: bold; vertical-align: top; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; border-top: 1px solid #fff; border-left: 1px solid #fff; background: #eee; } table.type02 td { width: 350px; padding: 10px; vertical-align: top; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; -->

<script type="text/javascript">
	$(function() {
		var groupRowSpan = 0;
		var groupAdminIndex = 0;
		var groupName = "";
		var groupAdmin = "";
		
		
		<c:forEach items="${adminList}" var="admin">
			if("${admin.authority}" == 'A' && "${admin.mem_group_seq}" != 0) {
				if(groupAdminIndex == 0) {
					groupName = "${admin.group_name}"					
					groupAdmin = "${admin.id}";
					groupAdminIndex = 1;
				} else {
					groupAdmin += "," + "${admin.id}";
				}
			}
			groupRowSpan += 1;
		</c:forEach>
		
		$("#groupRowSpan").attr('rowspan' , groupRowSpan);
		$("#groupAdmin").text(groupAdmin);
		$("#groupName").text(groupName);
		
		$("#groupIns").click(function() {
			var url = "groupInsPop.ad";
			var name = 'groupIns';
			var option = 'width = 560, height = 250';
			
			window.open(url,name,option);
		});
		
		$("#operator-table tbody tr").click(function() {
			var trId = $(this).attr("id");
			
			var url = "groupDetailPop.ad?select_groupSeq=" + trId;
			var name = 'groupDetailPop';
			var option = 'width = 560 , height = 500';
			
			window.open(url,name,option);
		});
		
		$("#userSetting").click(function() {
			var url = "groupMemberSettingPop.ad?version=U";
			var name = 'groupMemberSetting';
			var option = 'width = 730 , height = 500';
			
			window.open(url,name,option);
		});
		
	});
</script>



<body style="background-color: white;">

<%@ include file="../all/header.jsp" %>

<div style="display:flex;">
	
	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 120px;">
			<p style="font-size:30px; color: #ABC927;">시스템 관리</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul>
				<li><a href="noticeManagement.ad">공지사항 관리</a></li>
				<li><a href="project_management.ad">프로젝트 관리</a></li>	
				<li><a href="user_management.ad">사용자 관리</a></li>
				<li class = "on"><a href="group_management.ad">> 그룹 관리</a></li>
				<c:if test = "${sessionScope.auth == 'S'}">
					<li><a href="admin_management.ad">관리자 계정 관리</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	
	<div class="content"  style="width: 60%; height: 730px; background-color : white; margin-top : 30px; margin-left : 200px;">
		<div style = "border:1px solid #d3d3d3; width : 1200px; height : 90%;">
			<div style="width: 96%; height: 30px; border-bottom: 3px solid #17366E; margin: 0 auto;">
				<h2>그룹 관리</h2>
			</div>
			
			
			<div style = "width : 83%; height : 80%; margin : 0 auto;">
				<c:if test="${sessionScope.auth == 'S'}">
					<table id="operator-table" class = "notice-table" style = "border-bottom : 1px solid black; margin-top : 6%;">
						<thead>
							<tr style = "border-bottom : 1px solid black;">
								<th style = "width : 70px; height : 40px;">번호</th>
								<th style = "width : 163px; height : 40px;">그룹명</th>
								<th style = "width : 163px; height : 40px;">삭제</th>
							</tr>
						</thead>
					
						<tbody>
						
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="4">등록된 그룹이 없습니다.</td>
								</tr>
							</c:if>
								
						
							<c:if test="${cnt > 0}">
								<c:forEach var="vo" items="${groupList}">
									<tr id="${vo.seq}">
										<td>${vo.rownum}</td>
										<td>${vo.group_name}</td>
										<td>
											<input class = "btn-primary" style = "width : 50px; height : 25px;" type = "button" value = "삭제"/>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				
					<div style = "margin-top : 30px; margin-left : 465px; display : flex; position : relative;">
						<table style="width: 90%;">
							<tr>
								<th align="center" style = "">
									
									
									<c:if test="${cnt > 0}">
									
										<c:if test="${startPage > pageBlock}">
											<a href="noticeManagement.ad?pageNum=${startPage - pageBlock}"><img style = "" src="${imagePath}page_left.png"/></a>
										</c:if>
										
										<div style = "display : flex; bottom : 10px; position : relative;">
											<c:forEach var="i" begin="${startPage}" end="${endPage}">
												<c:if test="${i==currentPage}">
													<span><b><img style = "width : 25px ; height : 25px; margin-right : 15px; margin-left : 8px; " src="${imagePath}page_${i}.png"/></b></span>
												</c:if>	
												<c:if test="${i!=currentPage}">
													<a href="getMemberGroupData.ad?pageNum=${i}"><img style = " width : 25px ; height : 25px; margin-right : 10px;" src="${imagePath}page_${i}.png"/></a>
												</c:if>	
											</c:forEach>
										</div>
										
										<c:if test="${pageCount > endPage}">
											<a href="getMemberGroupData.ad?pageNum=${startPage + pageBlock}"><img src= "${imagePath}page_right.png"/></a>
										</c:if>
										
									</c:if>
								</th>
							</tr>
						</table>
						<button  style = "width : 80px;" id = "groupIns" class = "btn-primary">그룹 등록</button>
					</div>
				</c:if>
				<c:if test="${sessionScope.auth == 'A'}">
					<table class = "project-table" style="margin-top : 5%;">
						<tr>
							<th>그룹명</th>
							<td colspan="3"  id="groupName" style = "text-align : left; text-indent : 7px;"></td>
						</tr>
						
						<tr>
							<th>그룹 관리자</th>
							<td id="groupAdmin" style="text-align : left; text-indent : 7px;" colspan="3"></td>
						
						</tr>
						
						<tr>
						
							<th id ="groupRowSpan" rowspan="">그룹원</th>
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
					<input type="button" id = "userSetting" style = "height : 24px; width : 95px; float : right; margin-top : 1%;" class = "btn-primary" value="그룹원 설정"/>
				</c:if>
				
			</div>
		
		</div>
	</div>
</div>

<%@ include file="../all/footer.jsp" %>
</body>
</html>